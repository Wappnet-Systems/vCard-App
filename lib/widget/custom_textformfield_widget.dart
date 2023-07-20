import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final Widget? customprefixicon;
  final TextEditingController textEditingController;
  final String? texteditinghinttext;
  final bool? customobscuretext;
  final bool? readOnly;
  final String? Function(String? value)? validationfunction;
  final Icon? customsuffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final String? labelText;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final InputBorder? border, focusedBorder, enabledBorder, errorBorder;
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.textInputType,
    this.customprefixicon,
    this.readOnly,
    required this.textEditingController,
    this.texteditinghinttext,
    this.customobscuretext,
    this.validationfunction,
    this.customsuffixIcon,
    this.textCapitalization,
    this.inputFormatters,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.contentPadding,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: TextInputAction.next,
      autocorrect: true,
      readOnly: readOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      style: style ?? textSmallTextStyle.copyWith(color: COLOR_PRIMARY_DARK),
      enableInteractiveSelection: true,
      cursorColor: COLOR_PRIMARY_DARK,
      controller: textEditingController,
      decoration: InputDecoration(
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
        labelText: labelText,
        labelStyle: textSmallTextStyle,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        hintText: texteditinghinttext,
        hintStyle: textSmallTextStyle,
        prefixIcon: customprefixicon,
        suffixIcon: customsuffixIcon,
      ),
      validator: validationfunction,
    );
  }
}
