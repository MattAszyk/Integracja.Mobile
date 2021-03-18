import 'package:flutter/material.dart';
import 'package:integracja/models/game/detail_game_user.dart';

class GameDetailsBodyCurrentState extends StatelessWidget {
  final DetailGameUser _gameUser;
  GameDetailsBodyCurrentState(this._gameUser);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Aktualny stan",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Ilość punktów: ${_gameUser.gameScore}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Odpowiedziane pytania: ${_gameUser.answeredQuestions}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Poprawne odpowiedzi: ${_gameUser.correctlyAnsweredQuestions}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Błędne odpowiedzi: ${_gameUser.incorrectlyAnsweredQuestions}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
