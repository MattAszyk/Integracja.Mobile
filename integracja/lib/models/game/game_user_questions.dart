import 'package:integracja/models/play_game/question.dart';

class GameUserQuestions {
  num questionScore;
  bool isAnswered;
  String questionDownloadTime;
  String questionAnswerTime;
  Question question;
  List<dynamic> selectedAnswers;

  GameUserQuestions({
    this.questionScore,
    this.isAnswered,
    this.questionDownloadTime,
    this.questionAnswerTime,
    this.question,
    this.selectedAnswers,
  });

  factory GameUserQuestions.fromJson(Map<String, dynamic> json) {
    return GameUserQuestions(
      questionScore: json['questionScore'] as num,
      isAnswered: json['isAnswered'] as bool,
      questionDownloadTime: json['questionDownloadTime'] as String,
      questionAnswerTime: json['questionAnswerTime'] as String,
      question: json['question'] == null
          ? null
          : Question.fromJson(json['question'] as Map<String, dynamic>),
      selectedAnswers: json['selectedAnswers'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionScore': questionScore,
      'isAnswered': isAnswered,
      'questionDownloadTime': questionDownloadTime,
      'questionAnswerTime': questionAnswerTime,
      'question': question?.toJson(),
      'selectedAnswers': selectedAnswers,
    };
  }
}
