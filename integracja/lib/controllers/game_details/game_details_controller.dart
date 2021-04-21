import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/pages/play/play.dart';

class GameDetailsController extends GetxController {
  int _gameId;
  final bool play;
  GameDetailsController(this._gameId, this.play);
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

      if (play)
        Get.off(() => Play(game));
      else
        _homePageStateStream.value = GameDetailsLoaded(game);
    } catch (e) {
      log('error with fetching ${e.toString()}');
    }
  }
}
