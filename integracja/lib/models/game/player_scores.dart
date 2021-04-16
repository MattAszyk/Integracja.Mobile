class PlayerScores {
  int userId;
  String username;
  String profileThumbnail;
  num gameScore;

  PlayerScores({
    this.userId,
    this.username,
    this.profileThumbnail,
    this.gameScore,
  });

  factory PlayerScores.fromJson(Map<String, dynamic> json) {
    return PlayerScores(
      userId: json['userId'] as int,
      username: json['username'] as String,
      profileThumbnail: json['profileThumbnail'] as String,
      gameScore: json['gameScore'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'profileThumbnail': profileThumbnail,
      'gameScore': gameScore,
    };
  }
}
