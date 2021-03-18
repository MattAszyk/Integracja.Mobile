import 'package:equatable/equatable.dart';

class Gamemode extends Equatable {
  final int id;
  final int ownerId;
  final bool isPublic;
  final String name;
  final int timeForFullQuiz;
  final int timeForOneQuestion;
  final int numberOfLives;

  const Gamemode({
    this.id,
    this.ownerId,
    this.isPublic,
    this.name,
    this.timeForFullQuiz,
    this.timeForOneQuestion,
    this.numberOfLives,
  });

  @override
  String toString() {
    return 'Gamemode(id: $id, ownerId: $ownerId, isPublic: $isPublic, name: $name, timeForFullQuiz: $timeForFullQuiz, timeForOneQuestion: $timeForOneQuestion, numberOfLives: $numberOfLives)';
  }

  factory Gamemode.fromJson(Map<String, dynamic> json) {
    return Gamemode(
      id: json['id'] as int,
      ownerId: json['ownerId'] as int,
      isPublic: json['isPublic'] as bool,
      name: json['name'] as String,
      timeForFullQuiz: json['timeForFullQuiz'] as int,
      timeForOneQuestion: json['timeForOneQuestion'] as int,
      numberOfLives: json['numberOfLives'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'isPublic': isPublic,
      'name': name,
      'timeForFullQuiz': timeForFullQuiz,
      'timeForOneQuestion': timeForOneQuestion,
      'numberOfLives': numberOfLives,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      ownerId,
      isPublic,
      name,
      timeForFullQuiz,
      timeForOneQuestion,
      numberOfLives,
    ];
  }
}
