import 'package:quiz_app/models/question.dart';

class Choise {
    final int? choiseId;
    final String text;
    final int rank;

    Choise({
        required this.choiseId,
        required this.text,
        required this.rank,
    });

    factory Choise.fromJson(Map<String, dynamic> json) => Choise(
        choiseId: json["choiseId"],
        text: json["text"],
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "choiseId": choiseId,
        "text": text,
        "rank": rank,
    };
}