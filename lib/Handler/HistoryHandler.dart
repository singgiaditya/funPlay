import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/models/users_models.dart';
import 'package:fun_play/widgets/navBar.dart';

class HistoryHandler {
  static List History = [];

  static void addHistory(int jenis){
    var dt = DateTime.now();
    var hour = dt.hour.toString();
    var minute = dt.minute.toString();
    var second = dt.second.toString();

    var data = {
      "jenis" : jenis,
      "jam" : "${hour} ${minute} ${second}",
    };
    History.add(data);
  }
}
