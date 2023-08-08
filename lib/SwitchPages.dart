import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Calendrier.dart';
import 'HomePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'ProfilePage.dart';

class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabActiveBorder: Border.all(color: Colors.green.shade400, width: 0.5),
      backgroundColor: Colors.grey.shade100,
      hoverColor: Colors.grey[100]!,
      activeColor: Colors.green.shade400,
      textStyle: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.green.shade400,
        fontSize: 12,
      ),
      tabBackgroundColor: const Color.fromARGB(25, 102, 187, 106),
      color: const Color.fromARGB(255, 143, 143, 143),
      gap: 8,
      iconSize: 24,
      tabMargin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      onTabChange: (value) => onTabChange!(value),
      tabs: [
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: CupertinoIcons.calendar,
          text: 'Calendrier',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: Icons.home_rounded,
          text: 'Accueil',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: CupertinoIcons.person,
          text: 'Profil',
        ),
      ],
    );
  }
}

class SwitchPages extends StatefulWidget {
  final pagenum;
  const SwitchPages({super.key, this.pagenum});

  @override
  State<SwitchPages> createState() => _SwitchPAgesState();
}

class _SwitchPAgesState extends State<SwitchPages> {
  int _selectedIndex = 0;

  void Change(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const CalendarPage(),
    const HomePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: GNavBar(onTabChange: (index) => Change(index)),
      body: pages[_selectedIndex],
    );
  }
}

// class SwitchPages extends StatefulWidget {
//   final int pagenum; // Add the required variable here

//   const SwitchPages({super.key, required this.pagenum});

//   @override
//   State<SwitchPages> createState() => _SwitchPagesState();
// }

// class _SwitchPagesState extends State<SwitchPages> {
//   int _selectedIndex = 0;

//   void Change(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   List<Widget> pages = [HomePage(), CalendarPage(), ProfilePage()];

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex =
//         widget.pagenum; // Initialize the _selectedIndex with the provided value
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       bottomNavigationBar: GNavBar(onTabChange: (index) => Change(index)),
//       body: pages[_selectedIndex],
//     );
//   }
// }
