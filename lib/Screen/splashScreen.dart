import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fun_play/Screen/homeScreen.dart';
import 'package:fun_play/Screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () {
            Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.asset("assets/background.png", fit: BoxFit.contain,).image)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/logo.png"), Container(width: 9),Text("Fun Plays", style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontFamily: 'Satoshi-Variable',
              decoration: TextDecoration.none
            ),)],
          ),
        ),
      );
  }
}
