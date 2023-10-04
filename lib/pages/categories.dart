import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/pages/quiz_detail.dart';

class Categorie extends StatelessWidget {
  
  final List<Category> categories = [
    Category(id: 1, nom: "Animaux", imageUrl:'images/animal.png'),
    Category(id: 2, nom: "Music", imageUrl:'images/casque.png'),
    Category(id: 3, nom: "Maths", imageUrl:'images/maths.png'),
    Category(id: 4, nom: "Jeux", imageUrl:'images/jeux.png'),
    Category(id: 5, nom: "Espace", imageUrl:'images/espace.png'),
    Category(id: 6, nom: "Sport", imageUrl:'images/sport.png'),
    Category(id: 7, nom: "Hacking", imageUrl:'images/haching.png'),
    Category(id: 8, nom: "Informatique", imageUrl:'images/java.png'),
  ];

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF1C1A5E);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choisir une catégorie'),
      ),
      backgroundColor: myColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuizDetail(categorie: category.nom),
                        ),
                      );
                    },
                    child: Container(
                      // width: MediaQuery.of(context).size.width / 2 - 10,
                      width:180,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            category.imageUrl,
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            category.nom,
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 82, 82),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
