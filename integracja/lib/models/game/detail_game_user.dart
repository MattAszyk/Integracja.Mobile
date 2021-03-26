import 'package:equatable/equatable.dart';
import 'package:integracja/models/api_item.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/models/game/players.dart';

class DetailGameUser extends Equatable implements ApiRequest {
  final num gameScore;
  final DateTime gameStartTime;
  final DateTime gameEndTime;
  final bool gameOver;
  final int answeredQuestions;
  final int correctlyAnsweredQuestions;
  final int incorrectlyAnsweredQuestions;
  final Game game;
  const DetailGameUser({
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
    return 'DetailGameUser(gameScore: $gameScore, gameStartTime: $gameStartTime, gameEndTime: $gameEndTime, gameOver: $gameOver, answeredQuestions: $answeredQuestions, correctlyAnsweredQuestions: $correctlyAnsweredQuestions, incorrectlyAnsweredQuestions: $incorrectlyAnsweredQuestions, game: $game)';
  }

  factory DetailGameUser.fromJson(Map<String, dynamic> json) {
    return DetailGameUser(
        gameScore: json['gameScore'] == null ? 0 : json['gameScore'],
        gameStartTime: json['gameStartTime'] == null
            ? DateTime.now()
            : DateTime.parse(json['gameStartTime']).toLocal(),
        gameEndTime: json['gameEndTime'] == null
            ? DateTime.now()
            : DateTime.parse(json['gameEndTime']).toLocal(),
        gameOver: json['gameOver'] as bool,
        answeredQuestions: json['answeredQuestions'] as int,
        correctlyAnsweredQuestions: json['correctlyAnsweredQuestions'] as int,
        incorrectlyAnsweredQuestions:
            json['incorrectlyAnsweredQuestions'] as int,
        game: json['game'] == null
            ? null
            : Game.fromJson(json['game'] as Map<String, dynamic>));
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
