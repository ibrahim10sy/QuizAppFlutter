import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/pages/quiz_detail/body.dart';

import '../../models/quiz.dart';
import '../test.dart';

class QuizDetail extends StatelessWidget {
  const QuizDetail({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: SizedBox(
            width: 200,
            child: ListTile(
              horizontalTitleGap: 5,
              leading: CircleAvatar(backgroundImage: NetworkImage("$kBaseUrlForImage${quiz.category}/${quiz.imageUrl}"), radius: 20,),
              title: Text("${quiz.user.login}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), overflow: TextOverflow.ellipsis, maxLines: 1,),
            ),
          ),
        ),
      ),
      body: Body(quiz: quiz,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAppBarColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionsChoose()));
        },
        tooltip: 'Jouer',
        child: const Icon(Icons.play_arrow, color: Colors.white, size: 40,),
      ),
    );
  }
}
