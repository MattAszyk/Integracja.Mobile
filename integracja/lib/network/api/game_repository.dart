import 'package:get/get.dart';
import 'package:integracja/models/game/detail_game_user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api_base.dart';

class GameRepository {
  static Future<List<GameUser>> fetchAll() async {
    final apiBase = Get.find<ApiBase>();
    Iterable list = await apiBase.request(
      requestType: RequestType.GET,
      api: API.Users_Games,
    );

    return List<GameUser>.from(list.map((e) => GameUser.fromJson(e)));
  }

  static Future<List<GameUser>> fetchAllArchived() async {
    final apiBase = Get.find<ApiBase>();
    Iterable list = await apiBase.request(
      requestType: RequestType.GET,
      api: API.Users_GamesArchived,
    );

    return List<GameUser>.from(list.map((e) => GameUser.fromJson(e)));
  }

  static Future<DetailGameUser> fetchById(int gameId) async {
    final apiBase = Get.find<ApiBase>();
    var response = await apiBase.request(
      requestType: RequestType.GET,
      api: API.Users_Games,
      id: gameId,
    );
    return DetailGameUser.fromJson(response);
  }
}
