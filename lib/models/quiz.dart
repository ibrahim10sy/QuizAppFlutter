import 'package:quiz_app/models/user.dart';

class  Quiz {
  final String id;
  final String title;
  final int nbQuestion;
  final String imageUrl;
  final User user;

  Quiz({
    required this.id,
    required this.title,
    required this.nbQuestion,
    required this.imageUrl,
    required this.user
  });

}