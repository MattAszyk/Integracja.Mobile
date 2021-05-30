import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/pages/game_details/game_details.dart';
import 'package:integracja/utils/constrains.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final bool userFinishedPlay;
  String _text;
  int _seconds;
  Color _incoming = Color(0xffE09F36);
  Color _active = Color(0xff36E0BB);
  Color _finished = Color(0xffe03655);

  Color _iconColor = Colors.black;
  Color _subTitleColor = Colors.black;

  // 1 - active, 2 - icnoming, 3 - finished
  int _gameState;

  GameCard(this.game, this.userFinishedPlay) {
    DateTime now = DateTime.now();
    DateTime time;

    print(game.name +
        " " +
        game.endTime.toString() +
        " " +
        DateTime.now().toString());
    if (now.isAfter(game.endTime)) {
      _gameState = 3;
      time = game.endTime;
    } else if (now.isAfter(game.startTime) && now.isBefore(game.endTime)) {
      _gameState = 1;
      time = game.endTime;
    } else {
      _gameState = 2;
      time = game.startTime;
    }

    _seconds = time.difference(now).inSeconds;
    int seconds = _seconds;
    int days = 0;

    if (seconds > 86400) {
      days = (seconds / 86400).floor();
      seconds %= 86400;
    }

    int hours = (seconds / 3600).floor();
    seconds %= 3600;
    int minutes = (seconds / 60).floor();

    String zero = (minutes > 9) ? '' : '0';

    if (_gameState == 1) {
      _iconColor = _active;
      _subTitleColor = _active;
      if (userFinishedPlay) {
        _subTitleColor = _finished;
        _text = 'Twoja gra dobiegła końca';
      } else {
        if (days > 0)
          _text = 'Pozostało ${days}d $hours:$zero${minutes}h';
        else
          _text = 'Pozostało $hours:$zero${minutes}h';
      }
    } else if (_gameState == 2) {
      _iconColor = _incoming;
      _subTitleColor = _incoming;
      if (days > 0)
        _text = 'Zaczynamy za ${days}d $hours:$zero${minutes}h';
      else
        _text = 'Zaczynamy za $hours:$zero${minutes}h';
    } else {
      _iconColor = _finished;
      _subTitleColor = _finished;
      _text = 'Gra zakończona';
    }
  }

  gameLeadingBasedOnState(int state) {
    switch (state) {
      case 1:
        return Column(
          children: [
            Icon(
              Icons.play_arrow_outlined,
              size: 40,
              color: _iconColor,
            ),
            Text(
              "AKTYWNA",
              style: TextStyle(fontSize: textMicroSize, color: _iconColor),
            ),
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Icon(
              Icons.hourglass_empty_outlined,
              size: 40,
              color: _iconColor,
            ),
            Text(
              "WKRÓTCE",
              style: TextStyle(fontSize: textMicroSize, color: _iconColor),
            ),
          ],
        );
        break;
      case 3:
        return Column(
          children: [
            SizedBox(height: 5.0),
            Icon(
              Icons.power_settings_new,
              size: 30,
              color: _iconColor,
            ),
            SizedBox(height: 5.0),
            Text(
              "WYGASŁA",
              style: TextStyle(fontSize: textMicroSize, color: _iconColor),
            )
          ],
        );
        break;
    }

    return null;
  }

  gameTrailingBasedOnState(int state) {
    if (state == 1) {
      return TextButton(
        onPressed: () => Get.to(() => GameDetails(game.id, true)),
        child: Text(
          'GRAJ',
          style: TextStyle(
            color: Colors.black,
            fontSize: textDefaultSize,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey[100];
            }
            return _iconColor;
          }),
        ),
      );
    } else {
      return null;
    }
  }

  textIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.white,
        ),
        SizedBox(width: 5.0),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff202239),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: backgroundColor),
                  ),
                ),
                child: Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: gameLeadingBasedOnState(_gameState))),
            trailing:
                userFinishedPlay ? null : gameTrailingBasedOnState(_gameState),
            title: Text(
              game.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: textDefaultSize),
            ),
            subtitle: Text(
              _text,
              style: TextStyle(
                color: _subTitleColor,
                fontSize: textSmallSize,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
            child: Column(
              children: [
                Divider(color: primaryLightColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textIcon(
                      Icons.favorite,
                      (game.gamemode.numberOfLives == 0 ||
                              game.gamemode.numberOfLives == null)
                          ? '∞'
                          : game.gamemode.numberOfLives.toString(),
                    ),
                    textIcon(
                      Icons.group,
                      (game.maxPlayersCount == 0 ||
                              game.maxPlayersCount == null)
                          ? '∞'
                          : game.maxPlayersCount.toString(),
                    ),
                    textIcon(
                      Icons.hourglass_full,
                      (game.gamemode.timeForOneQuestion == 0 ||
                              game.gamemode.timeForOneQuestion == null)
                          ? '∞'
                          : game.gamemode.timeForOneQuestion.toString() +
                              ' sekund',
                    ),
                    textIcon(
                      Icons.watch_later_rounded,
                      (game.gamemode.timeForFullQuiz == 0 ||
                              game.gamemode.timeForFullQuiz == null)
                          ? '∞'
                          : game.gamemode.timeForFullQuiz.toString() +
                              ' sekund',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
