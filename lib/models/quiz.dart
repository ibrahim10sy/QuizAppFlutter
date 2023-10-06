
// import 'package:quiz_app/models/user.dart';

// class  Quiz {
//   final int? quizId;
//   final String title;
//   final int nbQuestion;
//   final String visibility;
//   final String description;
//   final String? creationDate;
//   final String category; // il répresente le domain dans spring boot
//   final String imageUrl;
//   final User user;

//   Quiz({
//     required this.visibility,
//     required this.description,
//     required this.creationDate,
//     required this.category,
//     required this.quizId,
//     required this.title,
//     required this.nbQuestion,
//     required this.imageUrl,
//     required this.user
//   });
  
//     Map<String, dynamic> toJson() => {
//       "quizId": quizId,
//       "title": title,
//       "nbMaxQuestion": nbQuestion,
//       "visibility": visibility,
//       "description": description,
//       "creationDate": creationDate,
//       "domain": category,
//       "imageUrl": imageUrl,
//       "user": user.toJson(),
//     };
    
//   factory Quiz.fromJson(Map<String, dynamic> json) {
//     return Quiz(
//         quizId: json['quizId'],
//         title: json['title'],
//         nbQuestion: json['nbMaxQuestion'],
//         visibility: json['visibility'],
//         description: json['description'],
//         creationDate: json['creationDate'],
//         category: json['domain'],
//         imageUrl: json['imageUrl'],
//         user: User.fromJson(json['user'])
//     );
//   }

// }
import 'package:quiz_app/models/user.dart';

class  Quiz {
  final int? quizId;
  final String title;
  final int nbQuestion;
  final String visibility;
  final String description;
  final String? creationDate;
  final String category; // il répresente le domain dans spring boot
  final String imageUrl;
  final User user;

  Quiz({
    required this.visibility,
    required this.description,
    required this.creationDate,
    required this.category,
    required this.quizId,
    required this.title,
    required this.nbQuestion,
    required this.imageUrl,
    required this.user
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        quizId: json['quizId'],
        title: json['title'],
        nbQuestion: json['nbQuestion'],
        visibility: json['visibility'],
        description: json['description'],
        creationDate: json['creationDate'],
        category: json['domain'],
        imageUrl: json['imageUrl'],
        user: User.fromJson(json['user'])
    );
  }

    Map<String, dynamic> toJson() => {
      "quizId": quizId,
      "title": title,
      "nbQuestion": nbQuestion,
      "visibility": visibility,
      "description": description,
      "creationDate": creationDate,
      "domain": category,
      "imageUrl": imageUrl,
      "user": user.toJson(),
    };

}