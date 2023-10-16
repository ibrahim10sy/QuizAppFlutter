import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/quiz_service.dart';

import '../../models/rank.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.quiz});
  final Quiz quiz;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  QuizService quizService = QuizService();
  Map<int, Rank> rankMap = {};
  int nbParticipation = 0;
  int maxScore = 0;
  int nbQuestion = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initRankMap().then((Map<int, Rank> result) {
      setState(() {
        rankMap = result;
        nbParticipation = rankMap.length;
        maxScore = (nbParticipation>0)?int.parse(rankMap[1]!.score):0;
        nbQuestion = widget.quiz.nbQuestion;

        print("Classement : $rankMap");
      });
    });
  }

  Future<Map<int, Rank>> initRankMap() async {
    Map<int, Rank> result = await quizService.getRank(widget.quiz.quizId!);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width*0.9,
                height: MediaQuery.sizeOf(context).height*0.3,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(image: NetworkImage("${kBaseUrlForImage}${widget.quiz.category}/${widget.quiz.imageUrl}"), fit: BoxFit.cover)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            // 2
            Center(child: Text("${widget.quiz.title}-${widget.quiz.quizId}", style: TextStyle(fontSize: 20,),textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,)),
            const SizedBox(height: 10,),
            // 3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${nbParticipation}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text("Participations", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${maxScore}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text("Max Score", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${nbQuestion}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text("Questions", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,)
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
            //4
            const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
            Text("${widget.quiz.description}"),
            const SizedBox(height: 10,),
            // 5
            const Text("Les 3 joueurs au podium", style: TextStyle(fontSize: 18),),
            (rankMap.isNotEmpty)?Expanded(
              child: ListView.builder(
                  itemCount: (rankMap.length>=3)?3:rankMap.length,
                  itemBuilder: (context, index) {
                    final Rank? rank = rankMap[index+1];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage("${kBaseUrlForImage}user/${rank?.user.imageUrl}"),
                      ),
                      //title: Text("# ${index+1}-${rank?.score} point", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      title: Text("# ${index+1}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      subtitle: Text.rich(TextSpan(
                          text: "${rank?.user.login} ", style: const TextStyle(fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(text: "(${rank?.score} point)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kAppBarColor))
                          ]
                      ),
                      ),
                    );
                  }
              ),
            ):Container(),

          ],
        ),
      ),
    );
  }
}
