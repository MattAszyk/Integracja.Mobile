import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/controllers/login/login_controller.dart';
import 'package:integracja/controllers/login/login_state.dart';
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
        image: AssetImage("assets/images/login_screen/login_background.jpg"),
        fit: BoxFit.cover,
      )),
      child: _SignInForm(),
    ));
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final _controller = Get.put(LoginController());
  final _authController = Get.find<AuthenticationController>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    _usernameController.text = 'user';
    _passwordController.text = '12345aA!';
    return Obx(() {
      return Form(
        key: _key,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
            child: Column(
          children: [
            if (_controller.state is LoginLoading ||
                _authController.state is AuthenticationLoading)
              _loading(),
            if (_controller.state is LoginIdle &&
                !(_authController.state is AuthenticationLoading))
              _signIn()
          ],
        )),
      );
    });
  }

  Column _signIn() {
    final size = MediaQuery.of(context).size;
    onLoginButtonPressed() {
      if (_key.currentState.validate()) {
        _controller.login(_usernameController.text, _passwordController.text);
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return Column(children: [
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
                onPressed: _controller.state is LoginLoading
                    ? () {}
                    : onLoginButtonPressed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(16.0),
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
    ]);
  }

  Column _loading() {
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
