part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  String toString() {
    return "LoginInitialState";
  }
}

class LoginLoadingState extends LoginState {
  @override
  String toString() {
    return "LoginLoadingState";
  }
}

class LoginSuccessState extends LoginState {
  @override
  String toString() {
    return "LoginSuccessState";
  }
}

class LoginFailureState extends LoginState {
  @override
  String toString() {
    return "LoginFailureState";
  }
}
