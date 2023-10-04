import 'package:flutter/material.dart';

final kAppBarColor = const Color(0xFF3F489C).withOpacity(0.8); // Couleur par defaut du AppBarr
const kBackgroundColor = Color(0xFFEAEAFF); // Couleur par défaut du background de chaque Scaffold
const kTextColor = Colors.black; // Couleur par defaut des texte

const List<String> kCategories = [
  "anime", "science", "histoire", "informatique",
  "culture general", "geographie", "mecanique"
];
// const baseUrl = "http://10.175.48.150";
const baseUrl = "http://localhost:9000";
// const baseUrl = "http://192.168.1.113";
//const baseUrl = "http://10.0.2.2";
const kBaseUrlForImage = "${baseUrl}/quizmasterimg/";