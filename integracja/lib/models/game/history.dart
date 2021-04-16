import "game_user_questions.dart";
import "player_scores.dart";

class History {
  num gameScore;
  String gameStartTime;
  String gameEndTime;
  bool gameOver;
  int answeredQuestions;
  int correctlyAnsweredQuestions;
  int incorrectlyAnsweredQuestions;
  List<GameUserQuestions> gameUserQuestions;
  List<PlayerScores> playerScores;

  History({
    this.gameScore,
    this.gameStartTime,
    this.gameEndTime,
    this.gameOver,
    this.answeredQuestions,
    this.correctlyAnsweredQuestions,
    this.incorrectlyAnsweredQuestions,
    this.gameUserQuestions,
    this.playerScores,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      gameScore: json['gameScore'] as num,
      gameStartTime: json['gameStartTime'] as String,
      gameEndTime: json['gameEndTime'] as String,
      gameOver: json['gameOver'] as bool,
      answeredQuestions: json['answeredQuestions'] as int,
      correctlyAnsweredQuestions: json['correctlyAnsweredQuestions'] as int,
      incorrectlyAnsweredQuestions: json['incorrectlyAnsweredQuestions'] as int,
      gameUserQuestions: (json['gameUserQuestions'] as List)
          ?.map((e) => e == null ? null : GameUserQuestions.fromJson(e))
          ?.toList(),
      playerScores: (json['playerScores'] as List)
          ?.map((e) => e == null ? null : PlayerScores.fromJson(e))
          ?.toList(),
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
      'gameUserQuestions': gameUserQuestions?.map((e) => e?.toJson())?.toList(),
      'playerScores': playerScores?.map((e) => e?.toJson())?.toList(),
    };
  }
}
