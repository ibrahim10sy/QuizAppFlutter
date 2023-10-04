// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';
// import 'package:quiz_app/models/quiz.dart';
// import 'package:quiz_app/widgets/quiz_card.dart';

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

  // get visibility => visibility;

  // get description => description;

  // get creationDate => creationDate;

  // get category => category;

  // get quizId => quizId;

  // get title => title;

  // get nbQuestion => nbQuestion;

  // get imageUrl => imageUrl;

  // get user => user;

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/finishQuiz.png'),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                    weight: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Animés'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Art'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Histoire')),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Culture')),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Actualité')),
                  ],
                ),
                // GestureDetector(),
              ),
              // QuizCard(
              //     quiz: Quiz(
              //         visibility: visibility,
              //         description: description,
              //         creationDate: creationDate,
              //         category: category,
              //         quizId: quizId,
              //         title: title,
              //         nbQuestion: nbQuestion,
              //         imageUrl: imageUrl,
              //         user: user),
              //     press: () {}),

              const SizedBox(height: 490),
              Container(
                width: 800,
                height: 30,
                color: const Color.fromARGB(255, 43, 27, 114),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.grid_view_sharp,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
