import 'package:get/get.dart';
import 'package:integracja/models/play_game/question_detail_answers.dart';
import 'package:integracja/network/api_base.dart';

class PlayRepository {
  static Future<QuestionDetailAnswers> sendAnswer(
      int gameId, int questionId, List<int> answerId) async {
    var _apiBase = Get.find<ApiBase>();
    var response = await _apiBase.request(
        requestType: RequestType.POST,
        api: API.Games_Play,
        id: gameId,
        secondId: questionId,
        answerId: answerId);
    //log('sendAnswer: ${response.toString()}');
    return QuestionDetailAnswers.fromJson(response);
  }

  static Future<QuestionDetailAnswers> getQuestion(int gameId) async {
    var _apiBase = Get.find<ApiBase>();
    var response = await _apiBase.request(
        requestType: RequestType.GET, api: API.Games_Play, id: gameId);

    return QuestionDetailAnswers.fromJson(response);
  }
}
