import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
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
        '/success' :(context) => SuccessPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              InputSection(context)
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

Widget InputSection(BuildContext context) {
  return Container(
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
      ));
}

//page question
class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

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
            titleSection1,
            SizedBox(height: 50, ),
            InputSection1,
            SizedBox( height: 10, ),
            sectionReponse,
            SizedBox( height: 2, ),
            buttonSection(context)
          ],
        ),
      ),
    );
  }
}

Widget titleSection1 = Container(
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

Widget InputSection1 = Container(
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Ajouter une question', border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'Ajouter une reponse', border: OutlineInputBorder()),
        ),
      ],
    ));

Widget sectionReponse = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: BorderSide.none,
            backgroundColor: Color(0xFF031B49),
          ),
          child: Text(
            'Vrai',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 110,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            side: BorderSide.none,
            backgroundColor: Colors.red,
          ),
            child: Text(
              'Faux',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Poppins',
              ),
            ),
          ))
    ],
  ),
 
);

Widget buttonSection(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    width: double.infinity, // Utilisez cette ligne pour étendre le bouton à la largeur de l'écran
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/success');
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF37B1C9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Valider',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Poppins',
        ),
      ),
    ),
  );
}



class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
        
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   ),
      
      body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          Color(0xFF3F489C),
          Color(0xFF3F489C)
        ] ,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Quiz créé avec succès !',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontFamily: 'Poppins',
                
              )
            ),
             SizedBox(height: 25,),
            Icon(Icons.check_circle_outline,
            color: Colors.green,
            size: 120,),
            ],
            ),
            )
    ),
    );
  }
}

