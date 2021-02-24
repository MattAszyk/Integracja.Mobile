part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

//on startup
class ApplicationLoaded extends AuthenticationEvent {}

//when we get token
class UserLoggedIn extends AuthenticationEvent {
  final User user;
  UserLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];
}

//when user click logout button
class UserLoggedOut extends AuthenticationEvent {}

class UserTokenExpired extends AuthenticationEvent {}
