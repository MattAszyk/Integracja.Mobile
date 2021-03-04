import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api/game_repository.dart';

class GameDetailsController extends GetxController {
  User _user;
  int _gameId;
  GameDetailsController(int gameId) {
    AuthenticationController authenticationController = Get.find();
    if (authenticationController.state is Authenticated) {
      _user = (authenticationController.state as Authenticated).user;
    } else {
      authenticationController.signOut();
    }

    _gameId = gameId;
  }
  final _homePageStateStream = GameDetailsState().obs;
  GameDetailsState get state => _homePageStateStream.value;
  @override
  void onInit() {
    _homePageStateStream.value = GameDetailsLoading();
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    try {
      var game = await GameRepository(_user).fetchById(_gameId);
      log(game.toString());

      log('game loaded');
      _homePageStateStream.value = GameDetailsLoaded(game);
    } catch (e) {
      log('error with fetching ${e.toString()}');
    }
  }
}
