import 'package:flutter/material.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<String> categories;
  int selectedIndex = 0;

  @override
  void initState() {
    categories = ["Animé", "Science", "Histoire", "Informatique", "Culture générale", "Géographie", "Mécanique"];
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Titre "Les plus populaires"
        SliverToBoxAdapter(
          child: Text(
            'Les plus populaires',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Liste horizontale de QuizCards pour les plus populaires
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200, // Ajustez la hauteur en conséquence
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: quizzes.length, // Nombre d'éléments pour les plus populaires
              itemBuilder: (context, index) {
                return QuizCard(
                  quiz: quizzes[index],
                  press: () {},
                );
              },
            ),
          ),
        ),

        // Titre "Quiz sur les Animés"
        SliverToBoxAdapter(
          child: Text(
            'Quiz sur les Animés',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Liste verticale de QuizCards pour les quiz sur les Animés
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cartes par ligne
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.7, // Ajustez l'aspect ratio selon vos besoins
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return QuizCard(
                quiz: quizzes[index],
                press: () {},
              );
            },
            childCount: quizzes.length, // Nombre d'éléments pour les quiz sur les Animés
          ),
        ),
      ],
    );
  }
}
