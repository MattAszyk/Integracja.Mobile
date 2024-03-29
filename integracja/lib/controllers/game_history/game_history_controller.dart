import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_history/game_history_state.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/pages/error/error_page.dart';

class GameHistoryController extends GetxController {
  int _gameId;
  GameHistoryController(int gameId) {
    _gameId = gameId;
  }
  final _homePageStateStream = GameHistoryState().obs;
  GameHistoryState get state => _homePageStateStream.value;
  @override
  void onInit() {
    _homePageStateStream.value = GameHistoryLoading();
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    try {
      var game = await GameRepository.fetchGameHistoryById(_gameId);

      _homePageStateStream.value = GameHistoryLoaded(game);
    } on TimeoutException {
      Get.off(() =>
          ErrorPage("Serwer nie odpowiada. Sprawdź połączenie z internetem."));
    } catch (e) {
      log('error with fetching ${e.toString()}');
    }
  }
}
