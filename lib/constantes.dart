import 'package:flutter/material.dart';

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
const baseUrl = "http://10.175.48.44";
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