import 'package:flutter/material.dart';
import 'package:parish_app/presentation/bottomnavbar/pages/donation_page.dart';
import 'package:parish_app/presentation/bottomnavbar/pages/event_page.dart';
import 'package:parish_app/presentation/bottomnavbar/pages/home_page.dart';
import 'package:parish_app/presentation/bottomnavbar/pages/news_page.dart';
import 'package:parish_app/presentation/bottomnavbar/pages/profile_page.dart';
import 'package:parish_app/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var pages = [
    HomePage(),
    EventPage(),
    DonationPage(),
    NewsPage(),
    ProfilePage(),
  ];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: baseColorTwo,
        unselectedItemColor: baseColorOne,
        backgroundColor: Colors.black12,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: "Events",
            activeIcon: Icon(Icons.event),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share_location_rounded),
            label: "Donate",
            activeIcon: Icon(Icons.share_location_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
            activeIcon: Icon(Icons.newspaper_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.personal_injury_outlined),
            label: "Profile",
            activeIcon: Icon(Icons.personal_injury),
          ),
        ],
      ),
    );
  }
}
