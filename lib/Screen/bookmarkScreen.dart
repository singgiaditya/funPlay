import 'package:flutter/material.dart';
import 'package:fun_play/widgets/eventCard.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/event_models.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  void updateList(bool isFavorite, int index){
    setState(() {
      if(isFavorite == false){
        Event_Models.listFavorite.remove(index);
      }
    });
  }
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
              Text("Bookmark", style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
              Container(height: 6,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Event_Models.listFavorite.length,

                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: EventCard(data: Event_Models.listFavorite[index], callback: updateList, canCallback: true,),
                  );
                },
              ),
            ],
          ),
        ),
      ),),
    );
  }
}