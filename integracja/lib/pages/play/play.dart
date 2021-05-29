import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/home_page/home_page_controller.dart';
import 'package:integracja/controllers/play/play_controller.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/pages/play/components/answer_card.dart';
import 'package:integracja/utils/constrains.dart';

class Play extends StatelessWidget {
  final GameUser _detailGameUser;

  Play(this._detailGameUser);

  @override
  Widget build(BuildContext context) {
    PlayController _controller =
        Get.put(PlayController(_detailGameUser.game.id, _detailGameUser));
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(_detailGameUser.game.name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder(
        init: _controller,
        builder: (_) {
          return _controller.notShowGameEnd
              ? _controller.isGameLoaded
                  ? _game()
                  : Logo()
              : _endScreen();
        },
      ),
    );
  }

  Center _endScreen() {
    var _controller = Get.find<PlayController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
                _controller.lastMessage == null
                    ? "Nieznany błąd"
                    : _controller.lastMessage,
                style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<HomePageController>().refresh();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
            ),
            child: Text("POWRÓT"),
          ),
        ],
      ),
    );
  }

  Padding _game() {
    var _controller = Get.find<PlayController>();

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Obx(() => LinearProgressIndicator(
              minHeight: 5.0, value: _controller.progress)),
          Card(
            color: backgroundColor,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.white,
                  ),
                  title: Text(""),
                  subtitle: Text(
                    _controller.question.question.content,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _controller.question.question.answers.length,
            itemBuilder: (_, int index) {
              return GestureDetector(
                  onTap: () => _controller.addAnswer(index),
                  child: Container(
                    child: AnswerCard(index),
                  ));
            },
          )),
          _controller.isQuestionAnswered
              ? ElevatedButton(
                  onPressed: () => _controller.next(),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                  child: Text("NASTĘPNE"))
              : _controller.question.question.correctAnswersCount != 1
                  ? ElevatedButton(
                      onPressed: () => _controller.answer(),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: Text("ODPOWIEDZ"))
                  : Container(),
        ],
      ),
    );
  }
}
