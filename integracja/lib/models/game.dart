class Game {
  final String guid;
  final String name;
  final String startTime;
  final String endTime;
  final int gameState;
  final int playersCount;
  final int maxPlayersCount;
  final int questionsCount;
  //final List<dynamic> gamemode;
  final List<dynamic> players;

  Game(
      {this.guid,
      this.name,
      this.startTime,
      this.endTime,
      this.gameState,
      this.playersCount,
      this.maxPlayersCount,
      this.questionsCount,
      //this.gamemode,
      this.players});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      guid: json['guid'],
      name: json['name'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      gameState: json['gameState'],
      playersCount: json['playersCount'],
      maxPlayersCount: json['maxPlayersCount'],
      questionsCount: json['questionsCount'],
      //gamemode: json['gamemode'],
      players: json['players'],
    );
  }

  static List<Game> fetchAll() {
    return [];
  }

  static Future<String> lol() {
    return Future<String>.delayed(
      Duration(seconds: 2),
      () => 'Data Loaded',
    );
  }
}
