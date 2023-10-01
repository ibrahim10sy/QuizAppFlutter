import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key});
    static const String pageName = '/question';

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
              titleSection,
              SizedBox(
                height: 50,
              ),
              InputSection
            ],
          ),
        ),
      ),
    );
  }
}

Widget titleSection = Container(
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.all(5),
  height: 200,
  width: double.infinity,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.blue,
        Colors.green,
      ],
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle_outline),
      ),
      SizedBox(height: 16),
      Text(
        'Ajouter une image',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

Widget InputSection = Container(
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Questions 1', 
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'Entrer une reponse', 
              border: OutlineInputBorder()),
        ),
      ],
    ));
