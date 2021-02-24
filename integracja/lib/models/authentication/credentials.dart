import 'package:integracja/models/api_item.dart';

class Credentials extends ApiRequest {
  String username;
  String password;

  Credentials({this.username, this.password});

  @override
  String toString() {
    return 'Credentials(username: $username, password: $password)';
  }

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
