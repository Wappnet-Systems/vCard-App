import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/scanner_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import '../utils/constants_color.dart';
import 'card_screen.dart';
import 'contacts_screen.dart';

class Dashboardscreen extends StatefulWidget {
  int index;
  Dashboardscreen({super.key, required this.index});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int? indexx;

  final List<Widget> _widgetOptions = <Widget>[
    const Cardscreen(),
    Scannerscreen(),
    const ContactsScreen(),
    const Setting_Screen()
  ];
  @override
  void initState() {
    indexx = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            showCloseIcon: true,
            desc: "Exit",
            btnCancelOnPress: () async {},
            btnOkOnPress: () async {
              exit(0);
            }).show();
        return shouldPop;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(indexx!),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              gradient: LinearGradient(
                  colors: [Colors.green, Colors.green.shade300],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: WHITE_COLOR,
            selectedIconTheme: const IconThemeData(color: WHITE_COLOR),
            unselectedItemColor: BLUE_COLOR,
            unselectedIconTheme: const IconThemeData(color: BLUE_COLOR),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts_outlined),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
            currentIndex: indexx!,
            onTap: (int index) async {
              setState(() {
                indexx = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
