import 'package:flutter/material.dart';
import 'package:integracja/pages/game_details/appbar.dart';
import 'package:integracja/pages/game_details/body.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetails extends StatelessWidget {
  final String _gameID;

  GameDetails(this._gameID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          GameDetailsAppBar(),
          GameDetailsBody(),
        ],
      ),
    );
  }
}
