import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? color;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? fontSize;
  final Widget? icon;
  final bool isLoading;
  const TextButtomWidget({
    super.key,
    required this.onPressed,
    this.textStyle,
    required this.title,
    this.color,
    this.fontSize,
    this.width,
    this.icon,
    this.height,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isLoading
            ? color != null
                ? COLOR_PRIMARY_DARK
                : COLOR_PRIMARY_DARK
            : color ?? COLOR_PRIMARY_DARK,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: width ?? wp(80, context),
        height: height ?? hp(7.5, context),
        child: isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(
                  vertical: hp(1, context),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: PRIMARY_COLOR,
                  ),
                ),
              )
            : TextButton(
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          TextStyle(
                              color: WHITE_COLOR, fontSize: fontSize ?? 16),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
