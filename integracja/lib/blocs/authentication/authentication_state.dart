part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationInitialState";
  }
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationLoadingState";
  }
}

class AuthenticationNotAuthenticatedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationNotAuthenticatedState";
  }
}

class AuthenticationExpiredState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationExpiredState";
  }
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final User user;

  AuthenticationAuthenticatedState({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return "AuthenticationAuthenticatedState";
  }
}

class AuthenticationFailure extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationFailure";
  }
}
