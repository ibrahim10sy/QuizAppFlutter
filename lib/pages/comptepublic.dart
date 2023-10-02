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
      title: 'Your App Title',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NomSection(),
              RowSection(), // Utilisation de RowSection
              ProfilSection(),
             NombreSection(),
              ListView(),
              QuizSection(),
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
         // Aligner le texte vers la gauche
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
      // Vous pouvez ajuster la hauteur
    );
  }
}


class ProfilSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft, // Aligner vers la gauche
      margin: EdgeInsets.only(top: 30, left: 40), 
      child: CircleAvatar(
        radius: 50.0, // Rayon du cercle
        backgroundColor: Colors.black, // Couleur du cercle
        child: Icon(Icons.account_circle_rounded,size: 80,), // Ajouter un widget Icon comme enfant du widget CircleAvatar
      ),
    );
  }
}

class NombreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: -0, left: 250), 
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end, 
        //// Aligner les éléments vers la droite
        crossAxisAlignment: CrossAxisAlignment.start, // Aligner le contenu en haut
        children: [
          Column( 
            // crossAxisAlignment: CrossAxisAlignment.end,
            // Aligner le texte à droite
            children: [
              Text(
                '10',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Quiz',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(width: 10), // Espacement entre les deux colonnes
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end, // Aligner le texte à droite
            children: [
              Text(
                '100',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Joueurs',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class QuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
