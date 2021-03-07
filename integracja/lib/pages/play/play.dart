import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/models/play_game/answer.dart';
import 'package:integracja/models/play_game/play_game.dart';
import 'package:integracja/models/play_game/question.dart';
import 'package:integracja/utils/constrains.dart';

Answer a1 = Answer(
  id: 0,
  content: '[1]Odp1',
  isCorrect: true,
);
Answer a2 = Answer(
  id: 1,
  content: '[1]Odp2',
  isCorrect: false,
);
Answer a3 = Answer(
  id: 1,
  content: '[1]Odp3',
  isCorrect: false,
);
Answer a4 = Answer(
  id: 1,
  content: '[1]Odp4',
  isCorrect: false,
);

Question q1 = Question(
    id: 0,
    content: '[1]Pytanko tak o?',
    positivePoints: 1,
    negativePoints: 0,
    questionScoring: 'ScorePerGoodAnswer',
    isPublic: true,
    categoryId: 0,
    answers: [a1, a2, a3, a4],
    ownerId: 0,
    ownerUsername: "fladzio");

Answer b1 = Answer(
  id: 0,
  content: '[2]Odp1',
  isCorrect: false,
);
Answer b2 = Answer(
  id: 1,
  content: '[2]Odp2',
  isCorrect: true,
);
Answer b3 = Answer(
  id: 2,
  content: '[2]Odp3',
  isCorrect: false,
);
Answer b4 = Answer(
  id: 3,
  content: '[2]Odp4',
  isCorrect: false,
);

Question q2 = Question(
    id: 0,
    content: '[2]Pytanko tak o?',
    positivePoints: 1,
    negativePoints: 0,
    questionScoring: 'ScorePerGoodAnswer',
    isPublic: true,
    categoryId: 0,
    answers: [b1, b2, b3, b4],
    ownerId: 0,
    ownerUsername: "fladzio");

Answer c1 = Answer(
  id: 0,
  content: '[3]Odp1',
  isCorrect: false,
);
Answer c2 = Answer(
  id: 1,
  content: '[3]Odp2',
  isCorrect: false,
);
Answer c3 = Answer(
  id: 2,
  content: '[3]Odp3',
  isCorrect: true,
);
Answer c4 = Answer(
  id: 3,
  content: '[3]Odp4',
  isCorrect: false,
);

Question q3 = Question(
    id: 0,
    content: '[3]Pytanko tak o?',
    positivePoints: 1,
    negativePoints: 0,
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

class _PlayState extends State<Play> {
  PlayGame _play = PlayGame(
    index: 0,
    overridePositivePoints: 1,
    overrideNegativePoints: 1,
    questionId: 0,
    question: q1,
  );
  bool _btnActive = false;
  bool _answered = false;
  int _answeredQuestion = 0;
  int _question = 0;
  Color wrongColor = Colors.red;
  Color goodColor = Colors.green;

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
        title: const Text(
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
                          'Następne pytanie ->',
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
    });
  }

  void checkAnswer(int odp) {
    setState(() {
      _answeredQuestion = odp;
      _answered = true;
      _btnActive = true;
    });

    // TODO
    // wyslanie odpowiedzi na serwer
  }

  void loadQuestion() {
    setState(() {
      if (_question < questions.length) _play.question = questions[_question];
      _question++;
    });
    resetState();
  }

  Color buttonColor(int btn) {
    if (_answered && _play.question.answers[btn].isCorrect) return goodColor;

    if (_answered && _answeredQuestion == btn) return wrongColor;

    return Colors.white;
  }
}
