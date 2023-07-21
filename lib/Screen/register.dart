import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/Handler/Auth/RegisterHandler.dart';
import 'package:fun_play/Screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visibilty = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/background.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  margin: const EdgeInsets.only(left: 24, top: 36, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 35, 37, 96),
                        ),
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.only(left: 6),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create New Account",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Please fill up all inputs to create a new account",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            //NAME
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 217, 217, 217),
                                hintText: "Enter your Email",
                                hintStyle: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 144, 129, 129),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Name",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            //USERNAME
                            TextFormField(
                              controller: _name,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 217, 217, 217),
                                hintText: "Enter your name",
                                hintStyle: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 144, 129, 129),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Phone",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            //PHONE
                            TextFormField(
                              controller: _phone,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 217, 217, 217),
                                hintText: "Enter your phone number",
                                hintStyle: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 144, 129, 129),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Password",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            //PASSWORD
                            TextFormField(
                              controller: _password,
                              obscureText: visibilty,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 217, 217, 217),
                                hintText: "Enter your password",
                                hintStyle: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 144, 129, 129),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visibilty = !visibilty;
                                    });
                                  },
                                  icon: Icon(visibilty
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            const SizedBox(height: 64),
                            SizedBox(
                              width: double.infinity,
                              height: 41,
                              child: ElevatedButton(
                                onPressed: () {
                                  RegisterHandler.register(context, _email.text, _name.text, _phone.text, _password.text);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 251, 133, 0),
                                  ),
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
