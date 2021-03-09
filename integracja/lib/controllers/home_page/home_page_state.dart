import 'package:equatable/equatable.dart';
import 'package:integracja/models/game/game_user.dart';

class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<GameUser> gameUserList;
  HomePageLoaded(this.gameUserList);

  @override
  List<Object> get props => [gameUserList];
}
