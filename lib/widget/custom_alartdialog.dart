import 'package:flutter/material.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';

class CustomAlartDialog extends StatelessWidget {
  final Widget? title;
  final String? buttontitle;
  final double? fontSize;
  final int? itemCount;
  final Axis? scrollDirection;
  final Widget? Function(BuildContext, int) itemBuilder;
  final SliverGridDelegate? gridDelegate;
  const CustomAlartDialog(
      {super.key,
      required this.title,
      this.buttontitle,
      this.fontSize,
      this.itemCount,
      this.scrollDirection,
      required this.itemBuilder,
      this.gridDelegate});

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
      content: SizedBox(
        height: hp(30, context),
        width: wp(50, context),
        child: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return GridView.builder(
              scrollDirection: scrollDirection!,
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              gridDelegate: gridDelegate!,
            );
          },
        ),
      ),
      actions: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButtomWidget(
            color: blueColor,
            fontSize: fontSize,
            onPressed: () {
              Navigator.pop(context);
            },
            title: buttontitle,
          ),
        ])
      ],
    );
  }
}
