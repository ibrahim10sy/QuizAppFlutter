import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/played/played.dart';

class Bravo extends StatefulWidget {
  const Bravo({Key? key, scoreFinal, totalQuestions}) : super(key: key);

  @override
  State<Bravo> createState() => _BravoState();
}

class _BravoState extends State<Bravo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF3F489C);
    Color score = const Color(0xFF6C90EF);

    // Calculer le score en pourcentage
    // double scoreEnPourcentage = (widget.scoreFinal / (widget.totalQuestions * 10)) * 100;

    return Scaffold(
      backgroundColor: (myColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.only(left: 350),
              child: const Icon(
                Icons.clear,
                size: 40,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            const Text(
              'BRAVO !',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'VOTRE SCORE',
              style: TextStyle(
                color: (score),
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 60), // Ajoutez une marge à droite du premier texte
                  child: const Text(
                    '40 points',
                    textAlign: TextAlign.start, // Alignez le texte à gauche
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left:
                          120), // Ajoutez une marge à gauche du deuxième texte
                  child: const Text(
                    '100 points',
                    textAlign: TextAlign.end,
                    // Alignez le texte à droite
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/image/win.png',
              height: 200,
              width: 200,
            ),

            const SizedBox(
              height: 120,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nav(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //  minimumSize: const Size(80, 45),
                  fixedSize: const Size(200, 40)),
              child: const Text(
                'Suivant',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
