import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/data/quizzes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/models/user.dart';
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

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.categorie);
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
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Impossible de télécharger l\'image $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

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
                'Créer un quiz',
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
             
              Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(10),
                  child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez renseigner le titre';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Entrer le nom du quiz',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Créez une instance de Quiz avec les données du formulaire
                    Quiz quiz = Quiz(
                      quizId: 1,
                      visibility: "public",
                      description: "description",
                      creationDate: "2023-10-03",
                      category: widget.categorie, // Utilisez la propriété passée depuis le widget
                      title: titleController.text,
                      nbQuestion: 10,
                      imageUrl: "informatique1.jpg",
                      user: User(
                        userId: 1,
                        firstName: "firstName",
                        lastName: "lastName",
                        email: "email",
                        password: "password",
                        login: "login",
                        imageUrl: "imageUrl",
                      ),
                    );

                    // Créez une instance de QuizService et appelez createQuiz
                    QuizService service = QuizService();
                    await service.createQuiz(1, quiz);
                    
                    print('Quiz créé avec succès');
                  } else {
                    print('Quiz non créé');
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
            ),],
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


class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

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
