
  import 'package:flutter/material.dart';

class QuestionChoose extends StatefulWidget {
  const QuestionChoose({super.key});

  @override
  State<QuestionChoose> createState() => _QuestionChooseState();
}

class _QuestionChooseState extends State<QuestionChoose> {
  @override
  Widget build(BuildContext context) {
      Color myColor = const Color(0xFF3F489C);

    return Scaffold(
      backgroundColor: (myColor),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               const SizedBox(
                height: 30,
                
              ),
              // Padding(padding: EdgeInsets.all(2.0),),
             
              Image.asset('assets/image/rond.png'),
            ],
          ),
        ],
      ),
    );
  }
}