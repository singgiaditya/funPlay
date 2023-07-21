import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/Handler/HistoryHandler.dart';
import 'package:fun_play/models/users_models.dart';
import 'package:fun_play/widgets/navBar.dart';

class TicketHandler {
  static Future<void> buy(BuildContext context, int jenis, String lokasi, dynamic nominal) async {
    final db = FirebaseFirestore.instance;
    try {
      Map<String, dynamic> data = {"jenis": "${jenis}"};
      if ((User_models.saldo - nominal) > 0) {
        var docref = await db
          .collection("funplay")
          .doc("Database")
          .collection("user")
          .doc(User_models.email)
          .collection('ticket')
          .doc();

      db
          .collection("funplay")
          .doc("Database")
          .collection("user")
          .doc(User_models.email)
          .collection('ticket')
          .doc(docref.id)
          .set(data);
      HistoryHandler.addHistory(jenis);
      User_models.saldo -= nominal;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Success buy ticket")));
      } else {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("saldo Kurang")));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static Future<List<Map>> getTicket() async {
    final db = FirebaseFirestore.instance;
    List<Map> tiket = [];
    var response = await db
        .collection("funplay")
        .doc("Database")
        .collection("user")
        .doc(User_models.email)
        .collection('ticket')
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = {
            "barcode": "${docSnapshot.id}",
            "jenis": int.parse("${docSnapshot.data()['jenis']}")
          };
          tiket.add(data);
        }
      },
    );
    return tiket;
  }
}
