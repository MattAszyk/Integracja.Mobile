import 'package:flutter/material.dart';
import 'package:integracja/models/game/detail_game_user.dart';
import 'package:integracja/utils/constrains.dart';

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
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      title: Text(
        "Gracze",
        style: TextStyle(
          fontSize: textBigSize,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "${game.game.players.length.toString()}/$_maxPlayers",
        style: TextStyle(
          fontSize: textDefaultSize,
          color: Colors.grey,
        ),
      ),
      children: <Widget>[
        for (var player in game.game.players)
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12.0,
                    backgroundImage: NetworkImage(player.profileThumbnail),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    player.username,
                    style: TextStyle(
                      fontSize: textDefaultSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
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
