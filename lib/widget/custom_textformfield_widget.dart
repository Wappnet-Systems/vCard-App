import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/constants_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final Icon? customprefixicon;
  final TextEditingController textEditingController;
  final String texteditinghinttext;
  final bool customobscuretext;
  final String? Function(String? value)? validationfunction;
  final Icon? customsuffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.textInputType,
      required this.customprefixicon,
      required this.textEditingController,
      required this.texteditinghinttext,
      required this.customobscuretext,
      required this.validationfunction,
      required this.customsuffixIcon,
      required this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        autocorrect: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        style: const TextStyle(color: blackColor, fontSize: 12),
        obscureText: !customobscuretext,
        enableInteractiveSelection: true,
        cursorColor: blueColor,
        controller: textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          labelStyle: const TextStyle(color: blackColor),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: blackColor)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
          hintText: texteditinghinttext,
          hintStyle: const TextStyle(
            color: grayColor,
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
          prefixIcon: customprefixicon,
          suffixIcon: customsuffixIcon,
        ),
        validator: validationfunction,
      ),
    );
  }
}
