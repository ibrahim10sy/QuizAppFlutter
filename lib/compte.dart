// // ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/extensions/string_extension.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/modifier.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:quiz_app/widgets/buttom_chip.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Compte(), // Utilisez la classe Compte comme écran d'accueil
//     );
//   }
// }

// class Compte extends StatefulWidget {
//   const Compte({super.key});

//   @override
//   State<Compte> createState() => _CompteState();

// }

// class _CompteState extends State<Compte> {
//   File? _image;
//   String? imageSrc;

//   Future<File> saveImage(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');
//     return File(imagePath).copy(image.path);
//   }

//   Future piquerImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imagePermanente = await saveImage(image.path);
//       setState(() {
//         // ignore: unnecessary_this
//         this._image = imagePermanente;
//         imageSrc = imagePermanente.path;
//       });
//     } on PlatformException catch (e) {
//       print('image introuvable $e');
//     }
//   }

//   void showPopupMenu(BuildContext context) {
//     final RenderBox overlay =
//         Overlay.of(context)!.context.findRenderObject() as RenderBox;
//     final Offset offset = Offset(0.0, overlay.size.height);

//     // Afficher le menu contextuel
//     showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//           offset & const Size(40, 40), Offset.zero & overlay.size),
//       items: <PopupMenuEntry>[
//         const PopupMenuItem(
//           child:  Text('Détail'),
//           value: 'detail',
//         ),
//         const PopupMenuItem(
//           child: Text('Modifier'),
//           value: 'modifier',
//         ),
//         const PopupMenuItem(
//           child: Text('Supprimer'),
//           value: 'supprimer',
//         ),
//       ],
//       elevation: 8.0,
//     ).then<void>((value) {
//       if (value == null) return; // L'utilisateur a annulé le menu
//       // Gérer l'action en fonction de la valeur sélectionnée (détail, modifier ou supprimer)
//       if (value == 'detail') {
//         // Action de détail
//         // Ajoutez votre code ici
//       } else if (value == 'modifier') {
//         // Action de modification
//         // à ajouter le code ici
//       } else if (value == 'supprimer') {
//         // Action de suppression
//         // Ajoutez votre code ici
//       }
//     });
//   }

//   QuizService quizByUser = QuizService();
//   List<Quiz> userQuizzes = [];

//   Future<void> fetchUserQuizzes() async {
//     final userId = 123;
//     final quizzes = await quizByUser.getQuizzesByUser(userId);

//     setState(() {
//       userQuizzes = quizzes;
//     });
//   }

//   // List<String> quizNames = [ ];

//   @override
//   // ignore: dead_code
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 60,
//                     child:
//                         (_image != null) ? Image.file(_image!) : Text('Photo'),
//                   ),
//                   IconButton(
//                     onPressed: piquerImage,
//                     icon: const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                       size: 32,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Colors.blue,
//                           minimumSize: const Size(80, 30),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       child: const Text('Animés'),
//                     ),
//                     const SizedBox(width: 8),
//                     TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Colors.blue,
//                           minimumSize: const Size(80, 30),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       child: const Text('Art'),
//                     ),
//                     const SizedBox(width: 8),
//                     TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                             foregroundColor: Colors.white,
//                             backgroundColor: Colors.blue,
//                             minimumSize: const Size(80, 30),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                         child: const Text('Histoire')),
//                     const SizedBox(width: 8),
//                     TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                             foregroundColor: Colors.white,
//                             backgroundColor: Colors.blue,
//                             minimumSize: const Size(80, 30),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                         child: const Text('Culture')),
//                     const SizedBox(width: 8),
//                     TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                             foregroundColor: Colors.white,
//                             backgroundColor: Colors.blue,
//                             minimumSize: const Size(80, 30),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                         child: const Text('Actualité')),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // Wrap(
//               //   children: [
//               //     SizedBox(
//               //       width: 300,
//               //       height: 300,
//               //       child: QuizCard(
//               //         useBaseUrl: true,
//               //           quiz: Quiz(
//               //               visibility: "visibility",
//               //               description: "description",
//               //               creationDate: "creationDate",
//               //               category: "category",
//               //               quizId: 1,
//               //               title: "title",
//               //               nbQuestion: 3,
//               //               imageUrl: "informatique1.jpg",
//               //               user: User(
//               //                   userId: 1,
//               //                   firstName: "firstName",
//               //                   lastName: "lastName",
//               //                   email: "email",
//               //                   password: "password",
//               //                   login: "login",
//               //                   imageUrl: "informatique1.jpg")),
//               //           press: () {}),
//               //     )
//               //   ],
//               // ),
//               // ListView.builder(
//               //   itemCount: userQuizzes.length,
//               //   itemBuilder: (BuildContext context, int index) {
//               //     final quiz = userQuizzes[index];
//               //     return Container(
//               //       width: 150,
//               //       height: 150,
//               //       decoration: BoxDecoration(
//               //           borderRadius: BorderRadius.circular(10),
//               //           color: Colors.grey),
//               //       child: Column(
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //           Image.network(
//               //             quiz.imageUrl,
//               //             width: 80,
//               //             height: 80,
//               //           ),
//               //           const SizedBox(
//               //             height: 10,
//               //           ),
//               //           Text(
//               //             quiz.title,
//               //             textAlign: TextAlign.center,
//               //             style: const TextStyle(
//               //               fontWeight: FontWeight.bold,
//               //             ),
//               //           )
//               //         ],
//               //       ),
//               //     );
//               //   },
//               // ),

//               ListView.builder(
//                 itemCount: userQuizzes.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final quiz = userQuizzes[index];
//                   Wrap(
//                     spacing: 20,
//                     runSpacing: 20,
//                     children: [
//                       Stack(
//                         children: [
//                           InkWell(
//                             onDoubleTap: () {
//                               showPopupMenu(context);
//                             },
//                             child: Container(
//                               width: 150,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.grey),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             left: 50,
//                             child: Center(
//                               child: TextButton(
//                                 onPressed: () {},
//                                 child: Text(quiz.title),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 },
//               ),

//               // Wrap(spacing: 20, runSpacing: 20, children: [
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   Stack(
//               //     children: [
//               //       InkWell(
//               //         onDoubleTap: () {
//               //           showPopupMenu(context);
//               //         },
//               //         child: Container(
//               //           width: 150,
//               //           height: 150,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Colors.grey),
//               //         ),
//               //       ),
//               //       Positioned(
//               //         bottom: 0,
//               //         left: 50,
//               //         child: Center(
//               //           child: TextButton(
//               //               onPressed: () {},
//               //               child: const Center(child: Text('QUIZ1'))),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ]),

//               const SizedBox(height: 490),
//               Container(
//                 width: 800,
//                 height: 30,
//                 color: Colors.blue,
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Icon(
//                       Icons.home,
//                       color: Colors.white,
//                     ),
//                     Icon(
//                       Icons.add_box,
//                       color: Colors.white,
//                     ),
//                     Icon(
//                       Icons.grid_view_sharp,
//                       color: Colors.white,
//                     ),
//                     Icon(
//                       Icons.account_circle_outlined,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfile> {
  late Future<List<Quiz>?> futureQuizzes;
  late Future<List<User>?> futureUsers;
  late String defaultCategory;
  int selectedIndex = 0;
  File? _image;
  String? imageSrc;
  String? lastname = "dri";
  List<Quiz> userQuizzes = [];
  QuizService quizService = QuizService();

  Future<File> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future piquerImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagePermanente = await saveImage(image.path);
      setState(() {
        // ignore: unnecessary_this
        this._image = imagePermanente;
        imageSrc = imagePermanente.path;
      });
    } on PlatformException catch (e) {
      print('image introuvable $e');
    }
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Offset offset = Offset(0.0, overlay.size.height);

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
          offset & const Size(40, 40), Offset.zero & overlay.size),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: Text('Détail'),
          value: 'detail',
        ),
        PopupMenuItem(
          child: Text('Modifier'),
          value: 'modifier',
        ),
        PopupMenuItem(
          child: Text('Supprimer'),
          value: 'supprimer',
        ),
      ],
      elevation: 8.0,
    ).then<void>((value) {
      if (value == null) return; // L'utilisateur peut annuler le menu
      if (value == 'detail') {
        // Action de détail
      } else if (value == 'modifier') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              // Créez et retournez la page de modification avec les valeurs actuelles
              return EditAttributesPage(
                  // // Passez les attributs à la page de modification
                  // title: "Titre actuel",
                  // nbQuestion: 42, // Remplacez par la valeur actuelle
                  // visibility: "Visibilité actuelle",
                  // description: "Description actuelle",
                  // creationDate: "Date actuelle",
                  // category: "Catégorie actuelle",
                  // imageUrl:
                  //     "URL de l'image actuelle", // Remplacez par l'utilisateur actuel
                  );
            },
          ),
        );
        // Action de modification
      } else if (value == 'supprimer') {
        // Action de suppression
      }
    });
  }

  Future<void> fetchUserQuizzes() async {
    final userId = 1;
    final quizzes = await quizService.getQuizzesByUser(userId);

    setState(() {
      userQuizzes = quizzes;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      futureQuizzes = quizService.getQuizzes(kCategories[index]);
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      child: (_image != null)
                          ? Image.file(_image!)
                          : Image.asset('science.png'),
                    ),
                    IconButton(
                      onPressed: piquerImage,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  lastname ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mes Quiz',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  return Center(
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            showPopupMenu(context);
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 50,
                          child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: const Center(child: Text('QUIZ1'))),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  basename(String imagePath) {}
}
