import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vcard/screens/card_screen.dart';
import 'package:vcard/screens/scanner_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import '../utils/constants_color.dart';
import 'contacts_screen.dart';
import 'create_card_screen.dart';

class Dashboardscreen extends StatefulWidget {
  final int index;
  const Dashboardscreen({super.key, required this.index});
  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  PageController? _myPage;
  int? _selectedIndex;
  bool value = false;

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
    _myPage = PageController(initialPage: _selectedIndex!);
  }

  void changeData() {
    setState(() {
      value = true;
    });
  }

  @override
  void dispose() {
    _myPage!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _selectedIndex = 0;
          _myPage!.jumpToPage(_selectedIndex!);
        });
        return false;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: bottomColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Spacer(),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.credit_card,
                  color: _selectedIndex == 0 ? whiteColor : blueColor,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    _myPage!.jumpToPage(_selectedIndex!);
                  });
                },
              ),
              const Spacer(),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: _selectedIndex == 1 ? whiteColor : blueColor,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                    _myPage!.jumpToPage(_selectedIndex!);
                  });
                },
              ),
              const Spacer(flex: 5),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.contacts_outlined,
                  color: _selectedIndex == 2 ? whiteColor : blueColor,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    _myPage!.jumpToPage(_selectedIndex!);
                  });
                },
              ),
              const Spacer(),
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.settings_outlined,
                  color: _selectedIndex == 3 ? whiteColor : blueColor,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                    _myPage!.jumpToPage(_selectedIndex!);
                  });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
        body: PageView(
          controller: _myPage,
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const <Widget>[
            Center(
              child: Cardscreen(),
            ),
            Center(
              child: Scannerscreen(),
            ),
            Center(
              child: ContactsScreen(),
            ),
            Center(
              child: Setting_Screen(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueColor,
          onPressed: () async {
            final refresh = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Createcardscreen()));
            log("refresh:$refresh");
            if (refresh == true) {
              changeData();
            }
          },
          child: const Icon(
            Icons.add,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
