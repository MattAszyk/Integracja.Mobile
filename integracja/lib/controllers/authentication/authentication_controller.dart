import 'dart:async';
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
    _authenticationStateStream.value = Unauthenticated();

    super.onInit();
  }

  Future<void> signInWithCredentials(
      {@required username, @required password}) async {
    final user =
        await _authenticationService.signInWithCredentials(username, password);
    _authenticationStateStream.value = Authenticated(user: user);
  }

  void signOut() async {
    _authenticationService.signOut();
    _authenticationStateStream.value = Unauthenticated();
  }

  Future<void> getUserFromSystem() async {
    try {
      getUserFromSystem();
    } catch (e) {
      _authenticationStateStream.value = Unauthenticated();
    }
  }

  Future<void> _getUserFromSystem() async {
    _authenticationStateStream.value = AuthenticationLoading();
    final currentUser = await _authenticationService.getCurrentUser();
    if (currentUser == null) {
      _authenticationStateStream.value = Unauthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(user: currentUser);
    }
  }
}
