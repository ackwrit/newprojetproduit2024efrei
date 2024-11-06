import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyFirestoreHelper{
  final cloudUtilisateurs = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudProduits = FirebaseFirestore.instance.collection("PRODUITS");
  final auth = FirebaseAuth.instance;




  Future<MyUser>registerUser({required String email, required String password, required String name, required String lastName}) async {

    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = credential.user.uid;
    Map<String,dynamic> datas = {
      "NOM":lastName,
      "PRENOM":name,
      "EMAIL":email
    };
    addUser(uid: uid, data: data);



  }


  addUser({required String uid, required Map<String,dynamic> data}){
    cloudUtilisateurs.doc(uid).set(data);
  }

  Future<MyUser>connexion(String email,String password) async{
    UserCredential credential = await auth.signInWithEmailAndPassword(email: email,password: password);
    String uid = credential.user!.uid;
    return getUser(uid);

  }

  //recuperer un UTILISATEURS
  Future <MyUser>getUser(uid) async{
    DocumentSnapshot snapshot = await cloudUtilisateur.doc(uid).get();
    return MyUser(snapshot);

  }









}