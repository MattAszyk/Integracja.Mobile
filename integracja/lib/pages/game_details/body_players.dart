import 'package:flutter/material.dart';
import 'package:integracja/models/game/detail_game_user.dart';

class GameDetailsBodyPlayers extends StatelessWidget {
  final DetailGameUser _game;
  String _maxPlayers;
  GameDetailsBodyPlayers(this._game) {
    _maxPlayers = (_game.game.players.length == 0)
        ? '∞'
        : _game.game.players.length.toString();
  }

  @override
  Widget build(BuildContext context) {
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
        "${_game.game.players.length.toString()}/$_maxPlayers",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      children: <Widget>[
        for (var player in _game.game.players)
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
