import 'package:flutter/material.dart';

class GameDetailsBodyGameSettings extends StatelessWidget {
  const GameDetailsBodyGameSettings({
    Key key,
  }) : super(key: key);

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
          "Początek: 23.02.2021 16:44",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Koniec: 23.02.2021 16:44",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Maksymalna liczba graczy: 10",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          "Ilość pytań: 20",
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
