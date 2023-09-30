import 'package:flutter/material.dart';

class Liste extends StatelessWidget {
  const Liste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste'),
      ),
      body: Center(
        child: Text('Liste des quizs'),
      ),
    );
  }
}