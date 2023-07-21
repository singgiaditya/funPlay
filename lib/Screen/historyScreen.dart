import 'package:flutter/material.dart';
import 'package:fun_play/Handler/HistoryHandler.dart';
import 'package:fun_play/widgets/historyCard.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 49, 19, 90),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 24, bottom: 24),
                  child: Text(
                    "History",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Today",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: HistoryHandler.History.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryCard(jenis: HistoryHandler.History[index]['jenis'], jam: HistoryHandler.History[index]['jam']);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
