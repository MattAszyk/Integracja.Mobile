import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String userName;
  final String email;
  final String profilePicture;
  final String profileThumbnail;
  final DateTime validTo;
  final String token;

  const User({
    this.id,
    this.userName,
    this.email,
    this.profilePicture,
    this.profileThumbnail,
    this.validTo,
    this.token,
  });

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, email: $email, profilePicture: $profilePicture, profileThumbnail: $profileThumbnail, validTo: $validTo, token: $token)';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userName: json['userName'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
      profileThumbnail: json['profileThumbnail'] as String,
      validTo: DateTime.parse(json['validTo']).toLocal(),
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'profilePicture': profilePicture,
      'profileThumbnail': profileThumbnail,
      'validTo': validTo,
      'token': token,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      userName,
      email,
      profilePicture,
      profileThumbnail,
      validTo,
      token,
    ];
  }
}
