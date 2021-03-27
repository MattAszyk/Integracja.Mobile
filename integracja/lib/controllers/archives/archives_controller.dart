import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/controllers/archives/archives_state.dart';
import 'package:integracja/network/api/game_repository.dart';

class ArchivesController extends GetxController {
  ArchivesController();
  final _homePageStateStream = ArchivesState().obs;
  ArchivesState get state => _homePageStateStream.value;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future<void> refresh() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      _homePageStateStream.value = ArchivesLoading();
      var gameList = await GameRepository.fetchAllArchived();
      _homePageStateStream.value = ArchivesLoaded(gameList);
    } catch (e) {
      log('_loadData error: ${e.toString()}');
    }
  }
}
