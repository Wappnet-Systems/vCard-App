import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcard/screens/scanner_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import '../utils/constants_color.dart';
import 'cardscreen.dart';
import 'contacts_screen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int indexx = 0;

  List<Widget> _widgetOptions = <Widget>[
    Cardscreen(),
    Scannerscreen(),
    ContactsScreen(),
    Setting_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: _widgetOptions.elementAt(indexx),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: PRIMARY_COLOR,
        selectedItemColor: BLUE_COLOR,
        selectedIconTheme: IconThemeData(color: BLUE_COLOR),
        unselectedItemColor: WHITE_COLOR,
        unselectedIconTheme: IconThemeData(color: WHITE_COLOR),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: indexx,
        onTap: (int index) async {
          setState(() {
            indexx = index;
          });
        },
      ),
    );
  }
}
