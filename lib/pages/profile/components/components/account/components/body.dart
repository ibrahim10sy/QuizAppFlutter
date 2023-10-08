import 'package:flutter/material.dart';
import '../../../../../../constantes.dart';
import '../../../../../../models/user.dart';
import '../../../../../../widgets/next_interaction.dart';
import '../../../../../../widgets/profile_img.dart';
import 'profile_modification.dart';


class Body extends StatelessWidget {
  const Body({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            ProfileImg(profileImg: kBaseUrlForImage+"Anime_zone.jpg", pressShowImg: (){},pressModifImg: (){}, showIconModif: true,),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NextInteraction(
                  leading: const Text("Prenom:", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  text: user.firstName,
                  press: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ProfileModification(
                            profileDataType: ProfileDataType.prenom,
                            data: user.firstName,
                          );
                        })
                    );
                  },
                  radiusTopLeft: 0,
                  radiusBottomLeft: 0,
                  radiusBottomRight: 0,
                  radiusTopRight: 0,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NextInteraction(
                  leading: const Text("Nom:", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  text: user.lastName,
                  press: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ProfileModification(
                            profileDataType: ProfileDataType.nom,
                            data: user.lastName,
                          );
                        })
                    );
                  },
                    radiusTopLeft: 0,
                    radiusBottomLeft: 0,
                    radiusBottomRight: 0,
                    radiusTopRight: 0,
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NextInteraction(
                  leading: const Text("Identifiant:", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  text: 'ramsey6340',
                  press: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ProfileModification(
                            profileDataType: ProfileDataType.nom,
                            data: 'ramsey6340',
                          );
                        })
                    );
                  },
                  radiusTopLeft: 0,
                  radiusBottomLeft: 0,
                  radiusBottomRight: 0,
                  radiusTopRight: 0,
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NextInteraction(
                  leading: const Text("Mot de passe:", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  text: '******',
                  press: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ProfileModification(
                            profileDataType: ProfileDataType.motDePasse,
                            data: 'vO1l@cte',
                          );
                        })
                    );
                  },
                  radiusTopLeft: 0,
                  radiusBottomLeft: 0,
                  radiusBottomRight: 0,
                  radiusTopRight: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
