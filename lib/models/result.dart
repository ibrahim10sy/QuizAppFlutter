import 'question.dart';

class Result {
  final int? resultId;
  final int score;
  final bool state;
  DateTime creationDate;
  final int nbCorrectQuestion;
  final int nbIncorrectQuestion;
  final List<Question> questions;

  Result({
    required this.resultId,
    this.score=0,
    this.state=false,
    required this.creationDate,
    this.nbCorrectQuestion=0,
    this.nbIncorrectQuestion=0,
    required this.questions,
});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resultId: json['resultId'],
      score: json['score'],
      state: json['state'],
      creationDate: DateTime.parse(json["creationDate"]),
      nbCorrectQuestion: json['nbCorrectQuestion'],
      nbIncorrectQuestion: json['nbIncorrectQuestion'],
      questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "resultId": resultId,
    "score": score,
    "state": state,
    "creationDate": creationDate.toIso8601String(),
    "nbCorrectQuestion": nbCorrectQuestion,
    "nbIncorrectQuestion": nbIncorrectQuestion,
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),

  };
}