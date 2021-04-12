import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/utils/constrains.dart';
import 'package:intl/intl.dart';

class GameDetailsBodyGameSettings extends StatelessWidget {
  final Game _game;
  GameDetailsBodyGameSettings(this._game);

  @override
  Widget build(BuildContext context) {
    String _formattedStartTime =
        DateFormat('dd.MM.yyyy kk:mm').format(_game.startTime);
    String _formattedEndTime =
        DateFormat('dd.MM.yyyy kk:mm').format(_game.endTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ustawienia gry",
          style: TextStyle(
            fontSize: textBigSize,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Początek: $_formattedStartTime",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Koniec: $_formattedEndTime",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Maksymalna liczba graczy: ${_game.maxPlayersCount}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Ilość pytań: ${_game.questionsCount}",
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
