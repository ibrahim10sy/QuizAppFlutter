import 'package:flutter/material.dart';
import 'package:quiz_app/pages/played/body.dart';

class Played extends StatelessWidget {
  const Played({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes jeux'),
      ),
      body: Body(),
    );
  }
}