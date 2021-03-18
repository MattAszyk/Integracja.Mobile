import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/services/authentication_service.dart';

class AuthenticationController extends GetxController {
  final AuthenticationService _authenticationService;
  final _authenticationStateStream = AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this._authenticationService);

  @override
  void onInit() {
    getUserFromSystem();
    super.onInit();
  }

  Future<void> signInWithCredentials(
      {@required username, @required password}) async {
    try {
      final user = await _authenticationService.signInWithCredentials(
          username, password);
      _authenticationStateStream.value = Authenticated(user: user);
    } catch (e) {}
  }

  void signOut() async {
    _authenticationService.signOut();
    _authenticationStateStream.value = Unauthenticated();
  }

  Future<void> getUserFromSystem() async {
    _authenticationStateStream.value = AuthenticationLoading();

    try {
      final currentUser = await _authenticationService.getCurrentUser();
      if (currentUser == null) {
        _authenticationStateStream.value = Unauthenticated();
      } else {
        _authenticationStateStream.value = Authenticated(user: currentUser);
      }
    } catch (e) {
      log('getUserFromSystem: ${e.toString()}');
    }
  }
}
