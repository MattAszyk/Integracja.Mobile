import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_details/game_details_controller.dart';
import 'package:integracja/controllers/game_details/game_details_state.dart';
import 'package:integracja/pages/game_details/appbar.dart';
import 'package:integracja/pages/game_details/body.dart';
import 'package:integracja/utils/constrains.dart';

class GameDetails extends StatelessWidget {
  final int _gameId;
  GameDetailsController _gameDetailsController;
  GameDetails(this._gameId) {
    _gameDetailsController = Get.put(GameDetailsController(_gameId));
  }

  Column _loading() {
    return Column(
      children: [
        Spacer(),
        Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Obx(() {
        if (_gameDetailsController.state is GameDetailsLoading)
          return _loading();
        else if (_gameDetailsController.state is GameDetailsLoaded)
          return CustomScrollView(
            slivers: <Widget>[
              GameDetailsAppBar(
                  (_gameDetailsController.state as GameDetailsLoaded).gameUser),
              GameDetailsBody(
                  (_gameDetailsController.state as GameDetailsLoaded).gameUser),
            ],
          );
        else
          return Container();
      }),
    );
  }
}
