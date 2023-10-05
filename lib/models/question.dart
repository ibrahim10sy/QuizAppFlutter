import 'package:quiz_app/models/choix.dart';
import 'package:quiz_app/models/quiz.dart'; // Assumant que vous avez importé la classe Quiz

class Question {
  final int? questionId;
  final String text;
  final String type;
  final int point = 5;
  final int? rang;
  final int? rangReponse;
  final List<Choix> choix; // Utilisez List<Choix> pour définir une liste de choix
  final Quiz quiz;

  Question({
    this.questionId,
    required this.text,
    required this.type,
    this.rang,
    this.rangReponse,
    required this.choix,
    required this.quiz,
  });

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'text': text,
    'type': type,
    'point': point,
    'rang': rang,
    'rangReponse': rangReponse,
    'choix': choix.map((e) => e.toJson).toList(),
    'quiz': quiz.toJson,
  };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    questionId: json['questionId'],
    text: json['text'],
    type: json['type'],
    rang: json['rang'],
    rangReponse: json['rangReponse'],
    choix: List<Choix>.from(json['choix'].map((e) => Choix.fromJson(e))),
    quiz: Quiz.fromJson(json['quiz']),
  );
}
