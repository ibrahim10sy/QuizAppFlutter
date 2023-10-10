import 'package:flutter/material.dart';
import '../../../constantes.dart';
import '../../../widgets/next_interaction.dart';
import '../../../widgets/profile_img.dart';
import 'components/account/account.dart';
import 'components/help/help.dart';
import 'components/setting/setting.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 10,),
              ProfileImg(profileImg: "${kBaseUrlForImage}user/Anime_zone.jpg", pressShowImg: (){}, showIconModif: true,),
              const SizedBox(height: 50,),
              NextInteraction(leading: const Icon(Icons.account_circle, color: kPrimaryColor,), text: 'Mon compte', press: (){},),
              NextInteraction(leading: const Icon(Icons.settings, color: kPrimaryColor,), text: 'Parametres', press: (){},),
              NextInteraction(leading: const Icon(Icons.help, color: kPrimaryColor,), text: 'Aide', press: (){},),
              NextInteraction(leading: const Icon(Icons.logout, color: kPrimaryColor,), text: 'Deconnexion', press: (){showDialog(context: context, builder: (context) => alertDialog(context), barrierDismissible: false);},),
            ],
          ),
        ),
      ),
    );
  }
  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Déconnexion"),
      content: const Text("Ete vous sûr de vouloir vous déconnecté ?"),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kAppBarColor),
          ),

          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Annuler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),

          onPressed: (){},
          child: const Text("Déconnexion", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],

      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}







