import 'package:flutter/material.dart';
import 'package:fun_play/Screen/detail.dart';
import 'package:fun_play/models/event_models.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatefulWidget {
  EventCard({super.key, required this.data, required this.callback, required this.canCallback});
  final int data;
  Function callback;
  final bool canCallback;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailEvent(data: widget.data),));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9),
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
                color: Event_Models.listEvent[widget.data].favorite? Color.fromARGB(255, 81, 196, 225) : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      Event_Models.listEvent[widget.data].favorite = !Event_Models.listEvent[widget.data].favorite;
                      if (Event_Models.listEvent[widget.data].favorite) {
                        Event_Models.listFavorite.add(widget.data);
                      }else{
                        Event_Models.listFavorite.remove(widget.data);
                        if (widget.canCallback) {
                          widget.callback(Event_Models.listEvent[widget.data].favorite, widget.data);
                        }
                      }
                    });
                  }, icon: Image.asset("assets/bookmarkIcon.png")),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13),
              height: 66,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 217, 217),
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
                            color: Color.fromARGB(255, 144, 129, 129)),
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
                        Text("${Event_Models.listEvent[widget.data].bulan}",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: Color.fromARGB(255, 144, 129, 129))),
                        Text("${Event_Models.listEvent[widget.data].tanggal}",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: Color.fromARGB(255, 251, 134, 0)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 21,
            )
          ],
        ),
      ),
    );
  }
}
