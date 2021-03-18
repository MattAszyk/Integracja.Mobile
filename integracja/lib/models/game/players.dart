import 'package:equatable/equatable.dart';

class Players extends Equatable {
	final int userId;
	final String username;
	final String profileThumbnail;

	const Players({
		this.userId,
		this.username,
		this.profileThumbnail,
	});

	@override
	String toString() {
		return 'Players(userId: $userId, username: $username, profileThumbnail: $profileThumbnail)';
	}

	factory Players.fromJson(Map<String, dynamic> json) {
		return Players(
			userId: json['userId'] as int,
			username: json['username'] as String,
			profileThumbnail: json['profileThumbnail'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'userId': userId,
			'username': username,
			'profileThumbnail': profileThumbnail,
		};
	}

	@override
	List<Object> get props => [userId, username, profileThumbnail];
}
