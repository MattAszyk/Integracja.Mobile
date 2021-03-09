import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';

class GameDetailsBodyPlayers extends StatelessWidget {
  final Game _game;
  String _maxPlayers;
  List<String> _players;
  GameDetailsBodyPlayers(this._game) {
    _maxPlayers = (_game.maxPlayersCount == 0) ? '∞' : _game.maxPlayersCount;
    _players = List<String>.from(_game.players);
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
        "${_game.players.length}/$_maxPlayers",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      children: <Widget>[
        for (var player in _players)
          Column(
            children: [
              Text(
                player.toString(),
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
