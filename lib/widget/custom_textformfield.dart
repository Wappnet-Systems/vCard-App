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
  final InkWell? custominkwell;
  final List<TextInputFormatter>? inputFormatters;
  CustomTextFormField(
      {required this.textInputType,
      required this.customprefixicon,
      required this.textEditingController,
      required this.texteditinghinttext,
      required this.customobscuretext,
      required this.validationfunction,
      required this.custominkwell,
      required this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      style: TextStyle(color: Color(0xff000000)),
      obscureText: !customobscuretext,
      cursorColor: PRIMARY_COLOR,
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: PRIMARY_COLOR),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        hintText: texteditinghinttext,
        hintStyle: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        prefixIcon: customprefixicon,
        suffixIcon: custominkwell,
      ),
      validator: validationfunction,
    );
  }
}
