import 'package:flutter/material.dart';
import 'package:fun_play/Screen/bookmarkScreen.dart';
import 'package:fun_play/Screen/historyScreen.dart';
import 'package:fun_play/Screen/homeScreen.dart';
import 'package:fun_play/Screen/ticketScreen.dart';
import 'package:google_fonts/google_fonts.dart';



class NavBar extends StatefulWidget {
  const NavBar({super.key});


  @override
  State<NavBar> createState() =>
      _NavBarState();
}

class _NavBarState
    extends State<NavBar> {
  static int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookmarksScreen(),
    HistoryScreen(),
    TicketScreen()
  ];

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 101, 54, 242),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/homeIcon_unselected.png", scale: 2,),
              activeIcon: Image.asset("assets/homeIcon_selected.png", scale: 2,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/bookmarksIcon_unselected.png", scale: 2,),
              activeIcon: Image.asset("assets/bookmarksIcon_selected.png", scale: 2,),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/historyIcon_unselected.png", scale: 2,),
              activeIcon: Image.asset("assets/histroyIcon_selected.png", scale: 2,),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/ticketIcon_unselected.png", scale: 2,),
              activeIcon: Image.asset("assets/ticketIcon_selected.png", scale: 2,),
              label: 'Ticket',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 233, 248, 251),
          unselectedItemColor: Color.fromARGB(255, 153, 153, 153),
          selectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10),
          unselectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}