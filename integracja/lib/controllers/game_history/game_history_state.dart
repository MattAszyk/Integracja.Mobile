import 'package:equatable/equatable.dart';
import 'package:integracja/models/game/history.dart';

class GameHistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameHistoryLoading extends GameHistoryState {}

class GameHistoryLoaded extends GameHistoryState {
  final History detailGameUser;
  GameHistoryLoaded(this.detailGameUser);

  @override
  List<Object> get props => [detailGameUser];
}
