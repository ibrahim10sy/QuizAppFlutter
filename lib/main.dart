import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/connexion.dart';
import 'package:quiz_app/inscription.dart';
import 'package:quiz_app/nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/services/local_notification_service.dart';
import 'package:quiz_app/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

//Future backgroundHandler(RemoteMessage message) async{}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late FirebaseMessaging messaging;
  @override
  void initState() {

    super.initState();
    /*messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print(value);
    });*/

    /*LocalNotificationService.initialize();

    // To initialise the sg
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("Initial message : ${message.toString()}");
    });
    // To initialise when app is not terminated
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        LocalNotificationService.display(message);
      }
    });

    // To handle when app is open in
    // user divide and heshe is using it
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("on message opened app: ${message.toString()}");
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Master',
      home: Connexion() ,
      initialRoute: '/',
      routes: {
        '/nav':(context) => Nav(),
        '/inscription': (context) => SignUp(),
        '/connexion': (context) => SignIn(),
      },
    );
  }
}

