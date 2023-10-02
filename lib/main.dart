import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
// import 'package:quiz_app/comptepublic';



void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Master',
      home: Nav() ,
    );
  }
}

