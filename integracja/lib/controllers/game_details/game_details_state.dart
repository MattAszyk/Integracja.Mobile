import 'package:equatable/equatable.dart';
import 'package:integracja/models/game/game_user.dart';

class GameDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameDetailsLoading extends GameDetailsState {}

class GameDetailsLoaded extends GameDetailsState {
  final GameUser detailGameUser;
  GameDetailsLoaded(this.detailGameUser);

  @override
  List<Object> get props => [detailGameUser];
}
