import 'package:flutter/material.dart';

class Comptepublic extends StatelessWidget {
  Comptepublic({Key? key}) : super(key: key);

  List<String> imagesQuizs = [
    "images/ori1.jpg",
    "images/ori2.jpg",
    "images/ori3.jpg"
  ];
// @override
//   _SubscribeWidgetState createState() => _SubscribeWidgetState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 2,
        title: //Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("DIALLO",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
        // ]),
      ),
   
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RowSection(),
            // ProfilSection(),
            // DataRow(),
            DataRow(
           nQuizs: 50,
              initialNJoueurs: 100,
             ),

             Tapbar(),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: imagesQuizs.length,
                itemBuilder: (context, index) {
                  return quizImageCard(
                    imageUrl: imagesQuizs[index],
                    titre: "Titre",
                    Descriptions: "Description du quiz",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
       
  }
  
}

class quizImageCard extends StatelessWidget {
  quizImageCard(
      {super.key,
      required this.imageUrl,
      required this.titre,
      required this.Descriptions});

  String? imageUrl;
  String titre;
  String Descriptions;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imageUrl ?? "images/ori1.jpg"))),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titre,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Descriptions,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
class DataRow extends StatefulWidget {
  DataRow({Key? key, required this.nQuizs, required this.initialNJoueurs})
      : super(key: key);

  final int nQuizs;
  final int initialNJoueurs;

  @override
  _DataRowState createState() => _DataRowState();
}

class _DataRowState extends State<DataRow> {
  // int nJoueurs;
  int nJoueurs = 100;
  bool isSubscribed = false;

  @override
  void initState() {
    super.initState();
    nJoueurs = widget.initialNJoueurs;
  }

  void toggleSubscription() {
    setState(() {
      isSubscribed = !isSubscribed;
      // Ajoutez ici votre logique pour l'abonnement/désabonnement
      if (isSubscribed) {
        // Si l'utilisateur s'abonne, incrémentez le nombre de joueurs de 1
        nJoueurs++;
      } else {
        // Si l'utilisateur se désabonne, décrémentez le nombre de joueurs de 1
        nJoueurs--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilSection(),
    // Row(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.nQuizs}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Quizs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$nJoueurs',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Joueurs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Color.fromARGB(255, 74, 86, 174); // Couleur du bouton lorsque désactivé
       
        }

        return isSubscribed ? Colors.green : Colors.grey; // Couleur du bouton lorsque activé
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  onPressed: () {
    toggleSubscription();
  },
  child: Text(isSubscribed ? 'Se désabonner' : 'S\'abonner'),
),
      ],
    );
  }
}



class ProfilSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

class Tapbar extends StatefulWidget {
  @override
  _TapbarState createState() => _TapbarState();
}

class _TapbarState extends State<Tapbar> {
  final kAppBarColor = const Color(0xFF3F489C).withOpacity(0.8);
  final kBackgroundColor = Color(0xFFEAEAFF);
  final kTextColor = Colors.black;

  List<String> categories = [
    "anime",
    "science",
    "histoire",
    "informatique",
    "culture general",
    "geographie",
    "mecanique"
  ];

  late int
      selectedIndex; // Ajout de cette variable pour suivre l'onglet sélectionné
  late String defaultCategory;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0; // Définir l'onglet sélectionné par défaut
    defaultCategory = categories[0];
    // Vous pouvez ajouter ici l'initialisation de vos futures (futureUsers, futureQuizzes, etc.).
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Mettre à jour l'onglet sélectionné
      // Vous pouvez également mettre à jour vos futures ici en fonction de l'onglet sélectionné.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => InkWell(
                  onTap: () {
                    onItemTapped(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: selectedIndex == index
                            ? Border.all(color: Colors.blue)
                            : null,
                        color: selectedIndex == index
                            ? Colors.white
                            : kAppBarColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      categories[index].toUpperCase(),
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.blue.shade400
                            : Colors
                                .white, // Couleur du texte différente pour l'onglet sélectionné
                      ),
                    ),

                    /*ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: selectedIndex == index
                            ? kAppBarColor
                            : Colors
                                .white, // Couleur d'arrière-plan différente pour l'onglet sélectionné
                      ),
                      onPressed: () {
                        onItemTapped(index);
                      },
                      child: Text(
                        categories[index].toUpperCase(),
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : kTextColor, // Couleur du texte différente pour l'onglet sélectionné
                        ),
                      ),
                    ),*/
                  ),
                ),
              ),
            ),
          ),
          // Ajoutez ici le contenu en fonction de l'onglet sélectionné
        ],
      ),
    );
  }
}
