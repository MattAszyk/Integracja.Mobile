import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integracja/pages/home_page/home_page.dart';
import 'package:integracja/pages/login/login_page.dart';
import 'package:integracja/services/authentication_service.dart';
import 'package:integracja/utils/constrains.dart';
import 'blocs/authentication/authentication_bloc.dart';

void main() {
  //SafeStorage().deleteInSystem();
  runApp(RepositoryProvider<AuthenticationService>(
    create: (context) {
      return RemoteAuthenticationService();
    },
    // Injects the Authentication BLoC
    child: BlocProvider<AuthenticationBloc>(
      create: (context) {
        final authService =
            RepositoryProvider.of<AuthenticationService>(context);
        return AuthenticationBloc(authService)..add(ApplicationLoaded());
      },
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inteGRAcja',
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      // BlocBuilder will listen to changes in AuthenticationState
      // and build an appropriate widget based on the state.
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticatedState) {
            // show home page
            return HomePage(
              user: state.user,
            );
          }
          // otherwise show login page
          return LoginPage();
        },
      ),
    );
  }
}

ThemeData customTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
  );
}
