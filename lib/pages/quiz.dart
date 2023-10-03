import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:quiz_app/pages/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/question': (context) => QuestionPage(),
        '/success': (context) => SuccessPage(),
      },
    );
  }
}

/**************Home***************************** */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;

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
              // Container(
              //   child: ElevatedButton(
              //     onPressed: pickImages,
              //     child: Text('Ajouter une image'),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Entrer le nom du quiz',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/question');
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//page question *******************
class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  File? image;

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
              child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to the left
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Ajouter une question',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ajouter une réponse 1',
                              border: OutlineInputBorder(),
                            ),
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ajouter une réponse 2',
                              border: OutlineInputBorder(),
                            ),
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ajouter une réponse 3',
                              border: OutlineInputBorder(),
                            ),
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ajouter une réponse 4',
                              border: OutlineInputBorder(),
                            ),
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ajouter une réponse 5',
                              border: OutlineInputBorder(),
                            ),
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
                          Navigator.pushNamed(context, '/success');
                        },
                        child: Text('Valider'),
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color(0xFF031B49), // Couleur de fond du bouton
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
            ),
          ],
        ),
      ),
    );
  }
}

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
