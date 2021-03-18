import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integracja/models/play_game/answer.dart';
import 'package:integracja/models/play_game/play_game.dart';
import 'package:integracja/models/play_game/question.dart';
import 'package:integracja/utils/constrains.dart';

Answer a1 = Answer(
  id: 0,
  content: '1',
  isCorrect: false,
);
Answer a2 = Answer(
  id: 1,
  content: '2',
  isCorrect: false,
);
Answer a3 = Answer(
  id: 2,
  content: '3',
  isCorrect: false,
);
Answer a4 = Answer(
  id: 3,
  content: '4',
  isCorrect: true,
);

Question q1 = Question(
    id: 0,
    content: '2 + 2 = ?',
    positivePoints: 1,
    negativePoints: 1,
    questionScoring: 'ScorePerGoodAnswer',
    isPublic: true,
    categoryId: 0,
    answers: [a1, a2, a3, a4],
    ownerId: 0,
    ownerUsername: "fladzio");

Answer b1 = Answer(
  id: 4,
  content: 'czerwony',
  isCorrect: true,
);
Answer b2 = Answer(
  id: 5,
  content: 'zielony',
  isCorrect: false,
);
Answer b3 = Answer(
  id: 6,
  content: 'żółty',
  isCorrect: false,
);
Answer b4 = Answer(
  id: 7,
  content: 'niebieski',
  isCorrect: false,
);

Question q2 = Question(
    id: 0,
    content: 'Jakiego koloru jest czerwony maluch?',
    positivePoints: 1,
    negativePoints: 1,
    questionScoring: 'ScorePerGoodAnswer',
    isPublic: true,
    categoryId: 0,
    answers: [b1, b2, b3, b4],
    ownerId: 0,
    ownerUsername: "fladzio");

Answer c1 = Answer(
  id: 8,
  content: '1',
  isCorrect: false,
);
Answer c2 = Answer(
  id: 9,
  content: '3',
  isCorrect: false,
);
Answer c3 = Answer(
  id: 10,
  content: '2',
  isCorrect: true,
);
Answer c4 = Answer(
  id: 11,
  content: '4',
  isCorrect: false,
);

Question q3 = Question(
    id: 0,
    content: 'Ilu jest Flutterowców w zespole inteGRAcja?',
    positivePoints: 1,
    negativePoints: 1,
    questionScoring: 'ScorePerGoodAnswer',
    isPublic: true,
    categoryId: 0,
    answers: [c1, c2, c3, c4],
    ownerId: 0,
    ownerUsername: "fladzio");

List<Question> questions = [q2, q3];

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> with TickerProviderStateMixin {
  PlayGame _play = PlayGame(
    index: 0,
    overridePositivePoints: 0,
    overrideNegativePoints: 0,
    questionId: 0,
    question: q1,
  );

  Timer _timer;

  bool _btnActive = false;
  bool _answered = false;
  int _answeredQuestion = 0;
  int _question = 0;
  int _answerTime = 10;
  double _timeLeft = 10;
  double _progress = 1.0;
  Color wrongColor = Colors.red;
  Color goodColor = Colors.green;

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) {
        if (_timeLeft <= 0.0) {
          setState(() {
            timer.cancel();
          });
          checkAnswer(-1);
        } else {
          setState(() {
            _timeLeft -= 0.1;
            _progress -= 1.0 / _answerTime / 10;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Nazwa giereczki',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              minHeight: 5,
              value: _progress,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    _play.question.content,
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
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () => _answered ? null : checkAnswer(0),
                    color: buttonColor(0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _play.question.answers[0].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () => _answered ? null : checkAnswer(1),
                    color: buttonColor(1),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _play.question.answers[1].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () => _answered ? null : checkAnswer(2),
                    color: buttonColor(2),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _play.question.answers[2].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () => _answered ? null : checkAnswer(3),
                    color: buttonColor(3),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _play.question.answers[3].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
                      onPressed: _btnActive ? loadQuestion : null,
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          (_question < questions.length)
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
        ),
      ),
    );
  }

  void resetState() {
    setState(() {
      _btnActive = false;
      _answered = false;
      _answeredQuestion = 0;
      _progress = 1.0;
      _timeLeft = 10;
    });
  }

  void checkAnswer(int btn) {
    if (_timer.isActive) _timer.cancel();

    if (btn != -1 && _play.question.answers[btn].isCorrect)
      _play.overridePositivePoints += _play.question.positivePoints;
    else
      _play.overrideNegativePoints += _play.question.negativePoints;

    setState(() {
      _answeredQuestion = btn;
      _answered = true;
      _btnActive = true;
    });

    // TODO
    // wyslanie odpowiedzi na serwer
  }

  void loadQuestion() {
    if (_question < questions.length) {
      setState(() {
        _play.question = questions[_question];
        resetState();
        _question++;
      });
      startTimer();
    } else {
      showDialog<void>(context: context, builder: (context) => showDiallog());
    }
  }

  AlertDialog showDiallog() {
    return AlertDialog(
      title: Text('Wynik'),
      content: Text(
          'Poprawnych odpowiedzi: ${_play.overridePositivePoints}\nBłędnych odpowiedzi: ${_play.overrideNegativePoints}'),
      actions: [
        FlatButton(
          textColor: Color(0xFF6200EE),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('ACCEPT'),
        ),
      ],
    );
  }

  Color buttonColor(int btn) {
    if (_answered && _play.question.answers[btn].isCorrect) return goodColor;

    if (_answered && _answeredQuestion == btn) return wrongColor;

    return Colors.white;
  }
}
