import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  final double? width;
  final TextAlign? textAlign;
  final String? text;
  final double? fontSize;
  final Color? selectionColor;
  const Textwidget(
      {super.key,
      required this.width,
      required this.textAlign,
      required this.text,
      this.fontSize,
      this.selectionColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, color: selectionColor),
      ),
    );
  }
}
