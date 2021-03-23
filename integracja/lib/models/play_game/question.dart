import 'package:integracja/models/play_game/answer.dart';

class Question {
  int id;
  int categoryId;
  String categoryName;
  String content;
  int positivePoints;
  int negativePoints;
  String questionScoring;
  bool isPublic;
  List<Answer> answers;
  int ownerId;

  Question({
    this.id,
    this.categoryId,
    this.categoryName,
    this.content,
    this.positivePoints,
    this.negativePoints,
    this.questionScoring,
    this.isPublic,
    this.answers,
    this.ownerId,
  });

  @override
  String toString() {
    return 'Question(id: $id, content: $content, positivePoints: $positivePoints, negativePoints: $negativePoints, questionScoring: $questionScoring, isPublic: $isPublic, categoryId: $categoryId, answers: $answers, ownerId: $ownerId';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      categoryName: json['categoryName'] as String,
      content: json['content'] as String,
      positivePoints: json['positivePoints'] as int,
      negativePoints: json['negativePoints'] as int,
      questionScoring: json['questionScoring'] as String,
      isPublic: json['isPublic'] as bool,
      answers: json['answers'] as List<Answer>,
      ownerId: json['ownerId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'content': content,
      'positivePoints': positivePoints,
      'negativePoints': negativePoints,
      'questionScoring': questionScoring,
      'isPublic': isPublic,
      'answers': answers,
      'ownerId': ownerId,
    };
  }
}
