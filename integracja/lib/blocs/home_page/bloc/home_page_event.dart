part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadDataFromServer extends HomePageEvent {
  final User user;
  LoadDataFromServer({@required this.user});

  @override
  List<Object> get props => [user];
}
