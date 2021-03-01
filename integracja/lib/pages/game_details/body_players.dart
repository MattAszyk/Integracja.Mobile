import 'package:flutter/material.dart';

class GameDetailsBodyPlayers extends StatelessWidget {
  const GameDetailsBodyPlayers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      title: Text(
        "Gracze",
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "6/10",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      children: <Widget>[
        Text(
          "Agnieszka Uznańska",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Maciej Aszyk",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Jakub Fladziński",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Michał Guźlewski",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Mikołaj Suchodolski",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Michał Wiciński",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
