import 'package:flutter/material.dart';
import 'package:fun_play/Handler/TicketHandler.dart';
import 'package:fun_play/Handler/currencyFormat.dart';
import 'package:fun_play/models/event_models.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailEvent extends StatefulWidget {
  DetailEvent({super.key, required this.data});
  final int data;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 19, 90),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, top: 36, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 35, 37, 96),
                ),
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
              Text(
                "Detail Event",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(horizontal: 9),
                height: 325,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('${Event_Models.listEvent[widget.data].image}').image,
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(21)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 11,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/save-add.png",
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      height: 66,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Event_Models.listEvent[widget.data].eventName}",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${Event_Models.listEvent[widget.data].tempat}",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    color: const Color.fromARGB(
                                        255, 144, 129, 129)),
                              )
                            ],
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Event_Models.listEvent[widget.data].bulan}",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 144, 129, 129),
                                  ),
                                ),
                                Text(
                                  "${Event_Models.listEvent[widget.data].tanggal}",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color:
                                        const Color.fromARGB(255, 251, 134, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 21,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 17),
              Text(
                "About Event",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${Event_Models.listEvent[widget.data].deskripsi}",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 19),
              Text(
                "Price Ticket",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 47,
                width: 258,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 58, 33, 131),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "${CurrencyFormat.convertToIdr(Event_Models.listEvent[widget.data].harga_diskon, 0)}",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 251, 133, 0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Text(
                          "${CurrencyFormat.convertToIdr(Event_Models.listEvent[widget.data].harga_asli, 0)}",
                          style: GoogleFonts.plusJakartaSans(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 217, 217, 217)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  TicketHandler.buy(context, widget.data, Event_Models.listEvent[widget.data].tempat, Event_Models.listEvent[widget.data].harga_diskon);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 101, 54, 242),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/receive-square.png"),
                      const SizedBox(width: 6),
                      Text(
                        "Buy Ticket",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
