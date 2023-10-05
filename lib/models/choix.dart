import 'package:quiz_app/models/question.dart';

class Choix {
  final int? choiseId;
  final String text;
  final int? rank;
  final Question question;

  Choix({
    required this.choiseId,
    required this.text,
    required this.rank,
    required this.question,
  });

  Map<String, dynamic> toJson() => {
    "choiseId": choiseId,
    "text": text,
    "rank": rank,
    "question": question.toJson(),
  };

  factory Choix.fromJson(Map<String, dynamic> json) {
    return Choix(
      choiseId: json['choiseId'],
      text: json['text'],
      rank: json['rank'],
      question: Question.fromJson(json['question'])
    );
  }
}