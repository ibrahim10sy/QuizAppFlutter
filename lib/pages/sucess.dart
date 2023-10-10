import 'dart:async';

import 'package:flutter/material.dart';

import '../nav.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});
  static String routeName = "/success";

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

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
    return Scaffold(
      backgroundColor: Color(0xFF031B49),
      body: Column(
        children: [
          // Padding(padding: EdgeInsets.only(left: 40,),),:
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.clear,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quiz créé avec succès !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontFamily: 'Poppins',
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 120,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //  ),
    );
  }
}