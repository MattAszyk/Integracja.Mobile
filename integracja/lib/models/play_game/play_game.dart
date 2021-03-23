import 'package:integracja/models/play_game/answer.dart';
import 'package:integracja/models/play_game/question.dart';

class PlayGame {
  bool gameOver;
  int questionScore;
  int questionDownloadTime;
  int questionAnswerTime;
  Question question;

  PlayGame({
    this.gameOver,
    this.questionScore,
    this.questionDownloadTime,
    this.questionAnswerTime,
    this.question,
  });

  @override
  String toString() {
    return 'Play(index: $gameOver, overridePositivePoints: $questionScore, overrideNegativePoints: $questionDownloadTime, questionId: $questionAnswerTime, question: $question)';
  }

  factory PlayGame.fromJson(Map<String, dynamic> json) {
    return PlayGame(
      gameOver: json['gameOver'] as bool,
      questionScore: json['questionScore'] as int,
      questionDownloadTime: json['questionDownloadTime'] as int,
      questionAnswerTime: json['questionAnswerTime'] as int,
      question: json['question'] as Question,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameOver': gameOver,
      'questionScore': questionScore,
      'questionDownloadTime': questionDownloadTime,
      'questionAnswerTime': questionAnswerTime,
      'question': question,
    };
  }
}
