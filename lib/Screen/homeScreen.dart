import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/Handler/currencyFormat.dart';
import 'package:fun_play/Screen/profileUser.dart';
import 'package:fun_play/models/users_models.dart';
import 'package:fun_play/widgets/tabBar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<List> refresh() async {
  List listcok = [];
  return listcok;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 49, 19, 90),
        body: RefreshIndicator(
          onRefresh: () {
          setState(() {});
          return refresh();
        },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Text(
                              "Hello, ${User_models.name}",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Container(
                              height: 5,
                            ),
                            Text(
                              "What would you like \nto event today?",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser(),));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 31, bottom: 42),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(21)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/walletIcon.png" , scale: 2,),
                          Container(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(CurrencyFormat.convertToIdr(User_models.saldo, 0), style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 251, 133, 0)),),
                              Text("Your Balance", style: GoogleFonts.plusJakartaSans(fontSize: 14)),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Event Categories",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    TabBarButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        );
  }
}
