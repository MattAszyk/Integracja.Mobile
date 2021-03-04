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
    super.onInit();
  }

  void login(String username, String password) async {
    _loginStateStream.value = LoginLoading();
    try {
      await _authenticationController.signInWithCredentials(
          username: username, password: password);
      _loginStateStream.value = LoginIdle();
    } catch (e) {
      _loginStateStream.value = LoginFailure();
    }
  }
}
