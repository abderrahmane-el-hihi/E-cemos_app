import 'package:cemos_app/Calendrier.dart';
import 'package:flutter/material.dart';

import 'HomePage2.dart';
import 'Demande.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorColor: Color.fromRGBO(131, 172, 64, 1),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home_rounded),
              text: "Accueil",
            ),
            Tab(
              icon: Icon(Icons.edit_note_rounded),
              text: "Demande",
            ),
            Tab(
              icon: Icon(Icons.edit_calendar_rounded),
              text: "Calendrier",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            HomePage2(),
            DemandePage(),
            CalendarPAge(),
          ],
        ),
      ),
    );
  }
}
