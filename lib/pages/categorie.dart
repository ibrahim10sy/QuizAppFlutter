import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  final List<String> categories = [
    "anime",
    "science",
    "histoire",
    "informatique",
    "culture générale",
    "géographie",
    "mécanique",
    "Art",
    "Droit",
  ];

  Map<String, bool> categorySelection = {};

  void initState() {
    super.initState();
    // Initialiser l'état de chaque catégorie à false
    for (String category in categories) {
      categorySelection[category] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF383694),
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Recherche tes catégories",
          style: TextStyle(
            color: const Color(0xFF2195F3),
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF383694),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 315,
              height: 49,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1A5E),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: const Color(0xFF383694),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: const Color(0xFF595151),
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Rechercher",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 15),
            Center(
              child: Column(
                children: [
                  Text(
                    "Quelles sont vos catégories préférées ?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(categories[0]),
                      _buildCategoryButton(categories[1]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(categories[2]),
                      _buildCategoryButton(categories[3]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(categories[4]),
                      _buildCategoryButton(categories[5]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(categories[6]),
                      _buildCategoryButton(categories[7]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(categories[8]),
                    ],
                  ),
                ],
              ),
            ),
              customButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Vérifiez si la valeur n'est pas nulle avant de l'utiliser comme condition
          if (categorySelection[category] != null) {
            // Inversez l'état de la catégorie lors du clic
            categorySelection[category] = !categorySelection[category]!;
          }
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          categorySelection[category] == true ? Colors.green : const Color(0xFF37B1C9),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 6.0,
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),



      
    );

   
  }


Widget customButton(BuildContext context) {
  // SizedBox(height:40);

  return Container( 
    margin: EdgeInsets.only(top: 40),
    width: 300.0,
    height: 49.0,
    decoration: BoxDecoration(

      color: const Color(0xFF1C1A5E), // Couleur de fond du bouton
      borderRadius: BorderRadius.circular(13.0), // Border radius
      border: Border.all(
        color: const Color(0xFF383694), // Couleur de la bordure
        width: 1.0, // Épaisseur de la bordure
      ),
    ),
    
    child: ElevatedButton(
      onPressed: () {
        // Action à effectuer lorsque le bouton est cliqué
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent, // Couleur de fond transparente
        elevation: 0, // Pas d'ombre
        padding: EdgeInsets.all(0), // Espacement interne du bouton
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 5.0), // Espacement entre l'icône et le texte
          Text(
            "Commencer",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward, // Utilisation de l'icône Flutter
            color: Colors.white, // Couleur de l'icône
          ),
          
        ],
      ),
    ),
  );
}
}





