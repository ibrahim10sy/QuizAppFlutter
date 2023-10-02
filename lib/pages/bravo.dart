

 import 'package:flutter/material.dart';

class Bravo extends StatefulWidget {
  const Bravo({super.key});

  @override
  State<Bravo> createState() => _BravoState();
}

class _BravoState extends State<Bravo> {
  @override
  Widget build(BuildContext context) {
     Color myColor = const Color(0xFF3F489C);
     Color score = const Color(0xFF6C90EF);

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
        const Text('BRAVO !', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, 
          fontFamily: "poppins", fontSize: 40,),),
        const SizedBox(height: 30,),
         Text('VOTRE SCORE', style: TextStyle(
          color:(score), fontWeight: FontWeight.bold, 
          fontFamily: "Poppins", fontSize: 25,),),
          const SizedBox(height: 15,),
          Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
      padding: EdgeInsets.only(left: 70), // Ajoutez une marge à droite du premier texte
      child: Text(
        '18/20',
        textAlign: TextAlign.start, // Alignez le texte à gauche
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),

      ),
    ),
    SizedBox(height: 40,),
    Container(
      padding: EdgeInsets.only(left: 120), // Ajoutez une marge à gauche du deuxième texte
      child: Text(
        '+90 points',
        textAlign: TextAlign.end, 
        // Alignez le texte à droite
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),

              ],
            ),
        const SizedBox(height: 60,),
            Image.asset(
              'assets/image/win.png',
              height: 200,
              width: 200,
            ),
            
            const SizedBox(height: 120,),
            ElevatedButton(
              
              child: Text('Suivant', textAlign: TextAlign.center,
               style: TextStyle(fontSize:20 , fontWeight:  FontWeight.bold),),
              onPressed: () {},
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
 //  const SizedBox(height: 10,),
           
        //   IconButton(
        //     color: Colors.white,
        //     icon:const Icon(Icons.clear, size: 20, color: Colors.white,),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),