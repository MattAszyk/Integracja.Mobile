import 'package:integracja/models/api_item.dart';

class User extends ApiRequest {
  final DateTime expireOnDate;
  final int expiryIn;
  final String token;

  User(
    this.expireOnDate,
    this.expiryIn,
    this.token,
  );

  @override
  String toString() {
    return 'User(expireOnDate: expiryIn: $expiryIn, token: $token)';
  }

  User.fromJson(Map<String, dynamic> json)
      : expireOnDate = DateTime.parse(json['expireOnDate']),
        expiryIn = json['expiryIn'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    return {
      'expireOnDate': expireOnDate,
      'expiryIn': expiryIn,
      'token': token,
    };
  }
}
