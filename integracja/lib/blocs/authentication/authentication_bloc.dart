import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/services/authentication_service.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;

  AuthenticationBloc(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        _authenticationService = authenticationService,
        super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is ApplicationLoaded) {
      yield* _mapApplicationLoadedToState(event);
    }
    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
    if (event is UserTokenExpired) {
      yield* _mapAuthenticationExpiredState(event);
    }
  }

  Stream<AuthenticationState> _mapApplicationLoadedToState(
      ApplicationLoaded event) async* {
    yield AuthenticationLoadingState();
    try {
      final currentUser = await _authenticationService.getCurrentUser();
      if (currentUser == null) log('User is null');
      if (currentUser != null) {
        yield AuthenticationAuthenticatedState(user: currentUser);
      } else {
        yield AuthenticationNotAuthenticatedState();
      }
    } catch (e) {
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationAuthenticatedState(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(
      UserLoggedOut event) async* {
    await _authenticationService.signOut();
    yield AuthenticationNotAuthenticatedState();
  }

  Stream<AuthenticationState> _mapAuthenticationExpiredState(
      UserTokenExpired event) async* {
    final currentUser = await _authenticationService.getCurrentUser();
    yield currentUser != null
        ? AuthenticationAuthenticatedState(user: currentUser)
        : AuthenticationNotAuthenticatedState();
  }
}
