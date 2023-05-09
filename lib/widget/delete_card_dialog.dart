import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

deleteCard(context, {required void Function() onPressed}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: wp(4, context),
        vertical: hp(2, context),
      ),
      title: const Text(
        "Delete this card?",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: COLOR_PRIMARY_DARK),
      ),
      content: Text(
        "Are you sure you want to delete this card?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: TextButtomWidget(
                height: hp(7, context),
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'Cancle',
                color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
              ),
            ),
            SizedBox(
              width: wp(4, context),
            ),
            Flexible(
              child: TextButtomWidget(
                height: hp(7, context),
                onPressed: onPressed,
                title: 'Delete',
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
