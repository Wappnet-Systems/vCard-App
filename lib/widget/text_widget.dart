import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  final double? width;
  final TextAlign? textAlign;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? selectionColor;
  final int? maxLines;
  const Textwidget(
      {super.key,
      this.maxLines,
      this.width,
      this.fontWeight,
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
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize, color: selectionColor, fontWeight: fontWeight),
      ),
    );
  }
}
