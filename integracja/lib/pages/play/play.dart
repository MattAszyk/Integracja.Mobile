import 'package:flutter/material.dart';
import 'package:integracja/models/play_game/play_game.dart';
import 'package:integracja/pages/home_page/home_page.dart';
import 'package:integracja/utils/constrains.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  PlayGame _play = PlayGame().getFirstQuestion();
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          ),
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
                    onPressed: () => checkAnswer(0),
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
                    onPressed: () => checkAnswer(1),
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
                    onPressed: () {
                      checkAnswer(2);
                    },
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
                    onPressed: () {
                      checkAnswer(3);
                    },
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
  }

  void loadQuestion() {
    setState(() {
      if (_question == 0) {
        _play = PlayGame().getSecondQuestion();
      } else if (_question == 1) {
        _play = PlayGame().getThirdQuestion();
      } else {}
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
