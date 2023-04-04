import 'package:flutter/material.dart';

import '../screens/create_card_screen.dart';
import '../utils/constants_color.dart';

class Customfloatingbuttom extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  Customfloatingbuttom() : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        child: Icon(Icons.add, color: WHITE_COLOR),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => Createcardscreen())));
        });
  }
}
