import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/login/login_state.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  final _loginStateStream = LoginState().obs;
  LoginState get state => _loginStateStream.value;

  @override
  void onInit() {
    _loginStateStream.value = LoginIdle();
    tryLoginFromDatabase();
    super.onInit();
  }

  void tryLoginFromDatabase() {
    try {
      _loginStateStream.value = LoginLoading();
      _authenticationController.getUserFromSystem();
      _loginStateStream.value = LoginIdle();
    } on TimeoutException {
      _loginStateStream.value = LoginTimeout();
    }
  }

  void backToLoginIdle() {
    _loginStateStream.value = LoginIdle();
  }

  void login(String username, String password) async {
    _loginStateStream.value = LoginLoading();
    try {
      if (username != null && password != null)
        await _authenticationController.signInWithCredentials(
            username: username, password: password);
      else
        _authenticationController.getUserFromSystem();
      _loginStateStream.value = LoginIdle();
    } on TimeoutException {
      _loginStateStream.value = LoginTimeout();
    } catch (e) {
      _loginStateStream.value = LoginFailure();
    }
  }
}
