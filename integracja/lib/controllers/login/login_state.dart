import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginIdle extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {}
