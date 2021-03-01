import 'package:flutter/material.dart';
import 'package:integracja/pages/game_details/body_game_settings.dart';
import 'package:integracja/pages/game_details/body_mode_settings.dart';
import 'package:integracja/pages/game_details/body_players.dart';

class GameDetailsBody extends StatelessWidget {
  const GameDetailsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GameDetailsBodyGameSettings(),
            GameDetailsBodyModeSettings(),
            GameDetailsBodyPlayers(),
          ],
        ),
      ),
    );
  }
}
