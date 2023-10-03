import 'package:flutter/material.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/theme.dart';



void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: 'Quiz Master',
      home: Nav() ,
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
