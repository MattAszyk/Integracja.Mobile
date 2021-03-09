import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/controllers/home_page/home_page_state.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api/game_repository.dart';

class HomePageController extends GetxController {
  User _user;
  HomePageController() {
    AuthenticationController authenticationController = Get.find();
    if (authenticationController.state is Authenticated) {
      _user = (authenticationController.state as Authenticated).user;
    } else {
      authenticationController.signOut();
    }
  }
  final _homePageStateStream = HomePageState().obs;
  HomePageState get state => _homePageStateStream.value;
  @override
  void onInit() {
    _homePageStateStream.value = HomePageLoading();
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    try {
      var gameList = await GameRepository(_user).fetchAll();
      log(gameList.first.toString());

      log('gameList loaded');
      _homePageStateStream.value = HomePageLoaded(gameList);
    } catch (e) {
      log('error with fetching ${e.toString()}');
    }
  }
}
