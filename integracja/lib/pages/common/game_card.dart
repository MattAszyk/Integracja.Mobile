import 'package:flutter/material.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/utils/constrains.dart';

class GameCard extends StatelessWidget {
  final Game game;
  String _text;
  int _seconds;
  Color _incoming = Color(0xffE09F36);
  Color _active = Color(0xff36E0BB);
  Color _finished = Color(0xffe03655);
  Color _color = Colors.black;

  // 1 - active, 2 - icnoming, 3 - finished
  int _state;

  GameCard(this.game) {
    DateTime now = DateTime.now();

    _seconds = game.endTime.difference(DateTime.now()).inSeconds;
    int seconds = _seconds;

    int hours = (seconds / 3600).floor();
    seconds %= 3600;
    int minutes = (seconds / 60).floor();

    String zero = (minutes > 9) ? '' : '0';

    if (now.isAfter(game.endTime)) {
      _state = 3;
      _color = _finished;
      _text = 'Gra zakończona ${game.endTime}';
    } else if (now.isAfter(game.startTime) && now.isBefore(game.endTime)) {
      _state = 1;
      _color = _active;
      _text = 'Pozostało $hours:$zero${minutes}h';
    } else {
      _state = 2;
      _color = _incoming;
      _text = 'Zaczynamy za $hours:$zero${minutes}h';
    }
  }

  Column gameLeadingBasedOnState(int state) {
    switch (state) {
      case 1:
        return Column(
          children: [
            Icon(
              Icons.play_arrow_outlined,
              size: 40,
              color: _color,
            ),
            Text(
              "AKTYWNA",
              style: new TextStyle(fontSize: 10, color: _color),
            )
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Icon(
              Icons.hourglass_empty_outlined,
              size: 41,
              color: _color,
            ),
            Text(
              "WKRÓTCE",
              style: new TextStyle(fontSize: 10, color: _color),
            ),
          ],
        );
        break;
      case 3:
        return Column(
          children: [
            Icon(
              Icons.close,
              size: 40,
              color: _color,
            ),
            Text(
              "KONIEC",
              style: new TextStyle(fontSize: 10, color: _color),
            )
          ],
        );
        break;
    }

    return null;
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
            child: gameLeadingBasedOnState(_state)),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: _color,
          size: 35,
        ),
        title: Text(
          game.name,
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
