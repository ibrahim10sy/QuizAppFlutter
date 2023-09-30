

 import 'package:flutter/material.dart';

class BeforeStartQuiz extends StatefulWidget {
  const BeforeStartQuiz({super.key});

  @override
  State<BeforeStartQuiz> createState() => _BeforeStartQuizState();
}

class _BeforeStartQuizState extends State<BeforeStartQuiz> {
  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF3F489C);
    return Scaffold(
      backgroundColor:(myColor) ,
      body:  
       Center(
        
        child:  Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
            
             const SizedBox(height: 40),
             const Text('QUIZMASTER', style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, 
                fontFamily: "poppins", fontSize: 40),),
        const SizedBox(height: 60,),
        const Text('Start Quiz', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, 
          fontFamily: "poppins", fontSize: 20,),),
        const SizedBox(height: 60,),
            Image.asset(
              'assets/image/logo.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              
              child: Text('Commencer', textAlign: TextAlign.center, style: TextStyle(fontSize:20 , fontWeight:  FontWeight.bold),),
              onPressed: () {},
              style:  ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                 minimumSize: const Size(60, 45),
              ),
              ), 
              // ),
          ],

          ),
      ),
    );
  }
}