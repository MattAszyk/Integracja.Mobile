import "game.dart";

class GameUser {
	int gameScore;
	String gameStartTime;
	String gameEndTime;
	String state;
	int answeredQuestions;
	int correctlyAnsweredQuestions;
	int incorrectlyAnsweredQuestions;
	Game game;

	GameUser({
		this.gameScore,
		this.gameStartTime,
		this.gameEndTime,
		this.state,
		this.answeredQuestions,
		this.correctlyAnsweredQuestions,
		this.incorrectlyAnsweredQuestions,
		this.game,
	});

	@override
	String toString() {
		return 'GameUser(gameScore: $gameScore, gameStartTime: $gameStartTime, gameEndTime: $gameEndTime, state: $state, answeredQuestions: $answeredQuestions, correctlyAnsweredQuestions: $correctlyAnsweredQuestions, incorrectlyAnsweredQuestions: $incorrectlyAnsweredQuestions, game: $game)';
	}

	factory GameUser.fromJson(Map<String, dynamic> json) {
		return GameUser(
			gameScore: json['gameScore'] as int,
			gameStartTime: json['gameStartTime'] as String,
			gameEndTime: json['gameEndTime'] as String,
			state: json['state'] as String,
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
			'state': state,
			'answeredQuestions': answeredQuestions,
			'correctlyAnsweredQuestions': correctlyAnsweredQuestions,
			'incorrectlyAnsweredQuestions': incorrectlyAnsweredQuestions,
			'game': game?.toJson(),
		};
	}
}
