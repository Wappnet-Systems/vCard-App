import 'package:flutter/material.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import '../screens/contacts_screen.dart';
import '../screens/scanner_screen.dart';
import '../utils/constants_color.dart';

class CustomButtomBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  CustomButtomBar(this.title) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            SizedBox(width: 20),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboardscreen()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.add_card,
                      color: WHITE_COLOR,
                    ),
                    Text(
                      "Card",
                      style: TextStyle(color: WHITE_COLOR),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 45),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scannerscreen()));
                },
                child: Column(
                  children: [
                    Icon(Icons.photo_camera, color: WHITE_COLOR),
                    Text(
                      "scan",
                      style: TextStyle(color: WHITE_COLOR),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactsScreen()));
                },
                child: Column(
                  children: [
                    Icon(Icons.contacts, color: WHITE_COLOR),
                    Text(
                      "Contacts",
                      style: TextStyle(color: WHITE_COLOR),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Icon(Icons.more, color: WHITE_COLOR),
                    Text(
                      "More",
                      style: TextStyle(color: WHITE_COLOR),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 7,
    );
  }
}
