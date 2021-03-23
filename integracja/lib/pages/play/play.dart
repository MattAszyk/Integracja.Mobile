import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/play/play_controller.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/utils/constrains.dart';

class Play extends StatefulWidget {
  PlayController _controller;
  int _gameId;
  Play(int gameId) {
    _gameId = gameId;
    _controller = Get.put(PlayController(gameId));
  }

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: Text(
              widget._controller.gameName.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (!widget._controller.isGameLoaded) Logo() else _game()
              ],
            ),
          ),
        ));
  }

  Column _game() {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: 5,
          value: widget._controller.progress,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: Get.width,
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                widget._controller.question.question.content,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: _answers(),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  disabledColor: Colors.grey[600],
                  disabledElevation: 1,
                  disabledTextColor: Colors.blueGrey,
                  onPressed: () => Get.to(() => Play(widget._gameId)),
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      !widget._controller.isQuestionAnswered
                          ? 'Następne pytanie'
                          : 'Zobacz wyniki',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _answers() {
    List<Widget> uiComponents;
    widget._controller.question.question.answers.forEach((element) {
      uiComponents.add(SizedBox(
        height: 10,
      ));

      uiComponents.add(Row(
        children: [
          Expanded(
            child: RaisedButton(
              onPressed: () => widget._controller.addAnswer(element.id),
              color: _buttonColor(
                  element.isCorrect, widget._controller.isSelected(element)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  element.content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    });
    return uiComponents;
  }

  Color _buttonColor(bool isCorrect, bool isSelected) {
    if (isSelected) return Colors.blue;
    switch (isCorrect) {
      case true:
        return Colors.green;
      case false:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
