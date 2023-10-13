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

enum SingingCharacter { choixMultiple, vraiFaux }

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
        _reponseControllers
            .add(TextEditingController()); // Ajoutez un nouveau contrôleur
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
  List<TextEditingController> reponseControllers =
      List.generate(5, (index) => TextEditingController());
  List<bool> checkboxStates = List.generate(5, (index) => false);
  SingingCharacter? _character = SingingCharacter.choixMultiple;
  List<String> type = [];
  List<String> choix = [];
  bool? isvalue = false;
  int convertedValue = 0;
  int intValue = 0;

 int convertBoolToInt(bool value) { //conversion de la valeur boolean en int
  return value ? 1 : 0;
}


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
                        height: 10,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Radio<SingingCharacter>(
                      //       value: SingingCharacter.choixMultiple,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           _character = value;
                      //         });
                      //       },
                      //     ),
                      //     const Text('Choix Multiple'),
                      //     Radio<SingingCharacter>(
                      //       value: SingingCharacter.vraiFaux,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           _character = value;
                      //         });
                      //       },
                      //     ),
                      //     const Text('Vrai/Faux'),
                      //   ],
                      // ),

                      DropDownMultiSelect(
                          onChanged: (List<String> x) {
                            setState(() {
                              type = x;
                            });
                          },
                          options: ['vrai-faux', 'choix-multiple'],
                          selectedValues: type,
                          whenEmpty: 'Type de question'),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < _textFieldCount; i++)
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: _reponseControllers[i],
                                      decoration: const InputDecoration(
                                          hintText: 'Reponse',
                                          labelText: 'Reponse',
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Transform.scale(
                                  scale: 2,
                                  child: Checkbox(
                                    value: checkboxStates[i], // Utilisez l'état de la Checkbox correspondante
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        checkboxStates[i] = newValue ?? false; // Mettez à jour l'état dans la liste
                                        intValue = convertBoolToInt(checkboxStates[i]); // Affectez la valeur entière convertie
                                      });
                                    },
                                    activeColor: Color(0xFF031B49),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ])),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    debugPrint('Début validation ');

                    //         debugPrint(question.toJson().toString());

                    List<Choise> choisesList = [];

                    for (int i = 0; i < _textFieldCount; i++) {
                      String choiseText = _reponseControllers[i]
                          .text; // Récupérez le texte du contrôleur
                      Choise choise =
                          Choise(choiseId: null, text: choiseText, rank: 1);
                      choisesList
                          .add(choise); // Ajoutez l'objet Choise à la liste
                    }
                    for (int i = 0; i < _textFieldCount; i++) {
                      // int currentCheckboxValue = checkboxStates[i] ? 1 : 0;

                      Question question = Question(
                        questionId: null,
                        point: 5,
                        text: textController.text,
                        type: type.first,
                        rank: 1,
                        rankResponse: intValue,
                        choises: choisesList,
                      );

                      debugPrint(question.toJson().toString());
                      QuestionService Q_service = QuestionService();
                      Question? q =
                          await Q_service.createQuestion(1, 1, question);
                    }
                    print("Question ajoutée avec succès");
                  } else {
                    print("Question non ajoutée");
                  }
                },
                child: Text('Valider'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF031B49), // Couleur de fond du bouton
                  onPrimary: Colors.white, // Couleur du texte
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20, // Espacement vertical
                    horizontal: 30, // Espacement horizontal
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: generateTextField,
                child: Text('Ajouter reponse'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green[300], // Couleur de fond du bouton
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
            ],
          )
        ],
      )),
    );
  }
}

/////success page
// class SuccessPage extends StatelessWidget {
//   const SuccessPage({super.key});
//   static String routeName = "/success";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF031B49),
//       body: Column(
//         children: [
//           // Padding(padding: EdgeInsets.only(left: 40,),),:
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 child: Icon(
//                   Icons.clear,
//                   size: 40,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 200,
//           ),
//           Container(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Quiz créé avec succès !',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 28,
//                         fontFamily: 'Poppins',
//                       )),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Icon(
//                     Icons.check_circle_outline,
//                     color: Colors.green,
//                     size: 120,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

//       //  ),
//     );
//   }
// }
