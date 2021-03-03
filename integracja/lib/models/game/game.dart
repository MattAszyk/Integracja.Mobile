import "gamemode.dart";

class Game {
  int id;
  String guid;
  String name;
  DateTime startTime;
  DateTime endTime;
  String gameState;
  int maxPlayersCount;
  int questionsCount;
  Gamemode gamemode;
  int playersCount;

  Game({
    this.id,
    this.guid,
    this.name,
    this.startTime,
    this.endTime,
    this.gameState,
    this.maxPlayersCount,
    this.questionsCount,
    this.gamemode,
    this.playersCount,
  });

  @override
  String toString() {
    return 'Game(id: $id, guid: $guid, name: $name, startTime: $startTime, endTime: $endTime, gameState: $gameState, maxPlayersCount: $maxPlayersCount, questionsCount: $questionsCount, gamemode: $gamemode, playersCount: $playersCount)';
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      guid: json['guid'] as String,
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      gameState: json['gameState'] as String,
      maxPlayersCount: json['maxPlayersCount'] as int,
      questionsCount: json['questionsCount'] as int,
      gamemode: json['gamemode'] == null
          ? null
          : Gamemode.fromJson(json['gamemode'] as Map<String, dynamic>),
      playersCount: json['playersCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guid': guid,
      'name': name,
      'startTime': startTime,
      'endTime': endTime,
      'gameState': gameState,
      'maxPlayersCount': maxPlayersCount,
      'questionsCount': questionsCount,
      'gamemode': gamemode?.toJson(),
      'playersCount': playersCount,
    };
  }
}
