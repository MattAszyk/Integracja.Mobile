class Gamemode {
	int id;
	String name;
	int timeForFullQuiz;
	int timeForOneQuestion;
	int numberOfLives;
	bool isPublic;
	int ownerId;
	String ownerUsername;

	Gamemode({
		this.id,
		this.name,
		this.timeForFullQuiz,
		this.timeForOneQuestion,
		this.numberOfLives,
		this.isPublic,
		this.ownerId,
		this.ownerUsername,
	});

	@override
	String toString() {
		return 'Gamemode(id: $id, name: $name, timeForFullQuiz: $timeForFullQuiz, timeForOneQuestion: $timeForOneQuestion, numberOfLives: $numberOfLives, isPublic: $isPublic, ownerId: $ownerId, ownerUsername: $ownerUsername)';
	}

	factory Gamemode.fromJson(Map<String, dynamic> json) {
		return Gamemode(
			id: json['id'] as int,
			name: json['name'] as String,
			timeForFullQuiz: json['timeForFullQuiz'] as int,
			timeForOneQuestion: json['timeForOneQuestion'] as int,
			numberOfLives: json['numberOfLives'] as int,
			isPublic: json['isPublic'] as bool,
			ownerId: json['ownerId'] as int,
			ownerUsername: json['ownerUsername'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'timeForFullQuiz': timeForFullQuiz,
			'timeForOneQuestion': timeForOneQuestion,
			'numberOfLives': numberOfLives,
			'isPublic': isPublic,
			'ownerId': ownerId,
			'ownerUsername': ownerUsername,
		};
	}
}
