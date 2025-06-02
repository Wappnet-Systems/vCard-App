import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class ButtonWithIcon extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final Widget? icon;
  final double? width;
  const ButtonWithIcon({
    super.key,
    this.onTap,
    this.text,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(1, context),
        ),
        decoration: BoxDecoration(
          color: COLOR_PRIMARY_DARK,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            SizedBox(
              width: wp(5, context),
            ),
            Text(
              "$text",
              style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
            )
          ],
        ),
      ),
    );
  }
}
