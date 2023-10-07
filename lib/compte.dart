// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Compte(), // Utilisez la classe Compte comme écran d'accueil
    );
  }
}

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  File? _image;
  String? imageSrc;

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

  List<String> quizNames = [
    "Quiz 1",
    "Quiz 2",
    "Quiz 3",
    "Quiz 4",
    "Quiz 5",
    "Quiz 6",
  ];

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    child:
                        (_image != null) ? Image.file(_image!) : Text('Photo'),
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
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Animés'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Art'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Histoire')),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Culture')),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Actualité')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Wrap(
              //   children: [
              //     SizedBox(
              //       width: 300,
              //       height: 300,
              //       child: QuizCard(
              //         useBaseUrl: true,
              //           quiz: Quiz(
              //               visibility: "visibility",
              //               description: "description",
              //               creationDate: "creationDate",
              //               category: "category",
              //               quizId: 1,
              //               title: "title",
              //               nbQuestion: 3,
              //               imageUrl: "informatique1.jpg",
              //               user: User(
              //                   userId: 1,
              //                   firstName: "firstName",
              //                   lastName: "lastName",
              //                   email: "email",
              //                   password: "password",
              //                   login: "login",
              //                   imageUrl: "informatique1.jpg")),
              //           press: () {}),
              //     )
              //   ],
              // ),
              Wrap(spacing: 20, runSpacing: 20, children: [
                Stack(
                  children: [
                    InkWell(
                      // onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
                Stack(
                  children: [
                    InkWell(
                      onTap: piquerImage,
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
              ]),
              const SizedBox(height: 490),
              Container(
                width: 800,
                height: 30,
                color: Colors.blue,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.grid_view_sharp,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
