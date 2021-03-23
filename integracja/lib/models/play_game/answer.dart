import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int id;
  bool isCorrect;
  final String content;
  bool isSelected = false;
  Answer({this.id, this.content, bool isCorrect}) {
    this.isCorrect = isCorrect;
  }

  @override
  String toString() {
    return 'Answers(id: $id, isCorrect: $isCorrect, content: $content)';
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as int,
      isCorrect: json['isCorrect'] != null ? json['isCorrect'] : null,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isCorrect': isCorrect,
      'content': content,
    };
  }

  @override
  List<Object> get props => [id, isCorrect, content];
}
