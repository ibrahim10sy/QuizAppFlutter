import 'package:flutter/material.dart';
import '../../constantes.dart';
import 'components/body.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 1,
        centerTitle: true,
        backgroundColor: kAppBarColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Profile"),
      ),
      body: Body(),
    );
  }
}