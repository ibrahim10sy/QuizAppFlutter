

  import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/categories.dart';

class Lost extends StatefulWidget {
  const Lost({super.key});

  @override
  State<Lost> createState() => _LostState();
}

class _LostState extends State<Lost> {
  @override
  Widget build(BuildContext context) {
   Color myColor = const Color(0xFF3F489C);
     Color score = const Color(0xFFFFFFFF);

    return Scaffold(
      backgroundColor:(myColor) ,
      body:  
       Center(
        
        child:  Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
             const SizedBox(height: 20),
            //  const Text('QUIZMASTER', style: TextStyle(
            //     color: Colors.white, fontWeight: FontWeight.bold, 
            //     fontFamily: "poppins", fontSize: 40),),
            // Padding(padding: EdgeInsets.only(left: 30)),
            Container(
              padding: EdgeInsets.only(left: 350),
              child: 
            Icon(Icons.clear, size: 40, color: Colors.white,),
              
              
            ),

        const SizedBox(height: 30,),
        const Text('Désolé !', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, 
          fontFamily: "poppins", fontSize: 40,),),
        const SizedBox(height: 30,),
         Text('Vous ferez mieux la prochaine fois  ', style: TextStyle(
          color:(score), fontWeight: FontWeight.w500, 
          fontFamily: "Poppins", fontSize: 18,),),
          const SizedBox(height: 15,),
    //       Row(
    //           // mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //           Container(
    //   padding: EdgeInsets.only(left: 70), // Ajoutez une marge à droite du premier texte
    //   child: Text(
    //     '18/20',
    //     textAlign: TextAlign.start, // Alignez le texte à gauche
    //     style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),

    //   ),
    // ),
    // Container(
    //   padding: EdgeInsets.only(left: 120), // Ajoutez une marge à gauche du deuxième texte
    //   child: Text(
    //     '+90 points',
    //     textAlign: TextAlign.end, 
    //     // Alignez le texte à droite
    //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),
    //   ),
    // ),

    //           ],
    //         ),


        const SizedBox(height: 60,),
            Image.asset(
              'assets/image/lost.png',
              height: 200,
              width: 200,
            ),
            
            const SizedBox(height: 120,),
            ElevatedButton(
              
              child: Text('Terminer', textAlign: TextAlign.center,
               style: TextStyle(fontSize:20 , fontWeight:  FontWeight.bold),),
              onPressed: () {
                 Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Nav(),
        ),
      );
              },
              style:  ElevatedButton.styleFrom(
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //  minimumSize: const Size(80, 45),
                fixedSize: Size(200, 40)
              ),
              ), 
              // ),
          ],

          ),
      ),
    );
 }
}