import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:integracja/blocs/authentication/authentication_bloc.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/network/api_exception.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AuthenticationBloc _authenticationBloc;
  HomePageBloc(AuthenticationBloc authenticationBloc)
      : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc,
        super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadDataFromServer) {
      yield* _mapToLoadDataFromServer(event);
    }
  }

  Stream<HomePageState> _mapToLoadDataFromServer(
      LoadDataFromServer event) async* {
    yield HomePageLoadingState();
    try {
      final gameList = await GameRepository(user: event.user).fetchAll();
      if (gameList != null) {
        yield HomePageLoadedState(gameList: gameList);
      }
    } on UnauthorizedException {
      _authenticationBloc.add(UserLoggedOut());
    } on BadRequestException {
      yield HomePageLoadingFailedState();
    } catch (e) {
      yield HomePageLoadingFailedState();
      log(e.toString());
    }
  }
}
