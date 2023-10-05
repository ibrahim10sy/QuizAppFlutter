import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';

class QuestionPage extends StatefulWidget {
  static String routeName = "/question_page";
  
  final Quiz quizz;
  QuestionPage({super.key, required this.quizz});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  File? image;
  String? imageSrc;

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

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final reponseController = TextEditingController();
  // final pointController = TextEditingController();
  // final rangReponseController = TextEditingController();
  // final rangController = TextEditingController();
  // final choixController = TextEditingController();
  // final quizController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Color(0xFF031B49),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3),
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
            Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(10),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the left
                          children: [
                            TextFormField(
                              controller: titleController,
                              validator: (value) {
                                if (value!.length < 10 || value.length > 50) {
                                  return 'Champ obligatoire';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Entrer la question',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: reponseController,
                                    validator: (value) {
                                      if (value!.length < 10 ||
                                          value.length > 50) {
                                        return 'Entrer la reponse 1';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Reponse 1',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? newValue) {},
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.length < 10 ||
                                          value.length > 50) {
                                        return 'Entrer une reponse ';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Entrer la reponse 2',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? newValue) {},
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.length < 10 ||
                                          value.length > 50) {
                                        return 'Entrer une reponse ';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Entrer la reponse 3',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? newValue) {},
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.length < 10 ||
                                          value.length > 50) {
                                        return 'Entrer une reponse ';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Entrer la reponse 4',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? newValue) {},
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.length < 10 ||
                                          value.length > 50) {
                                        return 'Entrer une reponse ';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Entrer la reponse 5',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? newValue) {},
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                 
                                },
                                child: Text('Valider'),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(
                                      0xFF031B49), // Couleur de fond du bouton
                                  onPrimary: Colors.white, // Couleur du texte
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20, // Espacement vertical
                                    horizontal: 30, // Espacement horizontal
                                  ),
                                ))
                          ]),
                    ]))),
          ],
        ),
      ),
    );
  }
}
