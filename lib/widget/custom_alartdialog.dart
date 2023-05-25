import 'package:flutter/material.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../utils/constants_color.dart';

class CustomAlartDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Function()? onPressedNo;
  final Function()? onPressedYes;
  const CustomAlartDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onPressedNo,
      required this.onPressedYes});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      title: title,
      content: content,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButtomWidget(
              onPressed: onPressedNo!,
              title: 'No',
              fontSize: 15,
              color: blueColor,
            ),
            TextButtomWidget(
              onPressed: onPressedYes!,
              title: 'Yes',
              fontSize: 15,
              color: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
