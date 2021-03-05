import 'package:integracja/models/play_game/answer.dart';
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

  PlayGame getFirstQuestion() {
    Answer a1 = Answer(
      id: 0,
      content: 'Odp1',
      isCorrect: true,
    );
    Answer a2 = Answer(
      id: 1,
      content: 'Odp2',
      isCorrect: false,
    );

    Answer a3 = Answer(
      id: 1,
      content: 'Odp3',
      isCorrect: false,
    );

    Answer a4 = Answer(
      id: 1,
      content: 'Odp4',
      isCorrect: false,
    );

    Question q1 = Question(
        id: 0,
        content: '[1]Pytanko tak o?',
        positivePoints: 1,
        negativePoints: 0,
        questionScoring: 'ScorePerGoodAnswer',
        isPublic: true,
        categoryId: 0,
        answers: [a1, a2, a3, a4],
        ownerId: 0,
        ownerUsername: "fladzio");

    return PlayGame(
      index: 0,
      overridePositivePoints: 1,
      overrideNegativePoints: 1,
      questionId: 0,
      question: q1,
    );
  }

  PlayGame getSecondQuestion() {
    Answer a1 = Answer(
      id: 0,
      content: 'Odp1',
      isCorrect: false,
    );
    Answer a2 = Answer(
      id: 1,
      content: 'Odp2',
      isCorrect: true,
    );

    Answer a3 = Answer(
      id: 1,
      content: 'Odp3',
      isCorrect: false,
    );

    Answer a4 = Answer(
      id: 1,
      content: 'Odp4',
      isCorrect: false,
    );
    Question q1 = Question(
        id: 1,
        content: '[2]Pytanko tak o?',
        positivePoints: 1,
        negativePoints: 0,
        questionScoring: 'ScorePerGoodAnswer',
        isPublic: true,
        categoryId: 0,
        answers: [a1, a2, a3, a4],
        ownerId: 0,
        ownerUsername: "fladzio");

    return PlayGame(
      index: 0,
      overridePositivePoints: 1,
      overrideNegativePoints: 1,
      questionId: 1,
      question: q1,
    );
  }

  PlayGame getThirdQuestion() {
    Answer a1 = Answer(
      id: 0,
      content: 'Odp1',
      isCorrect: false,
    );
    Answer a2 = Answer(
      id: 1,
      content: 'Odp2',
      isCorrect: false,
    );

    Answer a3 = Answer(
      id: 1,
      content: 'Odp3',
      isCorrect: true,
    );

    Answer a4 = Answer(
      id: 1,
      content: 'Odp4',
      isCorrect: false,
    );
    Question q1 = Question(
        id: 3,
        content: '[3]Pytanko tak o?',
        positivePoints: 1,
        negativePoints: 0,
        questionScoring: 'ScorePerGoodAnswer',
        isPublic: true,
        categoryId: 0,
        answers: [a1, a2, a3, a4],
        ownerId: 0,
        ownerUsername: "fladzio");

    return PlayGame(
      index: 0,
      overridePositivePoints: 1,
      overrideNegativePoints: 1,
      questionId: 3,
      question: q1,
    );
  }
}
