
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';

class QuestionChoose extends StatefulWidget {
  const QuestionChoose({super.key});

  @override
  State<QuestionChoose> createState() => _QuestionChooseState();
}


class _QuestionChooseState extends State<QuestionChoose> {

    int _time = 5;
    // final _numQues =  [1, 2, 3, 4, 5];
     final _results = [5,10,30,-8,20];
     late Timer timere;
     late Future<List<Quiz>?> futureQuizzes;
     late Future<List<User>?> futureUsers;

    void startTimer(){
      timere = Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {

      if(_time>0){
        _time--;
      }else{
        timere.cancel();
      }
      });
      });
    }

    @override
  void initState() {
   startTimer();
    super.initState();
    
  }
    @override
  void dispose() {
    timere.cancel();
    super.dispose();
  }
   

 

  @override
  Widget build(BuildContext context) {
      Color myColor = const Color(0xFF3F489C);

    return Scaffold(
      backgroundColor: (myColor),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(  
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Padding(padding: EdgeInsets.all(2.0),),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                  // top: 20,
                  child: Text( 
                  '$_time', style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                    ),
                   ) ,
                  ),   
                Positioned(
                  child: 
                  Image.asset('assets/image/rond.png'),
                )              
                ],
              ),
               
            //  
              
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            // margin: const EdgeInsets.only(right:10),
            padding:const EdgeInsets.only(left: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    
                   SizedBox(
                  height: 15,
                ), 
                
                
                 Text("Question " + "1" + "/" + "5", style: TextStyle(fontWeight: FontWeight.bold,
                 
                color: Colors.white , fontSize: 20,),),
                SizedBox(
                  height: 10,
                ),
              ],
              
            ), 
          ),
          Column(
            children: [
             const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.fromLTRB(10,0,10,0),),
             
             Container(
              margin: EdgeInsets.all(20),
              child: 

              const Text('Quelle est somme de A + B = ?, A ayant 3 et b 17', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,
                 color: Colors.white),),
             ),
                const SizedBox(height: 30,),
                Wrap(
                  children: [

              for (int i = 1; i <= 5; i++)
                // question 1
                GestureDetector(
                   
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  
                  ),
                    height: 35,
                    width: 300,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#"+ "$i", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                      Expanded(child: Center(
                        child: 
                    Text(_results[0].toString(), style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
                  ),
                ),
                // SizedBox(height: 20),
                
              //  fin question 1
                
                  ],
                ),
               
              
              
              
            ],
          )
        ],
        
      ),
      
    );
  }
}