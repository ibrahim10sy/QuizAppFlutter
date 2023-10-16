import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constantes.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/pages/play_quiz/PlayQuiz.dart';
import 'package:quiz_app/pages/quiz_detail/quiz_detail.dart';
import 'package:quiz_app/pages/splashScreen.dart';
import 'package:quiz_app/services/push_notifications.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:quiz_app/theme.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// function to lisen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // on background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Background Notification Tapped");
      navigatorKey.currentState!.pushNamed("/message", arguments: message);
    }
  });

  PushNotifications.init();
  PushNotifications.localNotiInit();
  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("Got a message in foreground");
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });
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
  late Quiz quiz;
  QuizService quizService = QuizService();
  @override
  void initState() {

    super.initState();
    quizService.getQuiz(1).then((value) {
      setState(() {
        quiz = value!;
        print(quiz);
      });
    });
    /*messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print(value);
    });


    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message réçus");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message cliqué!');
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
      navigatorKey: navigatorKey,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      home:SplashScreen(),
      //home: PlayQuiz(quiz: quiz,),
    );
  }
}


/*

import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/theme.dart';
import 'package:device_preview/device_preview.dart';


void main(){
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: theme(),
      title: 'Quiz Master',
      home: Nav() ,
    );
  }
}
 */
