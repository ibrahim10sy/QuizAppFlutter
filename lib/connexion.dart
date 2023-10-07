import 'package:flutter/material.dart';
import 'package:quiz_app/inscription.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/services/user_service.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Connexion();
  }
}

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String pseudo = "";
  bool _obscureText = true;

  dynamic validationForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _formKey.currentState?.reset();

      Map<String, String> userData = {
        "login": pseudo.toString(),
        "password": password.toString(),
        // Ajoutez d'autres champs si nécessaire
      };
      print(userData);
      UserService userService = UserService();
      User? currentUser = await userService.loginUser(pseudo, password);
      if (currentUser != null) {
        print(currentUser);
        Navigator.pushNamed(context, '/nav');
      } else {
        return "Cet utilisateur n'existe pas";
      }

      /*var response = await http.post(
        Uri.parse(
            'https://10.0.2.2/api/users/connect'), // Remplacez ceci par l'URL de votre endpoint d'API
        body: userData,
      );*/
      /*if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/nav');

        // Succès : les données ont été envoyées avec succès à votre API
        debugPrint("Données envoyées avec succès !");
      } else {
        // Échec : les données n'ont pas pu être envoyées à votre API
        debugPrint("Erreur lors de l'envoi des données à l'API");
      }*/
    } else {
      debugPrint("error");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/union.png',
                    height: 150,
                    width: 140,
                  ),
                  Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF031B49)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Nom d'utilisateur",
                        hintText: "Entrez votre Nom d'utilisateur",
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF031B49),
                          size: 20,
                        )),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre nom d'utilisateur";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => pseudo = val!,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Mot de passe",
                        hintText: "Entrez votre Mot de passe",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Inverser l'état du texte masqué
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons
                                    .visibility, // Choisir l'icône basée sur l'état du texte masqué
                            color: Colors.grey,
                          ),
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xFF031B49),
                          size: 20,
                        )),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre Mot de passe";
                      }
                      else {
                        return null;
                      }
                    },
                    onSaved: (val) => password = val!,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                    obscureText: _obscureText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Conexxion",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: validationForm,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF031B49),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minimumSize: Size(300, 40)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("si vous n'avez pas de compte ?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "inscrivez vous",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ))),
    );
  }
}
