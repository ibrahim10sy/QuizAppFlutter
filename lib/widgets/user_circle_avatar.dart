import 'package:flutter/material.dart';

import '../constantes.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({Key? key, required this.imageUrl, required this.title, required this.press}) : super(key: key);
  final String imageUrl;
  final String title;
  final Function() press;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(kBaseUrlForImage+imageUrl),
            ),
            Text(title, style: const TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}