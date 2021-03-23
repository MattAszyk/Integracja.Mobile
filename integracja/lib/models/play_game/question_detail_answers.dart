import 'package:equatable/equatable.dart';

import "question.dart";

class QuestionDetailAnswers extends Equatable {
	final bool gameOver;
	final int questionScore;
	final String questionDownloadTime;
	final String questionAnswerTime;
	final Question question;

	const QuestionDetailAnswers({
		this.gameOver,
		this.questionScore,
		this.questionDownloadTime,
		this.questionAnswerTime,
		this.question,
	});

	@override
	String toString() {
		return 'QuestionDetailAnswers(gameOver: $gameOver, questionScore: $questionScore, questionDownloadTime: $questionDownloadTime, questionAnswerTime: $questionAnswerTime, question: $question)';
	}

	factory QuestionDetailAnswers.fromJson(Map<String, dynamic> json) {
		return QuestionDetailAnswers(
			gameOver: json['gameOver'] as bool,
			questionScore: json['questionScore'] as int,
			questionDownloadTime: json['questionDownloadTime'] as String,
			questionAnswerTime: json['questionAnswerTime'] as String,
			question: json['question'] == null
					? null
					: Question.fromJson(json['question'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'gameOver': gameOver,
			'questionScore': questionScore,
			'questionDownloadTime': questionDownloadTime,
			'questionAnswerTime': questionAnswerTime,
			'question': question?.toJson(),
		};
	}

	@override
	List<Object> get props {
		return [
			gameOver,
			questionScore,
			questionDownloadTime,
			questionAnswerTime,
			question,
		];
	}
}
