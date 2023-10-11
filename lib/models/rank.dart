import 'package:quiz_app/models/user.dart';

class Rank {
  String score;
  int rank;
  User user;

  Rank({
    required this.score,
    required this.rank,
    required this.user,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    score: json["score"],
    rank: json["rank"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "rank": rank,
    "user": user.toJson(),
  };
}