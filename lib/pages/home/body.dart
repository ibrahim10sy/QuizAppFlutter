import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:quiz_app/services/user_service.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';
import 'package:quiz_app/widgets/quiz_card.dart';
import '../../models/quiz.dart';
import '../../models/user.dart';
import '../../widgets/user_circle_avatar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<String> categories;
  int selectedIndex = 0;
  QuizService quizService = QuizService();
  UserService userService = UserService();

  late Future<List<Quiz>?> futureQuizzes;
  late Future<List<User>?> futureUsers;
  late String defaultCategory;

  @override
  void initState() {
    defaultCategory = kCategories[0];
    categories = ["Animé", "Science", "Histoire", "Informatique", "Culture générale", "Géographie", "Mécanique"];
    super.initState();

    futureUsers = userService.getUsers();
    futureQuizzes = quizService.getQuizzes(defaultCategory);
  }

  void onItemTapped(int index) {
    setState(() {
      futureQuizzes = quizService.getQuizzes(categories[index]);
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
              kCategories.length,
                  (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child:  ButtonChip(
                    isBorder: selectedIndex != index,
                    selectedBackground: kAppBarColor,
                    isSelected: selectedIndex == index,
                    press: (){onItemTapped(index);},
                    text: categories[index].toCapitalize(),
                  )
              ),
            ),
          ),
        ),


            Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[

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
                      child: FutureBuilder(
                          future: futureUsers,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 100, // Ajustez la hauteur en conséquence
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.length, // Nombre d'éléments pour les plus populaires
                                  itemBuilder: (context, index) {
                                    return UserCircleAvatar(
                                      imageUrl: snapshot.data![index].imageUrl,
                                      title: snapshot.data![index].login,
                                      press: () {  },
                                    );
                                  },
                                ),
                              );
                            }
                            else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
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
                   FutureBuilder(
                      future: futureQuizzes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 cartes par ligne
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1, // Ajustez l'aspect ratio selon vos besoins
                            ),
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return QuizCard(
                                  quiz: snapshot.data![index],
                                  press: () {},
                                );
                              },
                              childCount: snapshot.data!.length, // Nombre d'éléments pour les quiz sur les Animés
                            ),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
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
FutureBuilder(
                        future: futureUsers,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 100, // Ajustez la hauteur en conséquence
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length, // Nombre d'éléments pour les plus populaires
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(snapshot.data![index].imageUrl),
                                        ),
                                        Text(snapshot.data![index].login, style: const TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          else{
                            return const SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        }
                    ),
 */