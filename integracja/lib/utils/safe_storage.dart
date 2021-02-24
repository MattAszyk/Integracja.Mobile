import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:integracja/models/authentication/credentials.dart';
import 'package:meta/meta.dart';

class SafeStorage {
  final _storage = new FlutterSecureStorage();

  SafeStorage();

  Future<void> deleteInSystem() async {
    if (await userExistInSystem()) {
      await _storage.deleteAll();
    }
  }

  bool writeToSafeStorage(
      {@required String username, @required String password}) {
    _storage.write(key: 'username', value: username);
    _storage.write(key: 'password', value: password);
    return true;
  }

  Future<bool> userExistInSystem() async {
    return await _storage.containsKey(key: 'username') &&
        await _storage.containsKey(key: 'password');
  }

  Future<Credentials> getCredentials() async {
    var username = await _storage.read(key: 'username');
    var password = await _storage.read(key: 'password');
    return Credentials(username: username, password: password);
  }
}
