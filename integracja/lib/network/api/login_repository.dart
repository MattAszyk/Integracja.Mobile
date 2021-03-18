import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:integracja/models/authentication/credentials.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api_base.dart';

class LoginRepository {
  static Future<User> fetch(
      {@required String username, @required String password}) async {
    final apiBase = Get.find<ApiBase>();

    var credentials = Credentials(username: username, password: password);
    var response = await apiBase.request(
        requestType: RequestType.POST,
        api: API.Auth,
        transferObject: credentials);
    return User.fromJson(response);
  }
}
