import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constants_color.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? color;

  TextButtomWidget(
      {required this.onPressed, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.all(14),
            color: color,
            child: Text(
              title!,
              style: TextStyle(color: WHITE_COLOR),
            ),
          ),
        ),
      ],
    );
  }
}
