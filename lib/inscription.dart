import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Incription();
  }
}

class Incription extends StatefulWidget {
  @override
  _IncriptionState createState() => _IncriptionState();
}

class _IncriptionState extends State<Incription>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  String value = "";
  String name = "";
  String mail = "";
  String password = "";
  String passwordConfirm = "";
  bool _obscureText = true;

  void validationForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _formKey.currentState?.reset();
      Navigator.pushNamed(context, '/connexion');
    } else {
      debugPrint("error");
    }
  }

  void affichage(nom) {
    setState(() {
      value = "Bienvenue $nom";
    });
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
              Image.asset(
                'assets/union.png',
                height: 150,
                width: 140,
              ),
              Text(
                "Inscription",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF031B49)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value,
                style: TextStyle(fontSize: 20, color: Color(0xFF031B49)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Nom d'utilisteur",
                    hintText: "Entrez votre nom d'utilisateur",
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
                onSaved: (val) => name = val!,
                keyboardType: TextInputType.text,
                autocorrect: true,
                autofocus: true,
                onChanged: affichage,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Mail",
                    hintText: "Entrez votre mail",
                    icon: Icon(
                      Icons.mail,
                      color: Color(0xFF031B49),
                      size: 20,
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Veillez entrez votre mail";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => mail = val!,
              ),
              // fin  adresse email
              const SizedBox(
                height: 10,
              ),
              // debut  mot de pass
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Nouveau mot de passe",
                    hintText: "Entrez votre nouveau mot de passe",
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
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Veillez entrez votre nouveau mot de passe";
                  }
                  if (val.length < 4) {
                    return 'Le mot de passe doit contenir au moins 4 caractères';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => password = val!,
              ),
              // fin mot de pass
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordConfirmController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Confirmer mot de passe",
                    hintText: "Confirmer mot de passe",
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
                      Icons.password,
                      color: Color(0xFF031B49),
                      size: 20,
                    )),
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Veillez confirmer votre mot de passe";
                  }
                  if (val != passwordController.text) {
                    return "les mots de passe ne correspondent pas";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => passwordConfirm = val!,
              ),
              // fin confirme mot de passe
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text(
                  "Inscription",
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
            ],
          )),
    ));
  }
}
