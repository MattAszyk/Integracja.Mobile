import 'package:flutter/cupertino.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api_base.dart';

class GameRepository extends ApiBase {
  Future<List<GameUser>> fetchAll() {
    return request(requestType: RequestType.GET, api: API.Games_MyGames);
  }
}
