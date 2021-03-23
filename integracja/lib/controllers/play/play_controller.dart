import 'package:get/get.dart';
import 'package:integracja/models/play_game/answer.dart';
import 'package:integracja/models/play_game/question_detail_answers.dart';
import 'package:integracja/network/api/play_repository.dart';

class PlayController extends GetxController {
  final int gameId;
  final _progress = 0.0.obs;
  double get progress => _progress.value;

  final _gameName = "WCZYTYWANIE".obs;
  String get gameName => _gameName.value;
  final _loaded = false.obs;
  bool get isGameLoaded => _loaded.value;
  final _answered = false.obs;
  bool get isQuestionAnswered => _answered.value;
  final _answerList = List<int>().obs;
  List<int> get answetList => _answerList;
  // GameDetailsState get state => _homePageStateStream.value;
  QuestionDetailAnswers _question;
  QuestionDetailAnswers get question => _question;
  PlayController(this.gameId) {
    _loadQuestion();
  }

  void _loadQuestion() async {
    try {
      _question = await PlayRepository.getQuestion(gameId);
      _gameName.value = _question.question.content;
      _loaded.value = true;
    } catch (e) {}
  }

  void addAnswer(int id) {
    if (_answerList.contains(id))
      _answerList.remove(id);
    else
      _answerList.add(id);
  }

  bool isSelected(Answer e) {
    return _answerList.contains(e.id);
  }

  void answer() async {
    try {
      await PlayRepository.sendAnswer(
          gameId, _question.question.id, _answerList);
      _answered.value = true;
    } catch (e) {}
  }
}
