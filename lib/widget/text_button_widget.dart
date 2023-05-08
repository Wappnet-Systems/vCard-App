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
  final bool isLoading;
  const TextButtomWidget({
    super.key,
    required this.onPressed,
    this.textStyle,
    required this.title,
    this.color,
    this.fontSize,
    this.width,
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
                ? PRIMARY_COLOR.withOpacity(0.5)
                : PRIMARY_COLOR.withOpacity(0.5)
            : color ?? PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: width ?? wp(80, context),
        height: height,
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
                child: Text(
                  "$title",
                  style: textStyle ??
                      TextStyle(color: WHITE_COLOR, fontSize: fontSize ?? 16),
                ),
              ),
      ),
    );
  }
}
