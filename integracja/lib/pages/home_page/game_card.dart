import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/utils/constrains.dart';

class GameCard extends StatelessWidget {
  final Game _game;

  GameCard(this._game);

  @override
  Widget build(BuildContext context) {
    String _text;
    int _seconds;
    Color _incoming = Color(0xffE09F36);
    Color _active = Color(0xff36E0BB);
    Color _color = Colors.black;

    _seconds = _game.endTime.difference(DateTime.now()).inSeconds;
    int seconds = _seconds;

    int hours = (seconds / 3600).floor();
    seconds %= 3600;
    int minutes = (seconds / 60).floor();
    seconds %= 60;

    String zero = (minutes > 9) ? '' : '0';

    if (_seconds > 0) {
      _text = 'Pozostało $hours:$zero${minutes}h';
      _color = _active;
    } else {
      _text = 'Pozostało $hours:$zero${minutes}h';
      _color = _incoming;
    }
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
            children: _seconds > 0
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
