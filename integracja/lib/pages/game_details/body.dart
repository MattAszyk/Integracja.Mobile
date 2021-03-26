import 'package:flutter/material.dart';
import 'package:integracja/models/game/detail_game_user.dart';
import 'package:integracja/pages/game_details/body_game_settings.dart';
import 'package:integracja/pages/game_details/body_mode_settings.dart';
import 'package:integracja/pages/game_details/body_players.dart';

import 'body_your_score.dart';

class GameDetailsBody extends StatelessWidget {
  final DetailGameUser _gameUser;
  GameDetailsBody(this._gameUser);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GameDetailsBodyYourScore(_gameUser),
            GameDetailsBodyGameSettings(_gameUser.game),
            GameDetailsBodyModeSettings(_gameUser.game.gamemode),
            GameDetailsBodyPlayers(_gameUser),
          ],
        ),
      ),
    );
  }
}
