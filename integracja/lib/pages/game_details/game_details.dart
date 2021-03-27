import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_details/game_details_controller.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/pages/game_details/appbar.dart';
import 'package:integracja/pages/game_details/body.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetails extends StatefulWidget {
  final int gameId;
  GameDetailsController _gameDetailsController;
  GameDetails(this.gameId) {
    _gameDetailsController = Get.put(GameDetailsController(gameId));
  }

  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Obx(() {
        if (widget._gameDetailsController.state is GameDetailsLoading)
          return Logo();
        else if (widget._gameDetailsController.state is GameDetailsLoaded)
          return CustomScrollView(
            slivers: <Widget>[
              GameDetailsAppBar(
                  (widget._gameDetailsController.state as GameDetailsLoaded)
                      .detailGameUser),
              GameDetailsBody(
                  (widget._gameDetailsController.state as GameDetailsLoaded)
                      .detailGameUser),
            ],
          );
        else
          return Container();
      }),
    );
  }
}
