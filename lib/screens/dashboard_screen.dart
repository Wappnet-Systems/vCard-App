import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vcard/screens/scanner_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'card_screen.dart';
import 'contacts_screen.dart';
import 'create_card_screen.dart';

class Dashboardscreen extends StatefulWidget {
  final int index;
  const Dashboardscreen({super.key, required this.index});
  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int _selectedIndex = 0;
  Widget? currentScreen;
  bool value = false;
  late PageStorageBucket pageBucket;

  @override
  void initState() {
    pageBucket = PageStorageBucket();
    _selectedIndex = widget.index;
    super.initState();
  }

  void changeData() {
    setState(() {
      value = true;
    });
  }

  // screen list
  final screen = [
    const Cardscreen(),
    const Scannerscreen(),
    const ContactsScreen(),
    const Setting_Screen()
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageStorage(
          bucket: pageBucket,
          child: currentScreen = screen[_selectedIndex],
        ),
        bottomNavigationBar: BottomAppBar(
          color: COLOR_PRIMARY,
          shape: const CircularNotchedRectangle(),
          padding: EdgeInsets.symmetric(
            horizontal: wp(3, context),
          ),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.credit_card,
                  color: _selectedIndex == 0 ? COLOR_WHITE : COLOR_PRIMARY_DARK,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    currentScreen = screen[0];
                  });
                },
              ),
              const Spacer(),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: _selectedIndex == 1 ? COLOR_WHITE : COLOR_PRIMARY_DARK,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                    currentScreen = screen[1];
                  });
                },
              ),
              const Spacer(flex: 5),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.contacts_outlined,
                  color: _selectedIndex == 2 ? COLOR_WHITE : COLOR_PRIMARY_DARK,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    currentScreen = screen[2];
                  });
                },
              ),
              const Spacer(),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.settings_outlined,
                  color: _selectedIndex == 3 ? COLOR_WHITE : COLOR_PRIMARY_DARK,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                    currentScreen = screen[3];
                  });
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: COLOR_PRIMARY_DARK,
          onPressed: () async {
            final refresh = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Createcardscreen(),
              ),
            );
            if (refresh == true) {
              changeData();
            }
          },
          child: const Icon(
            Icons.add,
            size: 30,
            color: COLOR_WHITE,
          ),
        ),
      ),
    );
  }
}
