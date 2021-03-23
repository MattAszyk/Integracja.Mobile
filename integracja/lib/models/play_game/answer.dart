class Answer {
  int id;
  String content;
  bool isCorrect;

  Answer({
    this.id,
    this.content,
  });

  @override
  String toString() {
    return 'Answer(id: $id, content: $content';
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as int,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }
}
