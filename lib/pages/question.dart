import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/choise.dart';
import 'package:quiz_app/services/choix_service.dart';
import 'package:quiz_app/services/question_service.dart';

class QuestionPage extends StatefulWidget {
  static String routeName = "/QuestionPage";
  final Quiz quizz;

  QuestionPage({Key? key, required this.quizz}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  File? image;
  String? imageSrc;
  List<Choises> Choix_List = [];

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
  final textController = TextEditingController();
  final typeController = TextEditingController();

  @override
  void initState() {
    Choix_List = [];
    super.initState();
  }

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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: textController,
                              validator: (value) {
                                if (value!.length < 10 || value.length > 50) {
                                  return 'Champ obligatoire';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Entrer la question',
                                  labelText: 'Question',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: typeController,
                              validator: (value) {
                                if (value!=null) { 
                                  return 'Champ obligatoire';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Entrer le type',
                                  labelText: 'Type',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Créez une nouvelle question en utilisant les contrôleurs de texte
                                  Question question = Question(
                                    text: textController.text,
                                    type: typeController.text,
                                    quiz: widget.quizz, 
                                  );
                                  QuestionService Q_service = QuestionService();
                                  await Q_service.createQuestion(1, 1, question);

                                  print("Question ajoutée avec succès");
                                } else {
                                  print("Question non ajoutée");
                                }
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
                              ),
                            )
                          ]),
                    ]))),
          ],
        ),
      ),
    );
  }
}

class ChoixPage extends StatefulWidget {
  const ChoixPage({super.key});

  @override
  State<ChoixPage> createState() => _ChoixPageState();
}

class _ChoixPageState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix page'),
      ),
    );
  }
}

/////success page
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});
  static String routeName = "/success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031B49),
      body: Column(
        children: [
          // Padding(padding: EdgeInsets.only(left: 40,),),:
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.clear,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quiz créé avec succès !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontFamily: 'Poppins',
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 120,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //  ),
    );
  }
}
