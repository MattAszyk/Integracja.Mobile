import 'package:flutter/material.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetailsBodyPlayers extends StatelessWidget {
  final GameUser game;
  GameDetailsBodyPlayers(this.game);

  @override
  Widget build(BuildContext context) {
    String _maxPlayers = (game.game.maxPlayersCount == 0)
        ? '∞'
        : game.game.maxPlayersCount.toString();

    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      title: Text(
        "Gracze",
        style: TextStyle(
          fontSize: textBigSize,
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: primaryColor,
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
                    radius: 10.0,
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
