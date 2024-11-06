import 'package:flutter/material.dart';
import 'package:amazonmini/controller/my_firestore_helper.dart';
import 'package:amazonmini/model/my_produit.dart';
import 'package:amazonmini/view/my_background.dart';


class MyDashBoard extends StatefulWidget {
  String message;
  MyDashBoard({super.key ,required this.message});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Mes Produits"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,


      ),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          MyBackground(),
          //lister en grille tous les produits de la base de donnée
          GrilleList()
        ],
      )

    );
  }


  Widget GrilleList(){
    return StreamBuilder(
        stream: MyFirestoreHelper().cloudProduits.snapshots(),
        builder: (context,snap){
          if(snap.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );

          }else {
            if(!snap.hasData){
              return Center(
                child: Text("Aucuns produits"),
              );
            }else {
              List documents = snap.data!.docs;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: documents.length,
                  itemBuilder: (context,index){
                    MyProduct produit = MyProduct(documents[index]);
                    return Text(produit.uid);

                  }
              );
            }

          }
        }
    );
  }


}