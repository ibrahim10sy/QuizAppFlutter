import 'package:flutter/material.dart';
import '../../../../../models/user.dart';
import 'components/body.dart';


class Account extends StatelessWidget {
  static String routeName = 'account';
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final seller = ModalRoute.of(context)?.settings.arguments as Seller;
    final User user = User(userId: 1, firstName: "firstName", lastName: "lastName", email: "email", password: "password", login: "login", imageUrl: "imageUrl");
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){

          },
        ),
        title: const Text("Compte"),
      ),
      body: Body(user: user,),
    );
  }
}
