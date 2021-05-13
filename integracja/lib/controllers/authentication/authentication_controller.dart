import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/controllers/home_page/home_page_controller.dart';
import 'package:integracja/pages/error/error_page.dart';
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
      try {
        Get.find<HomePageController>().refresh();
      } catch (e) {}
    } on TimeoutException {
      Get.to(() => ErrorPage(
            "Serwer nie odpowiada. Sprawdź połączenie z internetem.",
            showImage: true,
          ));
      _authenticationStateStream.value = Unauthenticated();
    } catch (e) {
      Get.to(() => ErrorPage("Niepoprawne dane."));
      _authenticationStateStream.value = Unauthenticated();
    }
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
    } on TimeoutException {
      _authenticationStateStream.value = Unauthenticated();
    } catch (e) {
      log('getUserFromSystem: ${e.toString()}');
      _authenticationStateStream.value = Unauthenticated();
    }
  }
}
