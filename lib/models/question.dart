
import 'package:quiz_app/models/quiz.dart'; 
import '../models/choise.dart';

class Question {
  final int? questionId;
  final String text;
  final String type;
  final int point = 5;
  final int? rang;
  final int? rangReponse;
  // final List<Choises> choix; // Utilisez List<Choix> pour définir une liste de choix de question 
  final Quiz quiz;

  Question({
   this.questionId,
    required this.text,
    required this.type,
    this.rang,
    this.rangReponse,
    // required this.choix,
    required this.quiz,
  });

  
Map<String, dynamic> toJson() {
  // List<Map<String, dynamic>> choixListJson = choix.map((choix) => choix.toJson()).toList();

  return {
    'questionId': questionId,
    'text': text,
    'type': type,
    'point': point,
    'rang': rang,
    'rangReponse': rangReponse,
    // 'choix': choixListJson, 
    'quiz': quiz.toJson(),
  };
}


  factory Question.fromJson(Map<String, dynamic> json) => Question(
    questionId: json['questionId'],
    text: json['text'],
    type: json['type'],
    rang: json['rang'],
    rangReponse: json['rangReponse'],
    // choix: List<Choises>.from(json['choix'].map((e) => Choises.fromJson(e))),
    quiz: Quiz.fromJson(json['quiz']),
  );
}
