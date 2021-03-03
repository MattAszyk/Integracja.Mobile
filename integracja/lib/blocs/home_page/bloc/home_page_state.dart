part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final List<GameUser> _gameList;
  HomePageLoadedState({@required List<GameUser> gameList})
      : assert(gameList != null),
        _gameList = gameList;

  @override
  List<Object> get props => [_gameList];
}

class HomePageLoadingFailedState extends HomePageState {}
