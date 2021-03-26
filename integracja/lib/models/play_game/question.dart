import 'package:equatable/equatable.dart';

import 'answer.dart';

class Question extends Equatable {
  final int id;
  final int categoryId;
  final String categoryName;
  final int ownerId;
  final bool isPublic;
  final String content;
  final num positivePoints;
  final num negativePoints;
  final String questionScoring;
  final int correctAnswersCount;
  final List<Answer> answers;

  const Question({
    this.id,
    this.categoryId,
    this.categoryName,
    this.ownerId,
    this.isPublic,
    this.content,
    this.positivePoints,
    this.negativePoints,
    this.questionScoring,
    this.correctAnswersCount,
    this.answers,
  });

  @override
  String toString() {
    return 'Question(id: $id, categoryId: $categoryId, categoryName: $categoryName, ownerId: $ownerId, isPublic: $isPublic, content: $content, positivePoints: $positivePoints, negativePoints: $negativePoints, questionScoring: $questionScoring, answers: $answers)';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['id'] as int,
        categoryId: json['categoryId'] as int,
        categoryName: json['categoryName'] as String,
        ownerId: json['ownerId'] as int,
        isPublic: json['isPublic'] as bool,
        content: json['content'] as String,
        positivePoints: json['positivePoints'] as num,
        negativePoints: json['negativePoints'] as num,
        questionScoring: json['questionScoring'] as String,
        correctAnswersCount: json['correctAnswersCount'] as int,
        answers: (json['answers'] as List)
            ?.map((e) => e == null ? null : Answer.fromJson(e))
            ?.toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'ownerId': ownerId,
      'isPublic': isPublic,
      'content': content,
      'positivePoints': positivePoints,
      'negativePoints': negativePoints,
      'questionScoring': questionScoring,
      'answers': answers?.map((e) => e?.toJson())?.toList(),
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      categoryId,
      categoryName,
      ownerId,
      isPublic,
      content,
      positivePoints,
      negativePoints,
      questionScoring,
      correctAnswersCount,
      answers,
    ];
  }
}
