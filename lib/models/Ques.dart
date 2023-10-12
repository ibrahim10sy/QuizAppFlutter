import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/models/choise.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/bravo.dart';
import 'package:quiz_app/services/question_service.dart';

class QuestionsChooses extends StatefulWidget {
  final int quizId;
  const QuestionsChooses({Key? key, required this.quizId}) : super(key: key);

  @override
  _QuestionsChoosesState createState() => _QuestionsChoosesState();
}

class _QuestionsChoosesState extends State<QuestionsChooses> {
  int _time = 5;
  int score = 0;
  late Timer timer;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
    late Future<List<Question>?> futureQuestions;
  bool showCorrectAnswer = false;
  List<Question> questions = [];
  bool isLoading = true;

  @override
  void initState() {
        futureQuestions = QuestionService.getQuestions(1,1);
    super.initState();
    fetchQuestions();
    startTimer();
  }

  void fetchQuestions() async {
    try {
      final fetchedQuestions = await QuestionService.getQuestions(1, widget.quizId);
      if (fetchedQuestions != null) {
        setState(() {
          questions = fetchedQuestions;
          isLoading = false;
        });
      } else {
        print('Erreur.');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Erreur: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        } else {
          timer.cancel();
          goToNextQuestion();
        }
        if(questions.length > 5) {
        //    AlertDialog(
        //   title: const Text('Alerte Quiz'),
        //   content: const Text('Les reponse ne doivent pas depasser 5 reponse au maximum'),
        //   actions: <Widget>[
            
        //     TextButton(
        //       onPressed: () => Navigator.pop(context, 'OK'),
        //       child: const Text('OK'),
        //     ),

        //   ],
        // );
          goToNextQuestion();


    }
      });
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < (questions.length - 1)) {
        currentQuestionIndex++;
        _time = 5;
        startTimer();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bravo(),
          ),
        );
      }
    });
  }

  void checkAnswer(int answerIndex) {
    if (!showCorrectAnswer) {
      setState(() {
        selectedAnswerIndex = answerIndex;
        if (answerIndex == questions[currentQuestionIndex].rankResponse) {
          showCorrectAnswer = true;
          calculateScore(answerIndex);
        } else {
          showCorrectAnswer = true;
          if (_time == 0) {
            showCorrectAnswer = true;
          }
          startTimer();
        }
      });
    }
  }

  void calculateScore(int answerIndex) {
    if (answerIndex == questions[currentQuestionIndex].rankResponse) {
      score += 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Question currentQuestion = questions[currentQuestionIndex];

      return Scaffold(
        backgroundColor: const Color(0xFF3F489C),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Your score: $score points',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Text(
                        '$_time',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Image.asset('assets/image/rond.png'),
                    ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Question ${currentQuestionIndex + 1}/${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                Container(
                  
                margin: const EdgeInsets.all(20),
                child: Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
             Wrap(
  children: [
    for (int i = 0; i < currentQuestion.choises.length; i++)
      GestureDetector(
        onTap: () {
          checkAnswer(i);
        },
        child: FutureBuilder<List<Question>?>(
          future: futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Question currentQuestion = snapshot.data![currentQuestionIndex];
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: (showCorrectAnswer && i == currentQuestion.rankResponse && currentQuestion.rankResponse==1) || (_time == 0 && i == currentQuestion.rankResponse)
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Text(
                        '#${i + 1}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            currentQuestion.choises[i].text.toCapitalize(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
  ],
)

            ],
          ),
        ],
      ),
    );
  }
}
}