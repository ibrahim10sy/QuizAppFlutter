import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home/home.dart';
import 'package:quiz_app/pages/played/played.dart';


final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => const Home(),
  Played.routeName: (context) =>const Played(),
} ;