import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart'; // Assurez-vous d'importer votre classe Question ici.

class QuestionChoose extends StatefulWidget {
  final List<Question> questions;

  QuestionChoose({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuestionChoose> createState() => _QuestionChooseState();
}

class _QuestionChooseState extends State<QuestionChoose> {
  int _time = 5;
  late Timer timer;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool showCorrectAnswer = false;
//  int correctAnswerIndex;


  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        } else {
          timer.cancel();
          goToNextQuestion();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // void checkAnswer(int answerIndex) {
  //   if (!showCorrectAnswer) {
  //     setState(() {
  //       selectedAnswerIndex = answerIndex;
  //       if (answerIndex == widget.questions[currentQuestionIndex].correctAnswerIndex) {
  //         // Réponse correcte
  //         showCorrectAnswer = true;
  //       } else {
  //         // Réponse incorrecte
  //         showCorrectAnswer = false;
  //         startTimer();
  //       }
  //     });
  //   }
  // }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        // Passer à la question suivante
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        showCorrectAnswer = false;
        _time = 5; // Réinitialiser le timer
        startTimer();
      } else {
        // Fin du quiz
        // Vous pouvez ajouter ici une logique pour afficher le score final ou passer à une autre page.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF3F489C);

    Question currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: myColor,
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Text(
                      '$_time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset('assets/image/rond.png'),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Question ${currentQuestionIndex + 1}/${widget.questions.length}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  currentQuestion.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Wrap(
                children: [
                  for (int i = 0; i < currentQuestion.choix.length; i++)
                    GestureDetector(
                      onTap: () {
                        // checkAnswer(i);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: (showCorrectAnswer && i == currentQuestion.rangReponse)
                              ? Colors.green
                              : (showCorrectAnswer && i == selectedAnswerIndex)
                                  ? Colors.red
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 35,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                            ),
                            Text(
                              "#$i",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  currentQuestion.choix[i].text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
