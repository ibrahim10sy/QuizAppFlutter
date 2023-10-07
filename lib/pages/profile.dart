import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../models/user.dart';
import '../services/local_notification_service.dart';
import '../widgets/quiz_card.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: QuizCard(
              useBaseUrl: true,
              quiz: Quiz(
                  visibility: "public",
                  description: "description",
                  creationDate: "creationDate",
                  category: "anime",
                  quizId: 0,
                  title: "title",
                  nbQuestion: 0,
                  imageUrl:
                  "informatique1.jpg",
                  user: User(
                      userId: 0,
                      firstName: "firstName",
                      lastName: "lastName",
                      email: "email",
                      password: "password",
                      login: "login",
                      imageUrl:
                      "informatique1.jpg")),
              press: () {}),
        )
    );
  }
}
