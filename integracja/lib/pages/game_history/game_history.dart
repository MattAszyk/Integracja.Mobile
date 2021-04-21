import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_history/game_history_controller.dart';
import 'package:integracja/controllers/game_history/game_history_state.dart';
import 'package:integracja/models/game/game_user_questions.dart';
import 'package:integracja/models/game/history.dart';
import 'package:integracja/models/game/player_scores.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/pages/game_history/your_score.dart';
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
          return GameHistoryBody(
              (widget._gameHistoryController.state as GameHistoryLoaded)
                  .detailGameUser);
        else
          return Container();
      }),
    );
  }
}

class GameHistoryBody extends StatelessWidget {
  final History _history;
  GameHistoryBody(this._history);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: YourScore(history: _history),
              ),
              YourAnswers(gameUserQuestions: _history.gameUserQuestions),
              PlayersScore(_history.playerScores),
            ],
          ),
        ),
      ),
    );
  }
}

class YourAnswers extends StatelessWidget {
  const YourAnswers({
    Key key,
    @required List<GameUserQuestions> gameUserQuestions,
  })  : _gameUserQuestions = gameUserQuestions,
        super(key: key);

  final List<GameUserQuestions> _gameUserQuestions;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0.0),
      initiallyExpanded: false,
      title: Text(
        "Odpowiedzi",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: textBigSize,
          color: Colors.white,
        ),
      ),
      children: <Widget>[
        for (var question in _gameUserQuestions)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  (_gameUserQuestions.indexOf(question) + 1).toString() +
                      '. ' +
                      question.question.content,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: textDefaultSize,
                  ),
                ),
              ),
              for (var answer in question.question.answers)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '- ' + answer.content,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              SizedBox(height: 5.0),
              Divider(
                height: 2.0,
              ),
              SizedBox(height: 5.0),
            ],
          ),
      ],
    );
  }
}

class PlayersScore extends StatelessWidget {
  PlayersScore(this._playersScore) {}

  final List<PlayerScores> _playersScore;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0.0),
      initiallyExpanded: false,
      title: Text(
        "Ranking graczy",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: textBigSize,
          color: Colors.white,
        ),
      ),
      children: <Widget>[
        for (var player in _playersScore)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    (_playersScore.indexOf(player) + 1).toString() + '.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  CircleAvatar(
                    radius: 10.0,
                    backgroundImage: NetworkImage(player.profileThumbnail),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    player.username +
                        ' ( punkty: ' +
                        player.gameScore.toString() +
                        ' )',
                    style: TextStyle(
                      fontSize: textDefaultSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
            ],
          ),
      ],
    );
  }
}
