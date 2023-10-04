import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:quiz_app/services/user_service.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';
import 'package:quiz_app/widgets/quiz_card.dart';
import 'package:shimmer/shimmer.dart';
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
    categories = [
      "Animé",
      "Science",
      "Histoire",
      "Informatique",
      "Culture générale",
      "Géographie",
      "Mécanique"
    ];
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
                      child: ButtonChip(
                        isBorder: selectedIndex != index,
                        selectedBackground: kAppBarColor,
                        isSelected: selectedIndex == index,
                        press: () {
                          onItemTapped(index);
                        },
                        text: categories[index].toCapitalize(),
                      )),
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
                  child: SizedBox(
                    height: 10,
                  ),
                ),

                // Liste horizontale de QuizCards pour les plus populaires
                SliverToBoxAdapter(
                  child: FutureBuilder(
                      future: futureUsers,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 100, // Ajustez la hauteur en conséquence
                          child: ListView.builder(
                            physics: (!snapshot.hasData)?const NeverScrollableScrollPhysics():const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: (snapshot.hasData)
                                ? snapshot.data?.length
                                : 10, // Nombre d'éléments pour les plus populaires
                            itemBuilder: (context, index) {
                              return (snapshot.hasData)?UserCircleAvatar(
                                imageUrl: snapshot.data![index].imageUrl,
                                    title: snapshot.data![index].login,
                                press: () {},
                              ):
                              Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.25),
                                highlightColor: Colors.white.withOpacity(0.6),
                                enabled: true,
                                child: UserCircleAvatar(
                                  imageUrl: "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg",
                                  title: "",
                                  useBaseUrl: false,
                                  press: () {},
                                ),
                              );
                            },
                          ),
                        );
                      }),
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
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 cartes par ligne
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio:
                            1, // Ajustez l'aspect ratio selon vos besoins
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount:
                            (snapshot.hasData) ? snapshot.data!.length : 10,
                        (BuildContext context, int index) {
                          return (snapshot.hasData)
                              ? QuizCard(
                            quiz: snapshot.data![index],
                            press: () {},
                          )
                              : Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.25),
                            highlightColor: Colors.white.withOpacity(0.6),
                            enabled: true,
                                child: QuizCard(
                                    useBaseUrl: false,
                                    quiz: Quiz(
                                        visibility: "public",
                                        description: "description",
                                        creationDate: "creationDate",
                                        category: "anime",
                                        quizId: 0,
                                        title: "title",
                                        nbQuestion: 0,
                                        imageUrl:
                                            "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg",
                                        user: User(
                                            userId: 0,
                                            firstName: "firstName",
                                            lastName: "lastName",
                                            email: "email",
                                            password: "password",
                                            login: "login",
                                            imageUrl:
                                                "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg")),
                                    press: () {}),
                              );
                        },
                      ),
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}


/*
QuizCard(
                                  useBaseUrl: false,
                                  quiz: Quiz(
                                      visibility: "public",
                                      description: "description",
                                      creationDate: "creationDate",
                                      category: "anime",
                                      quizId: 0,
                                      title: "title",
                                      nbQuestion: 0,
                                      imageUrl:
                                          "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg",
                                      user: User(
                                          userId: 0,
                                          firstName: "firstName",
                                          lastName: "lastName",
                                          email: "email",
                                          password: "password",
                                          login: "login",
                                          imageUrl:
                                              "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg")),
                                  press: () {})
 */