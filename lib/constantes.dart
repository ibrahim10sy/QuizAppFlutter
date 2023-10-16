import 'package:flutter/material.dart';
import 'package:quiz_app/models/choise.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';

final kAppBarColor = const Color(0xFF3F489C).withOpacity(0.8); // Couleur par defaut du AppBarr
const kPrimaryColor = Color(0xFF3F489C);
const Color kRoundedCategoryColor = Color(0xFFFFA51E);
const kSecondaryColor = Colors.deepPurple;
const kBackgroundColor = Color(0xFFEAEAFF); // Couleur par défaut du background de chaque Scaffold
const kTextColor = Colors.black; // Couleur par defaut des texte
const kButtonRoundedColor = Colors.black54;
const kFourColor = Color(0xFFF5F6F9);
const List<String> kCategories = [
  "anime", "science", "histoire", "informatique",
  "culture general", "geographie", "mecanique", "culture"
];
const baseUrl = "http://10.175.48.163";
//const baseUrl = "http://10.0.2.2";
const kBaseUrlForImage = "${baseUrl}/quizmasterimg/";


class ProfileDataType {
  static const String prenom = "Prénom";
  static const String nom = "Nom";
  static const String dateDeNaissance = "Date de naissance";
  static const String identifiant = "Identifiant";
  static const String motDePasse = "Mot de passe";
}

enum NotificationType {
  newQuiz
}

User currentUser = User(userId: 1, firstName: "Drissa Sidiki", lastName: "Traore", email: "drissa@gmail.com", password: "1234", login: "ramsey6340", imageUrl: "Anime_zone.jpg");

Quiz currentQuiz = Quiz(visibility: 'public', description: "description", creationDate: "2023-10-03", category: "art1.jpg", quizId: 1, title: "Les plus celèbre peintre de l'histoire", nbQuestion: 5, imageUrl: "art1.jpg", user: currentUser, questions: []);
Question currentQuestion = Question(
    questionId: 1, text: 'Dans le monde des arts, qui appele t-on est Fibonashi, l\'unique ?',
    type: 'choix-multiple', point: 5, rank: 1,
    rankResponse: 2,
    choises: [
      Choise(choiseId: 1, text: "Un squetteur celèbre du 19ieme siecle", rank: 1),
      Choise(choiseId: 2, text: "Un peintre celèbre du 18ieme siècle", rank: 2),
      Choise(choiseId: 3, text: "Un chanteur", rank: 3),
      Choise(choiseId: 4, text: "Peronne, il n'existe pas", rank: 4),
    ]
);