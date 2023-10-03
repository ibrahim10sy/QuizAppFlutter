import 'package:flutter/material.dart';
import 'package:quiz_app/connexion.dart';
import 'package:quiz_app/inscription.dart';
import 'package:quiz_app/nav.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Master',
      home: Connexion() ,
      initialRoute: '/',
      routes: {
        '/nav':(context) => Nav(),
        '/inscription': (context) => SignUp(),
        '/connexion': (context) => SignIn(),
      },
    );
  }
}

