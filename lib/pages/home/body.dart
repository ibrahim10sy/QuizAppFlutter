import 'package:flutter/material.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<String> categories;
  int selectedIndex = 0;

  @override
  void initState() {
    categories = ["Animé", "Science", "Histoire", "Informatique", "Culture géneral", "Geographie", "Mécanique"];
    super.initState();
  }
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                categories.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: ButtonChip(
                        press: () { onItemTapped(index); },
                        text: categories[index],
                        pressHover: (val) {},
                        isSelected: selectedIndex == index,
                      ),
                )
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.55,
              ),
              itemCount: quizzes.length,
              itemBuilder: (context, index){
                final item = quizzes[index];
                return QuizCard(
                  quiz: item,
                  press: () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

