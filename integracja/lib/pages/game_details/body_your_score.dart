import 'package:flutter/material.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetailsBodyYourScore extends StatelessWidget {
  final GameUser _gameUser;
  GameDetailsBodyYourScore(this._gameUser);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Twój wynik",
          style: TextStyle(
            fontSize: textBigSize,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Liczba punktów: ${_gameUser.gameScore}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Liczba odpowiedzi: ${_gameUser.answeredQuestions}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Poprawne odpowiedzi: ${_gameUser.correctlyAnsweredQuestions}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Błędne odpowiedzi: ${_gameUser.incorrectlyAnsweredQuestions}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
