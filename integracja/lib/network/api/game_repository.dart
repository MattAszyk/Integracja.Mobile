import 'package:flutter/cupertino.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api_base.dart';

class GameRepository extends ApiBase {
  GameRepository(User user) : super(user: user);
  Future<List<GameUser>> fetchAll() async {
    Iterable list =
        await request(requestType: RequestType.GET, api: API.Games_MyGames);
    return List<GameUser>.from(list.map((e) => GameUser.fromJson(e)));
  }
}
