import 'package:flutter/material.dart';

void main() {
  runApp(Comptepublic());
}

class Comptepublic extends StatelessWidget {
  const Comptepublic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'compte_public',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NomSection
              NomSection(),

              // RowSection
              RowSection(),

              // ProfilSection et texte "10 100 Quiz Joueurs"
              Row(
                children: [
                  // ProfilSection
                  ProfilSection(),

                  // Espacement
                  SizedBox(width: 100),

                  // Texte "10 100 Quiz Joueurs"
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10      100',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Quiz   Joueurs',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),

              // HorizontalList
              HorizontalList(),


              // QuizSection
             
            ],
          ),
        ),
      ),
    );
  }
}

class NomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Diallo',
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class RowSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 1.0,
    );
  }
}

class ProfilSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20, left: 40),
      child: CircleAvatar(
        radius: 50.0,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.account_circle_rounded,
          size: 80,
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return DefaultTabController( // Ajoutez ce widget
      length: 4, // Spécifiez le nombre d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: Text('Liste horizontale'),
          bottom: TabBar( // Ajoutez ce widget
            tabs: [
              // Spécifiez les onglets avec des icônes et/ou du texte
              Tab(icon: Icon(Icons.movie), text: 'Animé'),
              Tab(icon: Icon(Icons.palette), text: 'Art'),
              Tab(icon: Icon(Icons.history), text: 'Histoire'),
              Tab(icon: Icon(Icons.computer), text: 'Informatique'),
            ],
          ),
        ),
        body: TabBarView( // Ajoutez ce widget
          children: [
            // Spécifiez les widgets à afficher pour chaque onglet
            Icon(Icons.movie, size: 350),
            Icon(Icons.palette, size: 350),
            Icon(Icons.history, size: 350),
            Icon(Icons.computer, size: 350),
          ],
        ),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0), // Ajouter un padding pour faire descendre la liste
      height: 40.0, // Augmenter la hauteur pour donner plus d'espace à la liste
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Premier élément
          Container(
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.white, // Arrière-plan en blanc
              borderRadius: BorderRadius.circular(25), // Bordure arrondie
              border: Border.all( // Ajouter une bordure
                color: Colors.blue, // Couleur de la bordure en bleu
                width: 2.0, // Largeur de la bordure
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Animé',
                style: TextStyle(
                  color: const Color.fromARGB(197, 33, 149, 243), // Texte en bleu
                  fontWeight: FontWeight.bold, // Texte en gras
                ),
              ),
            ),
          ),

          // Ajoutez un SizedBox avec un espace horizontal
          SizedBox(width: 10.0),

          // Deuxième élément
          Container(
            width: 99.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(63, 72, 156, 0.8),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Art',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Ajoutez un SizedBox avec un espace horizontal
          SizedBox(width: 10.0),

          // Troisième élément
          Container(
            width: 99.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(63, 72, 156, 0.8),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Histoire',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Ajoutez un SizedBox avec un espace horizontal
          SizedBox(width: 10.0),

          // Quatrième élément
          Container(
            width: 99.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(63, 72, 156, 0.8),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Informatique',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Vous pouvez ajouter plus d'éléments ici en suivant le même modèle
        ],
      ),
    );
  }





// class RowSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // Vous pouvez ajouter d'autres widgets ici
//     );
//   }
// }
