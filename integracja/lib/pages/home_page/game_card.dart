import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/utils/constrains.dart';

class GameCard extends StatelessWidget {
  Game _game;
  String _text;
  int _minutes;
  Color _color = Colors.black;

  GameCard(Game game) {
    this._game = game;

    _minutes = _game.endTime.difference(DateTime.now().toUtc()).inMinutes;

    int posMinutes = (_minutes.isNegative) ? (_minutes * (-1)) : _minutes;
    int hours = posMinutes ~/ 60;

    if (_minutes > 0) {
      _text =
          'Rozpoczęta (pozostało ${hours.toString()}:${(posMinutes - hours * 60).toString()}h)';
      _color = Colors.green;
    } else {
      _text =
          'Nadchodząca (za ${hours.toString()}:${(posMinutes - hours * 60).toString()}h)';
      _color = Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        trailing: _minutes > 0
            ? ElevatedButton(
                onPressed: () {},
                child: Text('Graj'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                ),
              )
            : null,
        title: Text(
          _game.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          _text,
          style: TextStyle(
            color: _color,
          ),
        ),
      ),
    );
  }
}
