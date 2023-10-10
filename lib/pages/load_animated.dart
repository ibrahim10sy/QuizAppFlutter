
 import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/nav.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
      Color myColor = const Color(0xFF3F489C);

    return   AnimatedSplashScreen(
      backgroundColor: (myColor),
           splash: Lottie.asset("assets/lottie.json"),
           splashIconSize: 70,
           duration: 9000,
      nextScreen: const Nav(),
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}