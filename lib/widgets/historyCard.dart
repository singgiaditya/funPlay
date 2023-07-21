import 'package:flutter/material.dart';
import 'package:fun_play/Handler/currencyFormat.dart';
import 'package:fun_play/models/event_models.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key, required this.jenis, required this.jam});
  final int jenis;
  final String jam;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  String getIcon(int jenis){
    switch (jenis) {
      case 0:
        return "assets/arcadeIcon.png";
      case 1:
        return "assets/billiardIcon.png";
      case 2:
        return "assets/karaokeIcon.png";
      default:
        return "";
    }
  }
  @override
  Widget build(BuildContext context) { 
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.white, width: 0.5)),
        gradient: LinearGradient(
          colors: [Color.fromARGB(50, 0, 0, 0), Color.fromARGB(255, 57, 33, 129)],
          stops: [0, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      
      ),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(getIcon(widget.jenis), scale: 2,),
                Container(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${Event_Models.listEvent[widget.jenis].eventName}", style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 16),),
                    Text("${Event_Models.listEvent[widget.jenis].tempat}", style: GoogleFonts.plusJakartaSans(color: Colors.white),),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("-${CurrencyFormat.convertToIdr(Event_Models.listEvent[widget.jenis].harga_diskon, 2)}", style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 16),),
                Text("${widget.jam} WIB", style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 12),)
              ],
            )
          ],
        ),
      ),
    );
  }
}