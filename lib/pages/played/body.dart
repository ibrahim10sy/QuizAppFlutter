import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/pages/played/played.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:quiz_app/services/user_service.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';
import 'package:quiz_app/widgets/quiz_card.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/quiz.dart';
import '../../models/user.dart';
import '../quiz_detail/quiz_detail.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndex = 0;
  QuizService quizService = QuizService();

  late Future<List<Quiz>?> futureQuizzes;
  late String defaultCategory;
  late int userId;

  @override
  void initState() {
    defaultCategory = kCategories[0];
    super.initState();
    userId = 1;
    futureQuizzes = quizService.getQuizzesPlayedByUserAndDomain(userId, defaultCategory);
  }

  void onItemTapped(int index) {
    setState(() {
      futureQuizzes = quizService.getQuizzesPlayedByUserAndDomain(userId, kCategories[index]);
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
                        text: kCategories[index].toCapitalize(),
                      )),
                ),
              ),
            ),
            Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
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
                                  ? (snapshot.data!.isNotEmpty)
                                  ? QuizCard(
                                quiz: snapshot.data![index],
                                press: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizDetail(quiz: snapshot.data![index], previewWidget: Played(),)));
                                },
                              )
                                  : Center(
                                child: Text(
                                    "Vous n'avez joué aucun quiz sur ${kCategories[index]}"),
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
                                            "https://i.pinimg.com/564x/7d/59/fe/7d59feb61af3de07172a774e86eea28b.jpg"), questions: []),
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