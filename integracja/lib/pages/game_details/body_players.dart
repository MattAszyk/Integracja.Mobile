import 'package:flutter/material.dart';
import 'package:integracja/models/game/detail_game_user.dart';

class GameDetailsBodyPlayers extends StatelessWidget {
  final DetailGameUser game;
  String _maxPlayers;
  GameDetailsBodyPlayers(this.game) {
    _maxPlayers = (game.game.players.length == 0)
        ? '∞'
        : game.game.players.length.toString();
  }

  @override
  Widget build(BuildContext context) {
    String _maxPlayers;
    _maxPlayers = (game.game.players.length == 0)
        ? '∞'
        : game.game.players.length.toString();
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      title: Text(
        "Gracze",
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "${game.game.players.length.toString()}/$_maxPlayers",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      children: <Widget>[
        for (var player in game.game.players)
          Column(
            children: [
              Text(
                player.username,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
      ],
    );
  }
}
