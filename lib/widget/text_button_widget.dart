import 'package:flutter/material.dart';
import '../utils/constants_color.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? color;
  final double? fontSize;
  const TextButtomWidget(
      {super.key,
      required this.onPressed,
      required this.fontSize,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.all(14),
            color: color,
            child: Text(
              title!,
              style: TextStyle(color: WHITE_COLOR, fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }
}
