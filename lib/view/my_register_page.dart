import 'package:flutter/material.dart';
import 'package:amazonmini/controller/constante.dart';
import 'package:amazonmini/view/my_dashboard_view.dart';
import 'package:amazonmini/controller/my_firestore_helper.dart';


class MyRegisterView extends StatefulWidget {
  const MyRegisterView({super.key});

  @override
  State<MyRegisterView> createState() => _MyRegisterView();
}

class _MyRegisterView extends State<MyRegisterView> {
  //variable
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();


  //méthode
  popUp(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context)
        {
          return  AlertDialog.adaptive(
            title:  Text("Message erreur"),
            content:  Text("Il y a une erreur lors de votre saisie"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok")
              ),
            ],

          );
        }


    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          TextField(
            controller: nom,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.person),
                hintText: "Entrer votre prénom",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          TextField(
            controller: prenom,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.person),
                hintText: "Entrer votre nom",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),







          //champs adresse Mail


          TextField(
            controller: mail,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.mail),
                hintText: "Entrer votre adresse mail",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          SizedBox(height: 10,),


          //champs de mot de passe
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.lock),
                hintText: "Entrer votre mot de passe",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          SizedBox(height: 10,),


          //bouton connexion
          ElevatedButton(
            child: Text("Connexion"),
            onPressed: (){
              print("Je suis connecté");

              MyFirestoreHelper().connexion(mail.text, password.text).then((onValue){
                setState((){
                  me = onValue;
                });

                print(me.mail);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyDashBoard(message: mail.text,)));
              }).catchError((onError){
                popUp();
              });


            },
          ),



        ]

    );
  }
}