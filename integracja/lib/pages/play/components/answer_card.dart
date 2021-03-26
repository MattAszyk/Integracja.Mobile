import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/play/play_controller.dart';
import 'package:integracja/utils/icon_repository.dart';

class AnswerCard extends StatelessWidget {
  final int _index;
  final _controller = Get.find<PlayController>();
  AnswerCard(this._index);
  @override
  Widget build(BuildContext context) {
    bool multipleAnswer =
        _controller.question.question.correctAnswersCount != 1;
    return Card(
        color: _controller.question.question.answers[_index].isCorrect == null
            ? Color(0xff30334a)
            : (_controller.question.question.answers[_index].isCorrect &&
                    _controller.answerList[_index]
                ? Color(0xff184d47)
                : !_controller.question.question.answers[_index].isCorrect &&
                        _controller.answerList[_index]
                    ? Color(0xff046582)
                    : Color(0xffe84545)),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Container(
            child: IconRepository.getIcon(_index),
          ),
          title: Text(
            _controller.question.question.answers[_index].content,
            style: TextStyle(color: Colors.white),
          ),
          trailing: multipleAnswer
              ? Icon(
                  (_controller.answerList[_index]
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined),
                  color: Colors.white,
                )
              : Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 35,
                ),
        ));
  }
}
