import 'package:equatable/equatable.dart';

import "gamemode.dart";
import "players.dart";

class Game extends Equatable {
  final int id;
  final int ownerId;
  final String guid;
  final String name;
  final DateTime createdOn;
  final DateTime startTime;
  final DateTime endTime;
  final String gameState;
  final int questionsCount;
  final int maxPlayersCount;
  final Gamemode gamemode;
  final List<Players> players;

  const Game({
    this.id,
    this.ownerId,
    this.guid,
    this.name,
    this.createdOn,
    this.startTime,
    this.endTime,
    this.gameState,
    this.questionsCount,
    this.maxPlayersCount,
    this.gamemode,
    this.players,
  });

  @override
  String toString() {
    return 'Game(id: $id, ownerId: $ownerId, guid: $guid, name: $name, createdOn: $createdOn, startTime: $startTime, endTime: $endTime, gameState: $gameState, questionsCount: $questionsCount, maxPlayersCount: $maxPlayersCount, gamemode: $gamemode, players: $players)';
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      ownerId: json['ownerId'] as int,
      guid: json['guid'] as String,
      name: json['name'] as String,
      createdOn: DateTime.parse(json['createdOn']),
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      gameState: json['gameState'] as String,
      questionsCount: json['questionsCount'] as int,
      maxPlayersCount: json['maxPlayersCount'] as int,
      gamemode: json['gamemode'] == null
          ? null
          : Gamemode.fromJson(json['gamemode'] as Map<String, dynamic>),
      players: (json['players'] as List)
          ?.map((e) => e == null ? null : Players.fromJson(e))
          ?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'guid': guid,
      'name': name,
      'createdOn': createdOn,
      'startTime': startTime,
      'endTime': endTime,
      'gameState': gameState,
      'questionsCount': questionsCount,
      'maxPlayersCount': maxPlayersCount,
      'gamemode': gamemode?.toJson(),
      'players': players?.map((e) => e?.toJson())?.toList(),
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      ownerId,
      guid,
      name,
      createdOn,
      startTime,
      endTime,
      gameState,
      questionsCount,
      maxPlayersCount,
      gamemode,
      players,
    ];
  }
}
