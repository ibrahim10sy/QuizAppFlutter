import 'package:quiz_app/models/quiz.dart';
import '../models/choise.dart';

class Question {
    final int? questionId;
    final String text;
    final String type;
    final int point;
    final int rank;
    final int rankResponse;
    final List<Choise> choises;

    Question({
        required this.questionId,
        required this.text,
        required this.type,
        required this.point,
        required this.rank,
        required this.rankResponse,
        required this.choises,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionId: json["questionId"],
        text: json["text"],
        type: json["type"],
        point: json["point"],
        rank: json["rank"],
        rankResponse: json["rankResponse"],
        choises: List<Choise>.from(json["choises"].map((x) => Choise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "text": text,
        "type": type,
        "point": point,
        "rank": rank,
        "rankResponse": rankResponse,
        "choises": List<dynamic>.from(choises.map((x) => x.toJson())),
    };
}