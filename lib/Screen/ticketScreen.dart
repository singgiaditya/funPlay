import 'package:flutter/material.dart';
import 'package:fun_play/Handler/TicketHandler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/ticket.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 19, 90),
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 24,),
              Text("My Ticket", style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
              Container(height: 20,),
              FutureBuilder(
                future: TicketHandler.getTicket(),
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Ada Kesalahan");
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Ticket(barcode: snapshot.data![index]['barcode'], data: snapshot.data![index]['jenis']),
                              Container(height: 20,)
                            ],
                          );
                        },
                      );
  }}),
              Container(
                height: 20,
              )
            ],
          ),
        ),
      ),),
    );
  }
}