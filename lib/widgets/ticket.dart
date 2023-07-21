import 'package:flutter/material.dart';
import 'package:fun_play/Handler/currencyFormat.dart';
import 'package:fun_play/models/event_models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key, required this.barcode, required this.data});
  final String barcode;
  final int data;

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 57, 33, 129),
            borderRadius: BorderRadius.circular(26)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 287,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${Event_Models.listEvent[widget.data].image}"), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(26)
                ),
              ),
              Text("${Event_Models.listEvent[widget.data].eventName}", style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 57, 33, 129),
            borderRadius: BorderRadius.circular(26)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location", style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white),),
                  Text("${Event_Models.listEvent[widget.data].tempat}", style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date", style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white),),
                  Text("${Event_Models.listEvent[widget.data].tanggal} ${Event_Models.listEvent[widget.data].bulan} 2023", style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Price", style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white),),
                  Text("${CurrencyFormat.convertToIdr(Event_Models.listEvent[widget.data].harga_diskon, 0)}", style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 57, 33, 129),
            borderRadius: BorderRadius.circular(26)
          ),
          child: Column(
            children: [
              Text("Scan Barcode", style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white),),
              Container(height: 5,),
              SizedBox(
                height: 100,
                child: SfBarcodeGenerator(value: "${widget.barcode}", symbology: Code128(), barColor: Colors.white,)),
                Container(height: 10,)
            ],
          ),
        )
      ],
    );
  }
}