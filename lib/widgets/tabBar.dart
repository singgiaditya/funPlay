import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fun_play/Screen/detail.dart';
import 'package:fun_play/models/event_models.dart';
import 'package:fun_play/widgets/eventCard.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({super.key});

  void updateScreen(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      height: 442,
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ButtonsTabBar(
              backgroundColor: Color.fromARGB(255, 251, 133, 0),
              unselectedBackgroundColor: Color.fromARGB(255, 217, 217, 217),
              unselectedLabelStyle: TextStyle(color: Colors.black),
              radius: 20,
              borderColor: Colors.white,
              borderWidth: 1,
              unselectedBorderColor: Colors.white,
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Image.asset(
                        'assets/arcadeIcon.png',
                        scale: 2.5,
                      )),
                  text: " Arcade  ",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/billiardIcon.png',
                    scale: 2,
                  ),
                  text: " Billiard  ",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/karaokeIcon.png',
                    scale: 2,
                  ),
                  text: " Karaoke  ",
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Event",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all',
                                style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                      EventCard(data: 0, callback: updateScreen, canCallback: false,)
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Event",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all',
                                style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                      EventCard(data: 1, callback: updateScreen, canCallback: false,)
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Event",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all',
                                style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                      EventCard(data: 2, callback: updateScreen, canCallback: false,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
