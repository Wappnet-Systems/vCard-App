import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final TextEditingController textEditingController;
  final String texteditinghinttext;
  final bool customobscuretext;
  final String? Function(String? value)? validationfunction;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, minLines, maxLines;
  const CustomTextFormField({
    super.key,
    required this.textInputType,
    this.prefixIcon,
    required this.textEditingController,
    required this.texteditinghinttext,
    required this.customobscuretext,
    required this.validationfunction,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      style: const TextStyle(
        color: COLOR_PRIMARY_DARK,
        fontSize: 16,
      ),
      obscureText: !customobscuretext,
      enableInteractiveSelection: false,
      cursorColor: PRIMARY_COLOR,
      controller: textEditingController,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: BLUE_COLOR),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: BLUE_COLOR),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: wp(1, context),
          vertical: hp(3, context),
        ),
        hintText: texteditinghinttext,
        hintStyle: TextStyle(
          color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validationfunction,
      maxLength: maxLength,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
    );
  }
}
