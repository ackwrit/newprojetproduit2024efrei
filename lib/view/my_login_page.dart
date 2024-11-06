import 'package:flutter/material.dart';


class MyLoginView extends StatefulWidget {
  const MyLoginView({super.key});

  @override
  State<MyLoginView> createState() => _MyLoginView();
}

class _MyLoginView extends State<MyLoginView> {
  //variable
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();



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

              MyFirebaseHelper().connexion(mail.text, password.text).then((onValue){
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