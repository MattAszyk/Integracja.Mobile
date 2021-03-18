import 'package:equatable/equatable.dart';
import 'package:integracja/models/api_item.dart';

import "game.dart";

class GameUser extends Equatable implements ApiRequest {
  final int gameScore;
  final String gameStartTime;
  final String gameEndTime;
  final bool gameOver;
  final int answeredQuestions;
  final int correctlyAnsweredQuestions;
  final int incorrectlyAnsweredQuestions;
  final Game game;

  const GameUser({
    this.gameScore,
    this.gameStartTime,
    this.gameEndTime,
    this.gameOver,
    this.answeredQuestions,
    this.correctlyAnsweredQuestions,
    this.incorrectlyAnsweredQuestions,
    this.game,
  });

  @override
  String toString() {
    return 'GameUser(gameScore: $gameScore, gameStartTime: $gameStartTime, gameEndTime: $gameEndTime, gameOver: $gameOver, answeredQuestions: $answeredQuestions, correctlyAnsweredQuestions: $correctlyAnsweredQuestions, incorrectlyAnsweredQuestions: $incorrectlyAnsweredQuestions, game: $game)';
  }

  factory GameUser.fromJson(Map<String, dynamic> json) {
    return GameUser(
      gameScore: json['gameScore'] as int,
      gameStartTime: json['gameStartTime'] as String,
      gameEndTime: json['gameEndTime'] as String,
      gameOver: json['gameOver'] as bool,
      answeredQuestions: json['answeredQuestions'] as int,
      correctlyAnsweredQuestions: json['correctlyAnsweredQuestions'] as int,
      incorrectlyAnsweredQuestions: json['incorrectlyAnsweredQuestions'] as int,
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameScore': gameScore,
      'gameStartTime': gameStartTime,
      'gameEndTime': gameEndTime,
      'gameOver': gameOver,
      'answeredQuestions': answeredQuestions,
      'correctlyAnsweredQuestions': correctlyAnsweredQuestions,
      'incorrectlyAnsweredQuestions': incorrectlyAnsweredQuestions,
      'game': game?.toJson(),
    };
  }

  @override
  List<Object> get props {
    return [
      gameScore,
      gameStartTime,
      gameEndTime,
      gameOver,
      answeredQuestions,
      correctlyAnsweredQuestions,
      incorrectlyAnsweredQuestions,
      game,
    ];
  }
}
