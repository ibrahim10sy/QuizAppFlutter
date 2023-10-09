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
import 'package:multiselect/multiselect.dart';

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
  List<Choise> Choix_List = [];

  final _reponseController = TextEditingController();
  List<TextEditingController> _reponseControllers = [];

 bool isAddingResponse = false;
  int _textFieldCount = 0;

  void generateTextField() {
    if (_textFieldCount < 5) {
      setState(() {
        _textFieldCount++;
        _reponseControllers.add(TextEditingController()); // Ajoutez un nouveau contrôleur

      });
      
    }
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

  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final reponseController = TextEditingController();
  List<String> type = [];
  List<String> choix = [];
  @override
  void initState() {
    Choix_List = [];
    _reponseControllers = []; 
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
                             DropDownMultiSelect(
                          onChanged: (List<String> x){
                            setState(() {
                              type = x;
                            });
                          },
                          options : ['vrai-faux','choix-multiple'],
                          selectedValues: type,
                          whenEmpty : 'Type de question'
                        ),
                        SizedBox(
                              height: 15,
                            ),
                            // TextFormField(
                            //   controller: reponseController,
                            //   validator: (value) {
                            //     if (value!.length < 10 || value.length > 50) {
                            //       return 'Champ obligatoire';
                            //     }
                            //     return null;
                            //   },
                            //   decoration: const InputDecoration(
                            //       hintText: 'Reponse',
                            //       labelText: 'Reponse',
                            //       border: OutlineInputBorder()),
                            // ),

        //                        TextFormField(
        //   controller: _reponseController,
        //   validator: (value) {
        //     if (value!.length < 10 || value.length > 50) {
        //       return 'Champ obligatoire';
        //     }
        //     return null;
        //   },
        //   decoration: const InputDecoration(
        //     hintText: 'Reponse',
        //     labelText: 'Reponse',
        //     border: OutlineInputBorder()),
        // ),
        //   TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Reponse',
        //       labelText: 'Reponse',
        //       border: OutlineInputBorder()),
        //   ),
        //  for (int i = 0; i < _textFieldCount; i++)
        // SizedBox(
        //   height: 15,
        // ),
        // ElevatedButton(
        //   onPressed: generateTextField,
        //   child: Text('Ajouter reponse'),
        // ),
        SizedBox(height: 10,),
        Column(
          
          children: [
             
          for (int i = 0; i < _textFieldCount; i++)
          TextFormField(
             controller: _reponseControllers[i],
            decoration: const InputDecoration(
              hintText: 'Reponse',
              labelText: 'Reponse',
              border: OutlineInputBorder()),
          ),
          SizedBox(height: 5,),
           ElevatedButton(
          onPressed: generateTextField,
          child: Text('Ajouter reponse'),
        ),
          ],
        ),
    
     
       

                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                debugPrint('Début validation ');
                                
                          //          List<Choise> choisesList = [];
                          //          for (int i = 0; i < _textFieldCount; i++) {
                          //   String choiseText = _reponseControllers[i].text; // Récupérez le texte du contrôleur
                          //   Choise choise = Choise(choiseId: null, text: choiseText, rank: 1);
                          //   choisesList.add(choise); // Ajoutez l'objet Choise à la liste
                          // }
                          //         Question question = Question(questionId: null, point: 50, text: textController.text, type: type.first, rank: 1, rankResponse: 1, choises: Choix_List);
                          //         Choise choise1 = Choise(choiseId: null, text: _reponseControllers[i].text, rank: 1);
                          //         // Choise choise2 = Choise(choiseId: null, text: _reponseController.text, rank: 1);
                          //         debugPrint(choise1.text);
                          //         if(choise1 != null){
                                    
                          //           Choix_List.add(choise1);
                          //           // Choix_List.add(choise2);
                          //           debugPrint("Nombre éléments : ${Choix_List.length}");

                          //           QuestionService Q_service = QuestionService();
                          //           Question? q = await Q_service.createQuestion(1, 1, question);
                          //         }
                                  
                          //         debugPrint(question.toJson().toString());

                           List<Choise> choisesList = [];

for (int i = 0; i < _textFieldCount; i++) {
  String choiseText = _reponseControllers[i].text; // Récupérez le texte du contrôleur
  Choise choise = Choise(choiseId: null, text: choiseText, rank: 1);
  choisesList.add(choise); // Ajoutez l'objet Choise à la liste
}

Question question = Question(
  questionId: null,
  point: 50,
  text: textController.text,
  type: type.first,
  rank: 1,
  rankResponse: 1,
  choises: choisesList, // Utilisez la liste de Choise créée précédemment
);

// Vous pouvez ensuite ajouter cette question à votre base de données, par exemple, en utilisant votre service QuestionService.
QuestionService Q_service = QuestionService();
Question? q = await Q_service.createQuestion(1, 1, question);

// Affichez les informations de la question et de ses choix
debugPrint(question.toJson().toString());
                                  
                                  // ChoixService choixService = ChoixService();
                                  // await choixService.createChoix(1, 1, 1, choises);

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
