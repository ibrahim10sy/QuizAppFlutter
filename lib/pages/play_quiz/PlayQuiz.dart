import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/bravo.dart';
import 'package:quiz_app/pages/home/home.dart';
import 'package:quiz_app/pages/lost.dart';
import 'package:quiz_app/pages/quiz_detail/quiz_detail.dart';
import 'package:quiz_app/services/play_service.dart';
import 'package:quiz_app/services/question_service.dart';

import '../../models/Result.dart';
import '../../models/question.dart';
import '../../models/quiz.dart';
import '../end_game/end_game.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  int _time = 5;
  int score = 0;

  Result? result;
  late bool isPlayed;
  List<bool?> responseSelection = [];

  late Timer timer;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool showCorrectAnswer = false;
  bool clickedChoice = false;

  PlayService playService = PlayService();
  Question nextQuestion = Question(
      questionId: null,
      text: "",
      type: "",
      point: 0,
      rank: 0,
      rankResponse: 0,
      choises: []);
  int currentIndexOfQuestion = 0;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        }
        // else if(_time==0 && selectedAnswerIndex != -1){
        // showCorrectAnswer = true;
        //   goToNextQuestion();
        // }
        else {
          timer.cancel();

          //goToNextQuestion();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    isPlayed = false;
    //nextQuestion = widget.quiz.questions[currentIndexOfQuestion];
    playService
        .getNextQuestion(currentUser.userId!, widget.quiz.quizId!)
        .then((value) {
      nextQuestion = value;
      responseSelection = List.generate(
          nextQuestion.choises.length,
          (index) =>
              null); // On crée une liste boolean dont les valeurs par defaut sont null, cela nous permet de ne pas donner de couleur par defaut au reponse
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<Result?> resultOfPlayed(int rankChoice) async {
    setState(() {
      isPlayed = true;
    });
    return playService.answerQuestion(
        currentUser.userId!, currentQuiz.quizId!, rankChoice);
  }

  bool isAnswerCorrect(int newScore, int selectIndex) {
    bool isCorrect = false;
    setState(() {
      isPlayed = true;
      isCorrect = score < newScore;
      responseSelection[selectIndex] = (isCorrect) ? true : false;
      responseSelection[nextQuestion.rankResponse - 1] = true;
      score = newScore;
    });
    return isCorrect;
  }

  void setNextQuestion() {
    print("je suis dedans");
    if (widget.quiz.questions.length > nextQuestion.rank) {
      Timer(
        const Duration(seconds: 3),
        () {
          currentIndexOfQuestion++;
          playService
              .getNextQuestion(currentUser.userId!, widget.quiz.quizId!)
              .then((value) {
            setState(() {
              nextQuestion = value;
              responseSelection =
                  List.generate(nextQuestion.choises.length, (index) => null);
              isPlayed = false;
            });
          }).catchError((onError) {
            print(onError);
          });
        },
      );
    } else {
      // On a repondu à toute les question, on peut aller maintenant à la page de fin de quiz (EndGame)
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => EndGame(
              result: result!,
              quiz: widget.quiz,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  /*void calculateScore(int answerIndex) {
    int totalScore = 0;
    for (int i = 0; i <= currentQuestionIndex; i++) {
      // if (i == questions[i].correctAnswerIndex) {
      if (i == currentQuestionIndex &&
          answerIndex == questions[i].correctAnswerIndex) {
        totalScore += 10; // Points appropriés pour la réponse correcte
      }
      //  if(i != currentQuestionIndex && answerIndex == questions[i].correctAnswerIndex){
      //      totalScore += 10;
      // }
    }
    setState(() {
      score = totalScore;
    });
  }*/

  /*void checkAnswer(int answerIndex) {
    if (!showCorrectAnswer) {
      setState(() {
        selectedAnswerIndex = answerIndex;
        if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
          // Réponse correcte
          showCorrectAnswer = true;
          calculateScore(answerIndex);
        } else {
          // Réponse incorrecte
          showCorrectAnswer = true;
          if (_time == 0) {
            // Le timer est à 0 et aucune réponse n'a été choisie
            showCorrectAnswer = true;
          }
          startTimer();
        }
      });
    }
  }*/

  /*void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        // Passer à la question suivante
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        showCorrectAnswer = false;
        _time = 5; // Réinitialiser le timer

        startTimer();
      } else if (currentQuestionIndex == questions.length - 1 && score == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Lost(),
          ),
        );
      } // Fin du quiz
      else {
        // Vous pouvez ajouter ici une logique pour afficher le score final ou passer à une autre page.
        // Vérifiez d'abord si le jeu est terminé
        calculateScore(
            selectedAnswerIndex); // Calculez le score à la fin du quiz
        // Naviguer vers la page Bravo avec le score final
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bravo(),
          ),
        );
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF3F489C);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.close, size: 30),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizDetail(quiz: widget.quiz, previewWidget: Nav(),)));
        },
      )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${nextQuestion.rank}/${widget.quiz.nbQuestion}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Score: $score",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kAppBarColor),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "44 s",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image:
                              NetworkImage("${kBaseUrlForImage}art/art1.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "${nextQuestion.text}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            (nextQuestion != null)
                ? Expanded(
                    child: ListView.builder(
                        itemCount: nextQuestion.choises.length,
                        itemBuilder: (context, index) {
                          final choice = nextQuestion.choises[index];
                          return GestureDetector(
                            onTap: () {
                              resultOfPlayed(choice.rank).then((value) {
                                result = value;
                                isAnswerCorrect(result!.score, choice.rank - 1);
                                setNextQuestion();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: (responseSelection[index] != null)
                                      ? (responseSelection[index]!)
                                          ? Colors.green
                                          : (!responseSelection[index]!)
                                              ? Colors.red
                                              : Colors.transparent
                                      : Colors.transparent,
                                  border: Border.all(
                                      width: 2,
                                      color: (responseSelection[index] != null)
                                          ? (responseSelection[index]!)
                                              ? Colors.transparent
                                              : (!responseSelection[index]!)
                                                  ? Colors.transparent
                                                  : Colors.black26
                                          : Colors.black26),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Row(
                                children: [
                                  Text("${choice.rank}",
                                      style: TextStyle(
                                          color: (responseSelection[index] !=
                                                  null)
                                              ? (responseSelection[index]!)
                                                  ? Colors.white
                                                  : (!responseSelection[index]!)
                                                      ? Colors.white
                                                      : Colors.black
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      textAlign: TextAlign.start),
                                  Container(
                                    width: 1,
                                    height: 25,
                                    color: (responseSelection[index] != null)
                                        ? (responseSelection[index]!)
                                            ? Colors.white
                                            : (!responseSelection[index]!)
                                                ? Colors.white
                                                : Colors.black26
                                        : Colors.black26,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        "${choice.text}",
                                        style: TextStyle(
                                            color: (responseSelection[index] !=
                                                    null)
                                                ? (responseSelection[index]!)
                                                    ? Colors.white
                                                    : (!responseSelection[
                                                            index]!)
                                                        ? Colors.white
                                                        : Colors.black
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            overflow: TextOverflow.fade),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
