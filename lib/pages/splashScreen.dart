import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


 @override
  void initState() {
    super.initState();

    Timer(
     const  Duration(seconds:7), 
      () =>
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(
      builder: (_) => const Nav(),
      ),
      ),
     );
    
    
  }

  @override
  Widget build(BuildContext context) {
  Color myColor = const Color(0xFF3F489C);
    return  Scaffold(
      backgroundColor: (myColor),
    
      body: Center(
        
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
                  'assets/image/logo.png',
                  height: 150,
                  width: 150,
                ),
               const SizedBox(
                  height: 20,
                ),
               const Text(
                  'QUIZMASTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                   fontFamily: 'Molle',
                  ),
                )

          ],
        )
        
      ),
      
    );
  }
}