import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/pages/quiz_detail/quiz_detail.dart';
import 'package:shimmer/shimmer.dart';
import '../models/quiz.dart';
import '../models/user.dart';
import '../services/quiz_service.dart';
import '../services/user_service.dart';
import '../widgets/buttom_chip.dart';
import '../widgets/quiz_card.dart';
import '../widgets/user_circle_avatar.dart';
import 'comptepublic.dart';

class AccountPublic extends StatefulWidget {
  const AccountPublic({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<AccountPublic> createState() => _AccountPublicState();
}

class _AccountPublicState extends State<AccountPublic> {
  late int selectedIndex; // Ajout de cette variable pour suivre l'onglet sélectionné
  late String defaultCategory;
  UserService userService = UserService();
  QuizService quizService = QuizService();
  late Future<List<User>?> futureUsers;
  late Future<List<Quiz>?> futureQuizzes;
  late Future<List<Quiz>?> futureQuizzesByCategory;
  int nbFollowed = 0; // Le nombre de personne que l'utilisateur suit
  int nbFollowers = 0; // Le nombre de personnes qui suivent l'utilisateur
  int nbQuizzes = 0;
  bool isSubscribed = false;

  bool isUserInList(List<User> value, User userFind) {
    // Vérifier si l'id de currentUser correspond à l'un des id dans la liste value
    return value.any((user) => user.userId == userFind.userId);
  }


  @override
  void initState() {
    super.initState();
    selectedIndex = 0; // Définir l'onglet sélectionné par defaut
    defaultCategory = kCategories[0];
    futureUsers = userService.getFollowings(widget.user.userId!);

    futureUsers.then((value) {
     setState(() {
       nbFollowed = value!.length;
     });
    });

    futureQuizzesByCategory = quizService.getQuizzesByUserAndDomain(widget.user.userId!, defaultCategory);

    futureQuizzes = quizService.getQuizzesByUser(widget.user.userId!);
    futureQuizzes.then((value) {
      setState(() {
        nbQuizzes = value!.length;
      });
    });

    // Vérification si l'utilisateur courant est abonnée ou non à ce utilisateur
    userService.getFollowings(currentUser.userId!).then((value) {
      if(isUserInList(value, widget.user)){
        setState(() {
          isSubscribed = true;
        });
      }
      else{
        setState(() {
          isSubscribed = false;
        });
      }
    }).catchError((onError){
      print(onError);
    });

    userService.getFollowers(widget.user.userId!).then((value) {
      setState(() {
        nbFollowers = value.length;
      });
    }).catchError((onError){
      print(onError);
    });
  }

  void followUser() {
    userService.followAnUser(
        1, widget.user.userId!).then((value) {
      if(value == "OK"){
        print("Abonnement reussi");
        setState(() {
          nbFollowers++;
        });
      }
      else{
        print("Erreur d'abonnement");
      }
    }).catchError((onError){
      print(onError);
    });
  }

  void unFollowUser() {
    userService.unFollowAnUser(1, widget.user.userId!).then((value) {
      if(value == "OK"){
        print("Désabonnement reussi");
        setState(() {
          nbFollowers--;
        });
      }
      else{
        print("Erreur de desabonnement");
      }
    }).catchError((onError){
      print(onError);
    });
  }

  void subscribeOrUnsubscribe() {
    if(!isSubscribed){
      setState(() {
        isSubscribed = true;
        followUser();
      });
    }
    else{
      setState(() {
        isSubscribed = false;
        unFollowUser();
      });
    }
  }

  void onItemTapped(int index) {
    setState(() {
      futureQuizzesByCategory = quizService.getQuizzesByUserAndDomain(widget.user.userId!, kCategories[index]);
      defaultCategory = kCategories[index];
      selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text("${widget.user.login}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataRow(user: widget.user, nQuiz: nbQuizzes, nbFollowers: nbFollowers, onSubscribe: subscribeOrUnsubscribe, isSubscribed: isSubscribed),
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
                    // Titre "Les plus populaires"
                    (nbFollowed>0)?const SliverToBoxAdapter(
                      child: Text(
                        'Les followeds',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ):SliverToBoxAdapter(),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    // Liste horizontale de QuizCards pour les plus populaires
                    (nbFollowed>0)?SliverToBoxAdapter(
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
                                    press: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPublic(user: snapshot.data![index],)));
                                    },
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
                    ):SliverToBoxAdapter(),
                    // Le titre. Ex: "Quiz sur les Animés"
                    SliverToBoxAdapter(
                      child: Text(
                        'Quiz sur les ${defaultCategory.toCapitalize()+"s"}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Liste verticale de QuizCards pour les quiz sur les Animés
                    FutureBuilder(
                      future: futureQuizzesByCategory,
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
                                press: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizDetail(
                                    quiz: snapshot.data![index],
                                    previewWidget: AccountPublic(user: widget.user)
                                    ,)));
                                },
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
                )),
          ],
        ),
      ),
    );
  }
}

/*class quizImageCard extends StatelessWidget {
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
}*/

class DataRow extends StatefulWidget {
  const DataRow({
    Key? key, required this.nQuiz, required this.nbFollowers, required this.user, required this.onSubscribe, this.isSubscribed=false}) : super(key: key);

  final int nQuiz;
  final int nbFollowers;
  final User user;
  final bool isSubscribed;
  final void Function() onSubscribe;

  @override
  _DataRowState createState() => _DataRowState();
}

class _DataRowState extends State<DataRow> {

  @override
  void initState() {
    super.initState();
    //nbPlayers = widget.nbFollowers;
  }

  /*void toggleSubscription() {
    setState(() {
      isSubscribed = !isSubscribed;
      // Ajoutez ici votre logique pour l'abonnement/désabonnement
      if (isSubscribed) {
        // Si l'utilisateur s'abonne, incrémentez le nombre de joueurs de 1
        nbPlayers++;
      } else {
        // Si l'utilisateur se désabonne, décrémentez le nombre de joueurs de 1
        nbPlayers--;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileSection( user: widget.user),
            // Row(
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.nQuiz}',
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
                    '${widget.nbFollowers}',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Suivie',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width*0.25, 40)),
                backgroundColor: MaterialStateProperty.all<Color>((widget.isSubscribed)?Colors.red.withOpacity(0.9):kAppBarColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () => widget.onSubscribe(),
              child: Text(widget.isSubscribed ? 'Arrêter' : 'Suivre', style: const TextStyle(fontSize: 18)),
            )
          ],
        ),

      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage:
        NetworkImage('${kBaseUrlForImage}user/${user.imageUrl!}'),
      ),
    );
  }
}

/*class Tapbar extends StatefulWidget {
  @override
  _TapbarState createState() => _TapbarState();
}*/

/*class _TapbarState extends State<Tapbar> {
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

  late int selectedIndex; // Ajout de cette variable pour suivre l'onglet sélectionné
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
          Expanded(
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
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPublic(user: snapshot.data![index],)));
                            },
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
                  })
          ),


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
}*/
