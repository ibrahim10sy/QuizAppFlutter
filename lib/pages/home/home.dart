import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home/body.dart';
import 'package:quiz_app/pages/home/widgets/app_bar_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
      ),
      body: Body(),
    );
  }
}