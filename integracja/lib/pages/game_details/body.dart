import 'package:flutter/material.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/pages/game_details/body_game_settings.dart';
import 'package:integracja/pages/game_details/body_mode_settings.dart';
import 'package:integracja/pages/game_details/body_players.dart';
import 'package:get/get.dart';
import 'package:integracja/pages/game_history/game_history.dart';
import 'package:integracja/pages/play/play.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetailsBody extends StatelessWidget {
  final GameUser _gameUser;
  GameDetailsBody(this._gameUser);

  @override
  Widget build(BuildContext context) {
    Center button() {
      if (!_gameUser.gameOver) {
        return Center(
          child: TextButton(
              onPressed: () {
                Get.to(() => GameHistory(_gameUser.game.id));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Text(
                  'PODSUMOWANIE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textBigSize,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey[100];
                  }
                  return primaryColor;
                }),
              )),
        );
      } else {
        return Center(
          child: TextButton(
              onPressed: () {
                Get.off(() => Play(_gameUser));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Text(
                  'GRAJ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textBigSize,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey[100];
                  }
                  return primaryColor;
                }),
              )),
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ],
        centerTitle: true,
        title: Text(_gameUser.game.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!_gameUser.gameOver)
                Column(
                  children: [
                    button(),
                    SizedBox(height: 10.0),
                  ],
                ),
              GameDetailsBodyGameSettings(_gameUser.game),
              GameDetailsBodyModeSettings(_gameUser.game.gamemode),
              GameDetailsBodyPlayers(_gameUser),
            ],
          ),
        ),
      ),
    );
  }
}
