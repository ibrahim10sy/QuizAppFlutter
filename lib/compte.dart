import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // home: FinQuiz(),
        );
  }
}

class Compte extends StatelessWidget {
  const Compte({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/finishQuiz.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                  weight: 40,
                ),
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('Animés')),
                  TextButton(onPressed: () {}, child: const Text('Animés')),
                  TextButton(onPressed: () {}, child: const Text('Animés')),
                  TextButton(onPressed: () {}, child: const Text('Animés')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
