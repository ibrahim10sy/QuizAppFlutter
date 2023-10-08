import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    //declenchement du flux d'authentification
    final googleUser = await _googleSignIn.signIn();

    //Obtention des details d'autorisations
    final googleAuth = await googleUser!.authentication;

    // creation d'un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Une fois connecté on renvoi l'identifiant de l'utilisateur
    return await _auth.signInWithCredential(credential);
  }
}
