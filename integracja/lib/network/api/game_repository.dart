import 'package:flutter/cupertino.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api_base.dart';

class GameRepository extends ApiBase {
  GameRepository({@required User user}) : super(user: user);
  Future<List<GameUser>> fetchAll() {
    return request(requestType: RequestType.GET, api: API.Games_MyGames);
  }
}
