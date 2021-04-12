import 'package:flutter/material.dart';
import 'package:integracja/models/game/gamemode.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetailsBodyModeSettings extends StatelessWidget {
  final Gamemode _gameMode;
  GameDetailsBodyModeSettings(this._gameMode);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ustawienia trybu",
          style: TextStyle(
            fontSize: textBigSize,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Nazwa trybu: ${_gameMode.name}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Czas na cały quiz: ${_gameMode.timeForFullQuiz} sekund",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Czas na pytanie: ${_gameMode.timeForOneQuestion} sekund",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Ilość żyć: ${_gameMode.numberOfLives}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
