import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/before_start_quiz.dart';
import 'package:quiz_app/pages/bravo.dart';
import 'package:quiz_app/pages/load_animated.dart';
import 'package:quiz_app/pages/lost.dart';
import 'package:quiz_app/pages/question_choose.dart';
import 'package:quiz_app/pages/splashScreen.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      home:  Lost() ,
      // home:  BeforeStartQuiz() ,
    );
  }
}

