import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
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
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
          SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
                  (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child:  ButtonChip(
                    isBorder: selectedIndex != index,
                    selectedBackground: kAppBarColor,
                    isSelected: selectedIndex == index,
                    press: (){onItemTapped(index);},
                    text: categories[index],
                  )
              ),
            ),
          ),
        ),


            Expanded(
                child: CustomScrollView(
                  slivers: [

                    // Titre "Les plus populaires"
                    const SliverToBoxAdapter(
                      child: Text(
                        'Les plus populaires',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(
                      child: SizedBox(height: 10,),
                    ),


                    // Liste horizontale de QuizCards pour les plus populaires
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100, // Ajustez la hauteur en conséquence
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: quizzes.length, // Nombre d'éléments pour les plus populaires
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(quizzes[index].user.imageUrl),
                                  ),
                                  Text(quizzes[index].user.name, style: const TextStyle(fontSize: 12),),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Titre "Quiz sur les Animés"
                    const SliverToBoxAdapter(
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
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 cartes par ligne
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1, // Ajustez l'aspect ratio selon vos besoins
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
                )
            )
          ],
        )
    );
  }
}

/*
ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: quizzes.length, // Nombre d'éléments pour les plus populaires
                  itemBuilder: (context, index) {
                    return ButtonChip(
                        press: (){},
                        pressHover: (val){},
                        text: categories[index],
                    );
                  },
                )
 */