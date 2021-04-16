import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_history/game_history_controller.dart';
import 'package:integracja/controllers/game_history/game_history_state.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/utils/constrains.dart';

class GameHistory extends StatefulWidget {
  final int gameId;
  GameHistoryController _gameHistoryController;
  GameHistory(this.gameId) {
    _gameHistoryController = Get.put(GameHistoryController(gameId));
  }
  @override
  _GameHistoryState createState() => _GameHistoryState();
}

class _GameHistoryState extends State<GameHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Obx(() {
        if (widget._gameHistoryController.state is GameHistoryLoading)
          return Logo();
        else if (widget._gameHistoryController.state is GameHistoryLoaded)
          return GameHistoryBody();
        else
          return Container();
      }),
    );
  }
}

class GameHistoryBody extends StatelessWidget {
  const GameHistoryBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text('Podsumowanie gry'),
      ),
    );
  }
}