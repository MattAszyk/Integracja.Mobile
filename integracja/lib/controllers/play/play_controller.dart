import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/models/play_game/question_detail_answers.dart';
import 'package:integracja/network/api/play_repository.dart';
import 'package:integracja/network/api_exception.dart';

class PlayController extends GetxController {
  final GameUser _detailGameUser;
  final int gameId;
  //"STATES" VARIABLES
  bool _loaded = false;
  bool get isGameLoaded => _loaded;
  int _messageCode = 0;
  var _messageText = {
    1: 'GRA ZAKOŃCZONA',
    4: 'GRA ANULOWANA',
    5: "GRA SIĘ SKOŃCZYŁA",
    7: "GRA SIĘ SKOŃCZYŁA ZGODNIE Z ZASADAMI",
    8: "GRA WYGASŁA"
  };
  String get lastMessage => _messageText[_messageCode];

  //GAME VARIABLES
  bool _answered = false;
  bool get isQuestionAnswered => _answered;
  final _answerList = <bool>[].obs;
  List<bool> get answerList => _answerList.toList();
  final _progress = 1.0.obs;
  double get progress => _progress.value;

  //END GAME VARIABLES
  bool _notShowEndGame = true;
  bool get notShowGameEnd => _notShowEndGame;

  //QUESTION CONTAINERS
  QuestionDetailAnswers _question;
  QuestionDetailAnswers get question => _question;

  PlayController(this.gameId, this._detailGameUser);
  @override
  void onInit() {
    _loadQuestion();
    super.onInit();
  }

  Timer _timer;
  Future<void> _progresBar() async {
    int counter = _detailGameUser.game.gamemode.timeForOneQuestion;

    double valueOfMinus = 1.0 / counter;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter == 0) {
        timer.cancel();
        answer();
      }
      _progress.value -= valueOfMinus;
    });
  }

  List<int> _generateAnswerList() {
    var list = <int>[];
    for (int i = 0; i < _answerList.length; ++i)
      if (_answerList[i]) list.add(question.question.answers.elementAt(i).id);
    return list;
  }

  void _loadQuestion() async {
    try {
      _question = await PlayRepository.getQuestion(gameId);
      _loaded = true;
      for (int i = 0; i < _question.question.answers.length; ++i) {
        _answerList.add(false);
      }
      await _progresBar();
    } on PlayException catch (e) {
      _messageCode = e.codeStatus;
      _notShowEndGame = false;
    } catch (e) {
      log("failed to read question: ${e.toString()}");
    } finally {
      _temporaryBlockUI = false;
      update();
    }
  }

  //Update checked values
  void addAnswer(int id) {
    if (!isQuestionAnswered) {
      _answerList[id] = !_answerList[id];
      if (question.question.correctAnswersCount == 1) answer();
      update();
    }
  }

  //Send answer to server
  bool _temporaryBlockUI = false;
  void answer() async {
    if (_temporaryBlockUI)
      return;
    else
      _temporaryBlockUI = true;
    try {
      _question = await PlayRepository.sendAnswer(
          gameId, _question.question.id, _generateAnswerList());
      _answered = true;
      _timer.cancel();
    } on PlayException catch (e) {
      _messageCode = e.codeStatus;
      _notShowEndGame = false;
    } catch (e) {
      log('answer: ${e.toString()}');
    } finally {
      _temporaryBlockUI = false;
      update();
    }
  }

  //Load next question
  void next() {
    if (_temporaryBlockUI)
      return;
    else
      _temporaryBlockUI = true;
    _progress.value = 1.0;
    _loaded = false;
    _answered = false;
    _answerList.clear();
    _loadQuestion();
  }
}
