import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/compte.dart';
import 'package:quiz_app/finQuiz.dart';
import 'package:quiz_app/nav.dart';
import 'package:quiz_app/theme.dart';

import 'package:quiz_app/pages/categories.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      home: const Compte(),
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
      home: Compte(),
    );
  }
} */
