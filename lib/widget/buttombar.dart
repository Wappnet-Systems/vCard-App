import 'package:flutter/material.dart';
import '../utils/constants_color.dart';

class CustomButtomBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  CustomButtomBar(this.title) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: PRIMARY_COLOR,
      child: Row(
        children: [
          SizedBox(width: 15),
          Container(
            height: MediaQuery.of(context).size.height * .09,
            child: Column(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add_card,
                      color: WHITE_COLOR,
                    ),
                    onPressed: () {}),
                Text(
                  "Card",
                  style: TextStyle(color: WHITE_COLOR),
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            height: MediaQuery.of(context).size.height * .09,
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.photo_camera, color: WHITE_COLOR),
                    onPressed: () {}),
                Text(
                  "scan",
                  style: TextStyle(color: WHITE_COLOR),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * .09,
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.contacts, color: WHITE_COLOR),
                    onPressed: () {}),
                Text(
                  "Contacts",
                  style: TextStyle(color: WHITE_COLOR),
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            height: MediaQuery.of(context).size.height * .09,
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.more, color: WHITE_COLOR),
                    onPressed: () {}),
                Text(
                  "More",
                  style: TextStyle(color: WHITE_COLOR),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 7,
    );
  }
}
