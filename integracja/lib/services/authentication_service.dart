import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api/login_repository.dart';
import 'package:integracja/utils/safe_storage.dart';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithCredentials(String username, String password);
  Future<void> signOut();
}

class RemoteAuthenticationService extends AuthenticationService {
  final _safeStorage = new SafeStorage();
  final _loginRepository = new LoginRepository();
  @override
  Future<User> getCurrentUser() async {
    if (await _safeStorage.userExistInSystem()) {
      var credentials = await _safeStorage.getCredentials();
      return signInWithCredentials(credentials.username, credentials.password);
    }
    return null;
  }

  @override
  Future<User> signInWithCredentials(String username, String password) async {
    var _user =
        await _loginRepository.fetch(username: username, password: password);
    if (_user != null) {
      _safeStorage.writeToSafeStorage(username: username, password: password);
    }
    return _user;
  }

  @override
  Future<void> signOut() async {
    _safeStorage.deleteInSystem();
  }
}
