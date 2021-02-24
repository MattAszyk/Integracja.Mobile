import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integracja/blocs/authentication/authentication_bloc.dart';
import 'package:integracja/blocs/login/login_bloc.dart';
import 'package:integracja/services/authentication_service.dart';
import 'package:integracja/utils/constrains.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/login_screen/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationNotAuthenticatedState) {
              return _AuthenticationForm();
            }
            if (state is AuthenticationFailure) {
              return _AuthenticationForm();
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AuthenticationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationService =
        RepositoryProvider.of<AuthenticationService>(context);
    final authenticationBloc =
        RepositoryProvider.of<AuthenticationBloc>(context);
    return Container(
      constraints: BoxConstraints.expand(),
      child: BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authenticationBloc, authenticationService),
        child: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _usernameController.text = 'exampleuser';
    _passwordController.text = 'VDGqwxycPZb3fzy.';
    Size size = MediaQuery.of(context).size;
    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    _onLoginButtonPressed() {
      _loginBloc.add(LogInWithCredentials(
          username: _usernameController.text,
          password: _passwordController.text));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          //TODO: error
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return Column(
              children: [
                _buildLogo(),
                Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ),
                )
              ],
            );
          }
          return SingleChildScrollView(
            key: _key,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _usernameForm(),
                _passwordForm(),
                _clickableLabel(false),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: size.width * 0.9,
                        height: size.height * 0.065,
                        child: RaisedButton(
                          color: Colors.transparent,
                          onPressed: state is LoginLoadingState
                              ? () {}
                              : _onLoginButtonPressed,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0),
                              side: BorderSide(color: primaryColor)),
                          child: Text(
                            "Zaloguj się",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
                _clickableLabel(true)
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _clickableLabel(bool isRegister) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          bottom: isRegister ? 0 : 0.005 * height, top: 0.005 * height),
      child: FlatButton(
        onPressed: isRegister ? registrationForm : forgotPasswordForm,
        child: Text(
          isRegister ? "Zarejestruj się" : "Przypomnij hasło",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  Padding _buildLogo() {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 0.25 * height, bottom: 0.1 * height),
      child: Text.rich(
        TextSpan(
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: 'inte'),
              TextSpan(text: 'GRA', style: TextStyle(color: primaryColor)),
              TextSpan(text: 'cja')
            ]),
      ),
    );
  }

  Widget _usernameForm() {
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.001 * height),
      margin: EdgeInsets.only(
        top: 0.01 * height,
        bottom: 0.02 * height,
        left: 20,
        right: 20,
      ),
      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
            labelText: 'Nazwa użytkownika',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusColor: primaryColor),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _passwordForm() {
    double height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.001 * height),
      margin: EdgeInsets.only(
        bottom: 0.01 * height,
        left: 20,
        right: 20,
      ),
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
            labelText: 'Hasło',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusColor: primaryColor),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _launchSite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch registration.';
    }
  }

  forgotPasswordForm() => _launchSite(forgotPasswordPage);
  registrationForm() => _launchSite(registrationPage);
}
