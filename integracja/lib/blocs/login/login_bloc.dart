import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:integracja/blocs/authentication/authentication_bloc.dart';
import 'package:integracja/services/authentication_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;
  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LogInWithCredentials) {
      yield* _mapLoginWithCredentials(event);
    }
  }

  Stream<LoginState> _mapLoginWithCredentials(
      LogInWithCredentials event) async* {
    yield LoginLoadingState();

    try {
      final user = await _authenticationService.signInWithCredentials(
          event.username, event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccessState();
        yield LoginInitialState();
      } else {
        yield LoginFailureState();
      }
    } catch (err) {
      yield LoginFailureState();
    }
  }
}
