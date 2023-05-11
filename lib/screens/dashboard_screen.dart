import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vcard/screens/card_screen.dart';
import 'package:vcard/screens/create_card_screen.dart';
import 'package:vcard/screens/scanner_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import 'package:vcard/utils/responsive.dart';
import '../utils/style.dart';
import 'contacts_screen.dart';

class Dashboardscreen extends StatefulWidget {
  final int? index;
  const Dashboardscreen({super.key, this.index});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int? indexx;
  int currentTab = 0;

  late PageStorageBucket pageStorageBucket;
  late Widget currentScreen;

  List<Widget> screens = <Widget>[
    const Cardscreen(),
    const Scannerscreen(),
    const ContactsScreen(),
    const SettingScreen()
  ];
  @override
  void initState() {
    indexx = widget.index;
    pageStorageBucket = PageStorageBucket();
    if (indexx != null) {
      currentTab = indexx!;
      currentScreen = screens[indexx!];
    } else {
      log("yes");
      currentScreen = screens[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: pageStorageBucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: WHITE_COLOR,
          border: Border.all(color: WHITE_COLOR, width: 2),
        ),
        child: FloatingActionButton(
          backgroundColor: COLOR_PRIMARY_DARK,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Createcardscreen(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
            color: WHITE_COLOR,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
            color: PRIMARY_COLOR,
            notchMargin: 2.0,
            shape: const CircularNotchedRectangle(),
            padding: EdgeInsets.symmetric(
              horizontal: wp(6, context),
            ),
            height: hp(7, context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                      log("currentTab:$currentTab");
                      currentScreen = screens[0];
                    });
                  },
                  child: Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: currentTab == 0
                        ? COLOR_PRIMARY_DARK
                        : COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 1;
                      log("currentTab:$currentTab");
                      currentScreen = screens[1];
                    });
                  },
                  child: Icon(
                    Icons.camera,
                    size: 25,
                    color: currentTab == 1
                        ? COLOR_PRIMARY_DARK
                        : COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: wp(12, context),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 2;
                        log("currentTab:$currentTab");
                        currentScreen = screens[2];
                      });
                    },
                    child: Icon(
                      Icons.account_box_rounded,
                      size: 25,
                      color: currentTab == 2
                          ? COLOR_PRIMARY_DARK
                          : COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 3;
                      log("currentTab:$currentTab");
                      currentScreen = screens[3];
                    });
                  },
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: currentTab == 3
                        ? COLOR_PRIMARY_DARK
                        : COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
