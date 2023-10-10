import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constantes.dart';


class ProfileImg extends StatelessWidget {
  const ProfileImg({Key? key, required this.profileImg, this.pressShowImg, this.pressModifImg, this.showIconModif=false,}) : super(key: key);
  final String profileImg;
  final Function()? pressShowImg;
  final Function()? pressModifImg;
  final bool showIconModif;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GestureDetector(
            onTap: pressShowImg,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImg),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 2,
            child: SizedBox(
              width: 30,
              height: 30,
              child: GestureDetector(
                onTap: pressModifImg,
                child: (showIconModif)?Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.camera_alt),
                ):null,
              ),
            ),
          )
        ]
    );
  }
}