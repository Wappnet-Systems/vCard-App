import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? width;
  final bool? isLoading;
  const TextButtomWidget(
      {super.key,
      required this.onPressed,
      this.fontSize,
      this.height,
      this.width,
      this.isLoading = false,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: height ?? hp(7, context),
        padding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(1, context),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isLoading == true
            ? SizedBox(
                height: hp(4, context),
                width: wp(7, context),
                child: const CircularProgressIndicator(
                  color: COLOR_WHITE,
                  strokeWidth: 3,
                ),
              )
            : Text(
                "$title",
                textAlign: TextAlign.center,
                style: textMediumTextStyle.copyWith(
                    color: COLOR_WHITE,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize),
              ),
      ),
    );
  }
}
