import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';




class QuizCard extends StatelessWidget {
  const QuizCard({
    Key? key,
    required this.quiz,
    required this.press,
    this.isSeller=false
  }) : super(key: key);
  final Quiz quiz;
  final Function press;
  final bool isSeller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-quiz-card.jpg"),
            fit: BoxFit.fitHeight,
          ),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        quiz.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quiz.title),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage(quiz.user.imageUrl),
                    ),
                    const SizedBox(width: 10,),
                    Text(quiz.user.name)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}