import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/models/users_models.dart';
import 'package:fun_play/widgets/navBar.dart';

class LoginHandler{
  static Future<void> login(BuildContext context ,String email, String password) async {
    try {
  final db = FirebaseFirestore.instance;
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  User_models.email = FirebaseAuth.instance.currentUser?.email;
  User_models.name = FirebaseAuth.instance.currentUser?.displayName;
  DocumentSnapshot<Map<String, dynamic>> phone_number= await db.collection("funplay").doc("Database").collection("user").doc(email).collection('Data').doc("phone").get();
  DocumentSnapshot<Map<String, dynamic>> saldo = await db.collection("funplay").doc("Database").collection("user").doc(email).collection('Data').doc("saldo").get();
  User_models.phone = phone_number['phone_number'];
  User_models.saldo = saldo['saldo'];
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(),));
} on FirebaseAuthException catch (e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
}
  }
}