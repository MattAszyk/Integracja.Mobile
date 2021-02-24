part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogInWithCredentials extends LoginEvent {
  final String username;
  final String password;

  LogInWithCredentials({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}