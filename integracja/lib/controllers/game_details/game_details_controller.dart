import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/network/api_exception.dart';

class GameDetailsController extends GetxController {
  int _gameId;
  GameDetailsController(int gameId) {
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
      var game = await GameRepository.fetchById(_gameId);

      _homePageStateStream.value = GameDetailsLoaded(game);
    } on UnauthorizedException {
      log('User logged out');
      Get.find<AuthenticationController>().signOut();
      Get.back();
    } catch (e) {
      log('error with fetching ${e.toString()}');
    }
  }
}
