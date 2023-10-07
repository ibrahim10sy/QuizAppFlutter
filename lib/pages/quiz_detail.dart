import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/pages/home/home.dart';
import 'package:quiz_app/pages/question.dart';
import 'package:quiz_app/services/quiz_service.dart';

/**************Home***************************** */
class QuizDetail extends StatefulWidget {
  static String routeName = "/quiz_detail";
  String categorie = "";

  QuizDetail({super.key, required this.categorie});

  @override
  State<QuizDetail> createState() => _QuizDetailState();
}

class _QuizDetailState extends State<QuizDetail> {
  File? image;
  String? imageSrc; // Variable pour stocker le chemin de notre l'image upload

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Fonction pour créer un bouton
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton.icon(
      onPressed: onClicked,
      icon: Icon(icon),
      label: Text(title),
    );
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // final ImageTemporary = File(images.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
        imageSrc = imagePermanent.path;
      });
    } on PlatformException catch (e) {
      print('Impossible de télécharger l\'image $e');
    }
  }

  // Fonction pour supprimer l'image
  void deleteImage() {
    setState(() {
      image = null;
      imageSrc = null;
    });
  }

  // Future<void> _dialogBuilder(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Basic dialog title'),
  //         content: const Text('Quiz créer avec succèss'),
  //         actions: <Widget>[
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Fermer'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Ok'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               // Navigator.pushNamed(context, QuestionPage());     
  //                        },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const d_color1 = Color(0xFF031B49);
    const d_color2 = Color(0xEAEAFF);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: d_color1,
            centerTitle: true,
            // theme: theme(),
            title: Padding(
              padding: EdgeInsets.all(100),
              child: Text(
                'Créer un quiz de categorie ',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                height: 200,
                width: double.infinity,
                child: (image != null)
                    ? Image.file(
                        image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/background-quiz-card.jpg'),
                          fit: BoxFit.cover,
                        )),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ajouter une image',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            buildButton(
                              title: 'Choisir image',
                              icon: Icons.image,
                              onClicked: () => pickImages(),
                            ),
                          ],
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Quiz categorie : ' +widget.categorie),
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: titleController,
                          validator: (value) {
                            if (value!.length < 10 || value.length > 50) {
                              return 'Le titre doit avoir entre 10 et 50 caracteres';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Entrer le nom du quiz',
                              labelText: 'Titre',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: descController,
                          validator: (value) {
                            if (value!.length < 10 || value.length > 50) {
                              return 'Le titre doit avoir entre 10 et 50 caracteres';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Description du quiz',
                              labelText: 'Description',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Quiz quizz = Quiz(
                                        quizId: null,
                                        visibility: 'public',
                                        description: descController.text,
                                        creationDate: '2023-10-03',
                                        category: widget.categorie,
                                        title: titleController.text,
                                        nbQuestion: 2,
                                        imageUrl: "informatique1.jpg",
                                        user: User(
                                            userId: 1,
                                            firstName: "firstName",
                                            lastName: "lastName",
                                            email: "email",
                                            password: "password",
                                            login: "login",
                                            imageUrl: "imageUrl"));
                                    QuizService service = QuizService();
                                    await service.createQuiz(1, quizz);
                                    descController.clear();
                                    titleController.clear();
                                    print('Quiz créé avec succès.');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage(quizz:quizz)));
                                
                              } else {
                                print('Quiz non crée');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              backgroundColor: Color(0xFF031B49),
                            ),
                            child: Text(
                              'Suivant',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//page question *******************

