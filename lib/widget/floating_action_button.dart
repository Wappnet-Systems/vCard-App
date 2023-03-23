import 'package:flutter/material.dart';

import '../utils/constants_color.dart';

class Customfloatingbuttom extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  Customfloatingbuttom(this.title) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        child: Icon(Icons.add, color: WHITE_COLOR),
        onPressed: () {});
  }
}
