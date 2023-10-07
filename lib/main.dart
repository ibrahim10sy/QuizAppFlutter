import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/services/local_notification_service.dart';
import 'package:quiz_app/theme.dart';


void main() {
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
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      home:Nav() ,
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
