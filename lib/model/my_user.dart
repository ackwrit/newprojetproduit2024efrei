import 'package:cloud_firestore/cloud_firestore.dart';
class MyUser{
  late String mail;
  late String id;
  String? prenom;
  String? nom;
  String? avatar;
  late List produits;



  MyUser.empty(){
    id = "";
    mail = "";
    prenom = "";
    nom = "";
    avatar = "";
    produits = [];
  }


  MyUser(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    mail = map["EMAIL"] ?? "";
    prenom = map["PRENOM"] ?? "";
    nom = map["NOM"] ?? "";
    avatar = map["AVATAR"] ?? "imageDefault";
    produits = map["PRODUITS"] ?? [];
  }
}