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
  const CustomTextFormField(
      {super.key,
      required this.textInputType,
      required this.customprefixicon,
      required this.textEditingController,
      required this.texteditinghinttext,
      required this.customobscuretext,
      required this.validationfunction,
      required this.custominkwell,
      required this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        style: const TextStyle(color: Color(0xff000000)),
        obscureText: !customobscuretext,
        enableInteractiveSelection: false,
        cursorColor: PRIMARY_COLOR,
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
          hintText: texteditinghinttext,
          hintStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          prefixIcon: customprefixicon,
          suffixIcon: custominkwell,
        ),
        validator: validationfunction,
      ),
    );
  }
}
