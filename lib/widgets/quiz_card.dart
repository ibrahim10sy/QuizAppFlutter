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
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-quiz-card.jpg"),
            fit: BoxFit.cover,
          ),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 3,
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
            Flexible(
              flex: 1,
                child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(quiz.user.imageUrl),
                        ),
                        const SizedBox(width: 10,),
                        Text(quiz.user.name, style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}