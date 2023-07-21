import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterHandler{
  static void registerPhone(String phone, String email) async{
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      "phone_number" : "${phone}"
    };
    db.collection("funplay").doc("Database").collection("user").doc(email).collection('Data').doc("phone").set(data);
  }

  static void addSaldo(String phone, String email) async{
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      "saldo" : 2000000
    };
    db.collection("funplay").doc("Database").collection("user").doc(email).collection('Data').doc("saldo").set(data);
  }

   static void register(BuildContext context,String email, String name, String phone, String password)async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);            
      registerPhone(phone, email);
      addSaldo(phone, email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success create account")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}