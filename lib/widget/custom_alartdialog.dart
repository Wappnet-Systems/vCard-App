import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class CustomAlartDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Function() onPressedNo;
  final Function() onPressedYes;
  final List<Widget>? actions;
  const CustomAlartDialog({
    super.key,
    this.actions,
    required this.title,
    required this.content,
    required this.onPressedNo,
    required this.onPressedYes,
  });

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
      iconPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.symmetric(
          vertical: hp(2, context), horizontal: wp(4, context)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: wp(4, context),
      ),
      actionsPadding: EdgeInsets.only(
        left: wp(4, context),
        right: wp(4, context),
        bottom: hp(1, context),
        top: hp(1, context),
      ),
      content: content,
      actions: actions ??
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TextButtomWidget(
                    onPressed: onPressedNo,
                    title: 'No',
                    height: hp(6, context),
                    color: COLOR_PRIMARY_DARK,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButtomWidget(
                    onPressed: onPressedYes,
                    title: 'Yes',
                    height: hp(6, context),
                    color: COLOR_PRIMARY,
                  ),
                ),
              ],
            ),
          ],
    );
  }
}
