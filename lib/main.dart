import 'package:flutter/material.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/question.dart';
import 'package:quiz_app/theme.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      home:Nav() ,
     
    );
  }
}
