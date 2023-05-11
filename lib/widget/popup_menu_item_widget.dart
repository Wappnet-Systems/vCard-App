import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

popUpMenuItem(context,
    {int? value, Icon? icon, String? title, Color? textColor}) {
  return PopupMenuItem(
    value: value,
    height: hp(6, context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon!,
        SizedBox(
          width: wp(2, context),
        ),
        Text(
          "$title",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor ?? COLOR_PRIMARY_LIGHT.withOpacity(0.8),
          ),
        )
      ],
    ),
  );
}
