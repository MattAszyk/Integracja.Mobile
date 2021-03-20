import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/utils/constrains.dart';

class GameCard extends StatelessWidget {
  Game _game;
  String _text;
  int _minutes;
  Color _incoming = Color(0xffE09F36);
  Color _active = Color(0xff36E0BB);
  Color _color = Colors.black;

  GameCard(Game game) {
    this._game = game;

    _minutes = _game.endTime.difference(DateTime.now()).inMinutes;

    int posMinutes = (_minutes.isNegative) ? (_minutes * (-1)) : _minutes;
    int hours = posMinutes ~/ 60;

    if (_minutes > 0) {
      _text =
          'Pozostało ${hours.toString()}:${(posMinutes - hours * 60).toString()}h';
      _color = _active;
    } else {
      _text =
          'Pozostało ${hours.toString()}:${(posMinutes - hours * 60).toString()}h';
      _color = _incoming;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff30334a),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: backgroundColor))),
          child: Column(
            children: _minutes > 0
                ? [
                    Icon(
                      Icons.play_arrow_outlined,
                      size: 40,
                      color: _active,
                    ),
                    Text(
                      "AKTYWNA",
                      style: new TextStyle(fontSize: 10, color: _active),
                    )
                  ]
                : [
                    Icon(
                      Icons.hourglass_empty_outlined,
                      size: 41,
                      color: _incoming,
                    ),
                    Text(
                      "WKRÓTCE",
                      style: new TextStyle(fontSize: 10, color: _incoming),
                    )
                  ],
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: _color,
          size: 35,
        ),
        title: Text(
          _game.name,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
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
