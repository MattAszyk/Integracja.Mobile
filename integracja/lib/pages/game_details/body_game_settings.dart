import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';

class GameDetailsBodyGameSettings extends StatelessWidget {
  final Game _game;
  GameDetailsBodyGameSettings(this._game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ustawienia gry",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Początek: ${_game.startTime}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Koniec: ${_game.endTime}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Maksymalna liczba graczy: ${_game.maxPlayersCount}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Ilość pytań: ${_game.questionsCount}",
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
