import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';

import '../models/user.dart';
import '../services/user_service.dart';
import '../widgets/buttom_chip.dart';
import '../widgets/user_circle_avatar.dart';

class ComptePublic extends StatelessWidget {
  ComptePublic({Key? key, required this.user}) : super(key: key);
  final User user;

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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: //Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("${user.login}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
              user: user,
              nQuizs: 50,
              initialNJoueurs: 4,
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
                            //image: NetworkImage('${kBaseUrlForImage}user/${imageUrl!}' ?? "images/ori1.jpg"))),
                            image:
                                AssetImage(imageUrl ?? "images/ori1.jpg"))))),
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
  DataRow(
      {Key? key,
      required this.nQuizs,
      required this.initialNJoueurs,
      required this.user})
      : super(key: key);

  final int nQuizs;
  final int initialNJoueurs;
  final User user;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilSection( user: widget.user),
            // Row(
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.nQuizs}',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Quizs',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Joueurs',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width*0.3, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(kAppBarColor),
                /*backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const Color.fromARGB(
                        255, 74, 86, 174); // Couleur du bouton lorsque désactivé
                  }

                  return isSubscribed
                      ? Colors.green
                      : Colors.grey; // Couleur du bouton lorsque activé
                },
              ),*/
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                toggleSubscription();
              },
              child: Text(isSubscribed ? 'Ne plus suivre' : 'Suivre', style: const TextStyle(fontSize: 18)),
            )
          ],
        ),

      ],
    );
  }
}

class ProfilSection extends StatelessWidget {
  const ProfilSection({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage:
            NetworkImage('${kBaseUrlForImage}user/${user.imageUrl!}'),
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

  UserService userService = UserService();
  late Future<List<User>?> futureUsers;

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
    defaultCategory = kCategories[0];

    //futureUsers = userService.getFollowings();
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

          //  La liste de personnes que l'utilisateur follow


          /*SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                kCategories.length,
                (index) => InkWell(
                  onTap: () {
                    onItemTapped(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: selectedIndex == index
                            ? Border.all(color: Colors.blue)
                            : null,
                        color: selectedIndex == index
                            ? Colors.white
                            : kAppBarColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      kCategories[index].toUpperCase(),
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
          ),*/
          // Ajoutez ici le contenu en fonction de l'onglet sélectionné
        ],
      ),
    );
  }
}
