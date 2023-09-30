// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FinQuiz(),
    );
  }
}

class FinQuiz extends StatelessWidget {
  const FinQuiz({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Image.asset('../assets/images/lose.png'),
        ));
  }
}
