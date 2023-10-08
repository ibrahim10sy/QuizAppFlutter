
import 'package:quiz_app/models/question.dart';

class Choises {
  final int? choiseId;
  final String text;
  final int rank;
  final Question question;

  Choises({
    this.choiseId,
    required this.text,
    required this.rank,
    required this.question,
  });

  Map<String, dynamic> toJson() =>{
    'choiseId' : choiseId,
    'text' : text,
    'rank' : rank,
    'question' : question.toJson(),
  };

  factory Choises.fromJson(Map<String, dynamic> json) {
  return Choises(
    choiseId: json['choiseId'],
    text: json['text'],
    rank: json['rank'],
    question: Question.fromJson(json['question']), // Utilisez Question.fromJson pour créer l'objet Question
  );
}

}