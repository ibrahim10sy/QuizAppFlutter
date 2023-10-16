import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/home/home.dart';
import 'package:quiz_app/pages/play_quiz/PlayQuiz.dart';
import 'package:quiz_app/pages/quiz_detail/quiz_detail.dart';

import '../../models/Result.dart';
import '../../models/quiz.dart';

class EndGame extends StatelessWidget {
  const EndGame({super.key, required this.result, required this.quiz});
  final Result result;
  final Quiz quiz;

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox(),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
                child: Image.asset('assets/image/finQuiz.png')),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Vous avez completé le quiz",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blueAccent),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${result.nbCorrectQuestion}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24,
                                color: Colors.black),
                          ),
                          const Text(
                            "correctes",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ]),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.redAccent),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${result.nbIncorrectQuestion}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24,
                                color: Colors.black),
                          ),
                          const Text(
                            "Incorrectes",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green),
                  child: const Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '14' + 's',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24,
                                color: Colors.black),textAlign: TextAlign.center,
                          ),
                          Text(
                            "Par Question",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.amber),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${result.score}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
                      ),
                      const Text(
                        "Score",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 140,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 101, 93),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizDetail(quiz: quiz, previewWidget: Nav(),)));
                    },
                    icon: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Quitter",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 140, // Largeur fixe
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayQuiz(quiz: quiz)));
                    },
                    icon: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rejouer",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Icon(
                          Icons.replay,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}