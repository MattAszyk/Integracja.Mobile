import 'package:equatable/equatable.dart';
import 'package:integracja/models/game/game_user.dart';

class ArchivesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ArchivesLoading extends ArchivesState {}

class ArchivesLoaded extends ArchivesState {
  final List<GameUser> gameUserList;
  ArchivesLoaded(this.gameUserList);

  @override
  List<Object> get props => [gameUserList];
}
