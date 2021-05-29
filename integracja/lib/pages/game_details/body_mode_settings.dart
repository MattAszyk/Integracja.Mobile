import 'package:flutter/material.dart';
import 'package:integracja/models/game/gamemode.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetailsBodyModeSettings extends StatelessWidget {
  final Gamemode _gameMode;
  String timeForFullQuiz;
  String timeForOneQuestion;
  GameDetailsBodyModeSettings(this._gameMode) {
    if (_gameMode.timeForFullQuiz == null)
      timeForFullQuiz = 'nieograniczony';
    else
      timeForFullQuiz = _gameMode.timeForFullQuiz.toString() + ' sekund';

    if (_gameMode.timeForOneQuestion == null)
      timeForOneQuestion = 'nieograniczony';
    else
      timeForOneQuestion = _gameMode.timeForOneQuestion.toString() + ' sekund';
  }

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
          "Czas na cały quiz: $timeForFullQuiz",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Czas na pytanie: $timeForOneQuestion",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Liczba żyć: ${_gameMode.numberOfLives == null || _gameMode.numberOfLives == 0 ? '∞' : _gameMode.numberOfLives}",
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
