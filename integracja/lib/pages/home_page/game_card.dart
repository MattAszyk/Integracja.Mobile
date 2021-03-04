import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';

class GameCard extends StatelessWidget {
  Game _game;
  String _text;
  int _minutes;
  Color _color = Colors.black;

  GameCard(Game game) {
    this._game = game;

    /*if (game.gameState == 1) {
      _text = 'active';
      _color = Colors.green;
    } else if (game.gameState == 2) {
      _text = 'starting soon';
      _color = Colors.orange;
    }

    _minutes = 1; //_game.endTime.difference(DateTime.now()).inMinutes;
    int hours = _minutes ~/ 60;
    _text += ' (' +
        hours.toString() +
        ':' +
        (_minutes - hours * 60).toString() +
        'h left)';
        */
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                //trailing: _game.gameState == 1
                trailing: 1 == 1
                    ? ElevatedButton(
                        onPressed: () {},
                        child: Text('Play'),
                      )
                    : null,
                title: Text(
                  //_game.name,
                  "Integracja z zespołem IT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  //_text,
                  'active',
                  style: TextStyle(
                    //color: _color,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
