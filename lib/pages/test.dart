import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/pages/bravo.dart';
import 'package:quiz_app/pages/lost.dart';

class QuestionsChoose extends StatefulWidget {

  int scoreFinal = 0;
  int totalQuestions = 0;
   QuestionsChoose({super.key, scoreFinal , totalQuestions});

  @override
  State<QuestionsChoose> createState() => _QuestionsChooseState();
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;


  Question(this.questionText, this.options, this.correctAnswerIndex);
}

class _QuestionsChooseState extends State<QuestionsChoose> {

  

  // var sequenceAnimation =  SequenceAnimationBuilder()
  //     .addA nimatable(
  //         animatable:  ColorTween(begin: Colors.red, end: Colors.yellow),
  //         from:  const Duration(seconds: 0),
  //         to: const Duration(seconds: 2),
  //         tag: "color"
  //       ).addAnimatable(
  //         animatable:  ColorTween(begin: Colors.yellow, end: Colors.blueAccent),
  //         from:  const Duration(seconds: 2),
  //         to: const Duration(seconds: 4),
  //         tag: "color",
  //         curve: Curves.easeOut
  //       ).addAnimatable(
  //         animatable: new ColorTween(begin: Colors.blueAccent, end: Colors.pink),
  //         //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
  //         from:  const Duration(seconds: 5),
  //         to: const Duration(seconds: 6),
  //         tag: "color",
  //         curve: Curves.fastOutSlowIn
  //       ).animate(controller);
   

  int _time = 5;
  int score = 0;
  late Timer timer;
  final List<Question> questions = [
    Question("Question 1: Quelle est la capitale de la France ?", ["Paris", "Londres", "Berlin", "Madrid", "Wanshington"], 0),
    Question("Question 2: Combien de planètes dans notre système solaire ?", ["7", "8", "9", "10", "12"], 2),
    Question("Question 3: Quelle est la capitale des USA ?", ["Paris", "Londres", "Berlin", "Madrid", "Wanshington"], 4),
    Question("Question 4: Combien de planètes dans notre système solaire ?", ["7", "8", "9", "10", "12"], 1),
    
  ];
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool showCorrectAnswer = false;

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

  void calculateScore(int answerIndex) {
  int totalScore = 0;
  for (int i = 0; i <= currentQuestionIndex; i++) {
    // if (i == questions[i].correctAnswerIndex) {
     if(i == currentQuestionIndex && answerIndex == questions[i].correctAnswerIndex){
      totalScore += 10; // Points appropriés pour la réponse correcte
    }
    //  if(i != currentQuestionIndex && answerIndex == questions[i].correctAnswerIndex){
    //      totalScore += 10;
    // }
  }
  setState(() {
    score = totalScore;
  });
}



   
     void checkAnswer(int answerIndex) {
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
}


  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        // Passer à la question suivante
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        showCorrectAnswer = false;
        _time = 5; // Réinitialiser le timer

        startTimer();
      } 
        else if(currentQuestionIndex == questions.length - 1 && score==0 ) {
         

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Lost(),
        ),
      );
          }  // Fin du quiz
       else  {
      // Vous pouvez ajouter ici une logique pour afficher le score final ou passer à une autre page.
      // Vérifiez d'abord si le jeu est terminé
        calculateScore(selectedAnswerIndex); // Calculez le score à la fin du quiz
      // Naviguer vers la page Bravo avec le score final
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Lost(),
        ),
      );
    } 
    
    });
  }



  

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF3F489C);

    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: myColor,
      body: Column(
        children: [
          Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Votre score : $score points',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).animate()
  .fadeIn() // uses `Animate.defaultDuration`
  .scale() // inherits duration from fadeIn
  .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration
    ),
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
                      style: const TextStyle(
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
              ).animate()
  .fadeIn() // uses `Animate.defaultDuration`
  .scale() // inherits duration from fadeIn
  .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration

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
                  "Question ${currentQuestionIndex + 1}/${questions.length}",
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
                  currentQuestion.questionText,
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
                  for (int i = 0; i < currentQuestion.options.length; i++)
                    GestureDetector(
                      onTap: () {
                        checkAnswer(i);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: (showCorrectAnswer && i == currentQuestion.correctAnswerIndex ||  _time==0 && i == currentQuestion.correctAnswerIndex) 
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
                              "#${i+1}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  currentQuestion.options[i],
                                  style:const TextStyle(
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
