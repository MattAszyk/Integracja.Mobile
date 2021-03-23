import 'package:integracja/models/play_game/question.dart';

class PlayGame {
  int index;
  int overridePositivePoints;
  int overrideNegativePoints;
  int questionId;
  Question question;

  PlayGame({
    this.index,
    this.overridePositivePoints,
    this.overrideNegativePoints,
    this.questionId,
    this.question,
  });

  @override
  String toString() {
    return 'Play(index: $index, overridePositivePoints: $overridePositivePoints, overrideNegativePoints: $overrideNegativePoints, questionId: $questionId, question: $question)';
  }

  factory PlayGame.fromJson(Map<String, dynamic> json) {
    return PlayGame(
      index: json['index'] as int,
      overridePositivePoints: json['overridePositivePoints'] as int,
      overrideNegativePoints: json['overrideNegativePoints'] as int,
      questionId: json['questionId'] as int,
      question: json['question'] as Question,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'overridePositivePoints': overridePositivePoints,
      'overrideNegativePoints': overrideNegativePoints,
      'questionId': questionId,
      'question': question,
    };
  }
}
