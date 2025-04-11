import 'package:app/business/models/Authentification.dart';
import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/login/loginControl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  var emaiCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(loginControlPorvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),

              CircleAvatar(
                radius: 80, // Taille de l'avatar
                backgroundColor: const Color.fromARGB(
                  181,
                  255,
                  30,
                  0,
                ), // Couleur de fond
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),

              SizedBox(height: 50),

              SizedBox(
                height: 80,
                width: 400,
                child: TextField(
                  controller: emaiCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                    hintText: "Email",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.email)
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                height: 80,
                width: 400,
                child: TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Mot de passe",
                    hintText: "Mot de passe",
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value)  {
                    if(value == null || value.isEmpty){
                      return "Veuillez remplir tous les champs";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  onPressed: () async {
                    var ctrl = ref.read(loginControlPorvider.notifier);
                    var data = Authentification(
                      email: emaiCtrl.text,
                      password: passwordCtrl.text,
                    );
                    var res = await ctrl.submitForm(data);
                    if (res) {
                      // navigation vers article list
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ListarticlePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      181,
                      255,
                      30,
                      0,
                    ), // Couleur du bouton
                    foregroundColor: Colors.white, // Couleur du texte
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bords arrondis
                    ),
                  ),
                  child: Text(
                    state.isLoading == true ? "Chargement..." : "Se connecter",
                  ),
                ),
              ),

              SizedBox(),

              Text("Vous  n'avez pas de compte, Creer un compte ?")
            ],
          ),
        ),
      ),
    );
  }
}
