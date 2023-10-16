import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:multiselect/multiselect.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/pages/question_page.dart';
import 'package:quiz_app/services/quiz_service.dart';

enum SingingCharacter { public, private }

class QuizCreation extends StatefulWidget {
  static String routeName = "/quiz_detail";
  String categorie = "";

  QuizCreation({super.key, required this.categorie});

  @override
  State<QuizCreation> createState() => _QuizCreationState();
}

class _QuizCreationState extends State<QuizCreation> {
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

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categorieController = TextEditingController();
  final dateController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.public;
  List<String> visibilite = [];
  @override
  Widget build(BuildContext context) {
    const dColor1 = Color(0xFF031B49);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: dColor1,
            centerTitle: true,
            // theme: theme(),
            title: const Padding(
              padding: EdgeInsets.all(10),
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
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/background-quiz-card.jpg'),
                          fit: BoxFit.cover,
                        )),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
              const SizedBox(
                height: 20,
              ),
              Text('Quiz categorie : ' + widget.categorie),
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
                          decoration: const InputDecoration(
                              hintText: 'Description du quiz',
                              labelText: 'Description',
                              border: OutlineInputBorder()),
                        ),

                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<SingingCharacter>(
                              value: SingingCharacter.public,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            const Text('Public'),
                            Radio<SingingCharacter>(
                              value: SingingCharacter.private,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            const Text('Private'),
                          ],
                        ),
                        // DropDownMultiSelect(
                        //   onChanged: (List<String> x){
                        //     setState(() {
                        //       visibilite = x;
                        //     });
                        //   },
                        //   options : ['public','private'],
                        //   selectedValues: visibilite,
                        //   whenEmpty : 'Type de visibilité'
                        // ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                debugPrint('Debut ');
                                Quiz quizz = Quiz(
                                    quizId: null,
                                    visibility:
                                        _character.toString().split('.').last,
                                    description: descController.text,
                                    creationDate: "",
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
                                        imageUrl: "imageUrl"), questions: []);
                                QuizService service = QuizService();
                                await service.createQuiz(1, quizz);
                                descController.clear();
                                titleController.clear();
                                print('Quiz créé avec succès.');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuestionPage(quizz: quizz)));
                              } else {
                                print('Quiz non crée');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              backgroundColor: Color(0xFF031B49),
                            ),
                            child: const Text(
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