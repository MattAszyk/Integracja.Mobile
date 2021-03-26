import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_details/game_details_controller.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/pages/game_details/appbar.dart';
import 'package:integracja/pages/game_details/body.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetails extends StatelessWidget {
  final int _gameId;

  GameDetails(this._gameId);

  @override
  Widget build(BuildContext context) {
    var _gameDetailsController = Get.put(GameDetailsController(_gameId));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Obx(() {
        if (_gameDetailsController.state is GameDetailsLoading)
          return Logo();
        else if (_gameDetailsController.state is GameDetailsLoaded)
          return CustomScrollView(
            slivers: <Widget>[
              GameDetailsAppBar(
                  (_gameDetailsController.state as GameDetailsLoaded)
                      .detailGameUser),
              GameDetailsBody(
                  (_gameDetailsController.state as GameDetailsLoaded)
                      .detailGameUser),
            ],
          );
        else
          return Container();
      }),
    );
  }
}
