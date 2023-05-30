import 'package:flutter/material.dart';
import '../utils/constants.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? color;
  final double? fontSize;
  const TextButtomWidget(
      {super.key,
      required this.onPressed,
      this.fontSize,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Container(
            padding:
                const EdgeInsets.only(left: 29, right: 29, top: 15, bottom: 15),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Text(
              title!,
              style: TextStyle(color: whiteColor, fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }
}
