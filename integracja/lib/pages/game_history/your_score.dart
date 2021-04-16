import 'package:flutter/material.dart';
import 'package:integracja/models/game/history.dart';
import 'package:integracja/utils/constrains.dart';

class YourScore extends StatelessWidget {
  const YourScore({
    Key key,
    @required History history,
  })  : _history = history,
        super(key: key);

  final History _history;

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
          "Liczba punktów: ${_history.gameScore}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Liczba odpowiedzi: ${_history.answeredQuestions}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Poprawne odpowiedzi: ${_history.correctlyAnsweredQuestions}",
          style: TextStyle(
            fontSize: textDefaultSize,
            color: Colors.grey,
          ),
        ),
        Text(
          "Błędne odpowiedzi: ${_history.incorrectlyAnsweredQuestions}",
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
