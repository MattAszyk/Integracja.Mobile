import 'package:integracja/models/play_game/answer.dart';

class Question {
  int id;
  String content;
  int positivePoints;
  int negativePoints;
  String questionScoring;
  bool isPublic;
  int categoryId;
  List<Answer> answers;
  int ownerId;
  String ownerUsername;

  Question({
    this.id,
    this.content,
    this.positivePoints,
    this.negativePoints,
    this.questionScoring,
    this.isPublic,
    this.categoryId,
    this.answers,
    this.ownerId,
    this.ownerUsername,
  });

  @override
  String toString() {
    return 'Question(id: $id, content: $content, positivePoints: $positivePoints, negativePoints: $negativePoints, questionScoring: $questionScoring, isPublic: $isPublic, categoryId: $categoryId, answers: $answers, ownerId: $ownerId, ownerUsername: $ownerUsername)';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      content: json['content'] as String,
      positivePoints: json['positivePoints'] as int,
      negativePoints: json['negativePoints'] as int,
      questionScoring: json['questionScoring'] as String,
      isPublic: json['isPublic'] as bool,
      categoryId: json['categoryId'] as int,
      answers: json['answers'] as List<Answer>,
      ownerId: json['ownerId'] as int,
      ownerUsername: json['ownerUsername'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'positivePoints': positivePoints,
      'negativePoints': negativePoints,
      'questionScoring': questionScoring,
      'isPublic': isPublic,
      'categoryId': categoryId,
      'answers': answers,
      'ownerId': ownerId,
      'ownerUsername': ownerUsername,
    };
  }
}
