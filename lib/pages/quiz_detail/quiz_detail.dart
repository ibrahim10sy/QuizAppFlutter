import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/pages/quiz_detail/body.dart';

import '../../models/quiz.dart';
import '../play_quiz/PlayQuiz.dart';

class QuizDetail extends StatelessWidget {
  const QuizDetail({super.key, required this.quiz, this.routeToPreviewPage, this.previewWidget});
  final Quiz quiz;
  final String? routeToPreviewPage;
  final Widget? previewWidget;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          (routeToPreviewPage==null)?Navigator.push(context, MaterialPageRoute(builder: (context)=>previewWidget!)):Navigator.pushNamed(context, routeToPreviewPage!);
        },),
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayQuiz(quiz: quiz)));
        },
        tooltip: 'Jouer',
        child: const Icon(Icons.play_arrow, color: Colors.white, size: 40,),
      ),
    );
  }
}
