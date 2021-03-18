import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/home_page/home_page_state.dart';
import 'package:integracja/network/api/game_repository.dart';

class HomePageController extends GetxController {
  HomePageController();
  final _homePageStateStream = HomePageState().obs;
  HomePageState get state => _homePageStateStream.value;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    try {
      _homePageStateStream.value = HomePageLoading();
      var gameList = await GameRepository.fetchAll();
      _homePageStateStream.value = HomePageLoaded(gameList);
    } catch (e) {
      log('_loadData error: ${e.toString()}');
    }
  }
}
