import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_textformfield_widget.dart';
import '../utils/style.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'text_button_widget.dart';

class IconTextField extends StatefulWidget {
  final Icon? icon;
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validationfunction;
  final List<TextInputFormatter>? inputFormatters;
  const IconTextField(
      {super.key,
      required this.icon,
      required this.hint,
      required this.textInputType,
      required this.validationfunction,
      required this.textEditingController,
      required this.inputFormatters});

  @override
  State<IconTextField> createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  FToast? fToast;
  final _formfield = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.hint!),
      content: Form(
        key: _formfield,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              inputFormatters: widget.inputFormatters,
              textInputType: widget.textInputType!,
              textEditingController: widget.textEditingController!,
              texteditinghinttext: widget.hint!,
              customobscuretext: true,
              prefixIcon: widget.icon,
              validationfunction: widget.validationfunction,
            ),
            SizedBox(
              height: hp(4, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: TextButtomWidget(
                    height: hp(6, context),
                    onPressed: () {
                      setState(() {
                        if (_formfield.currentState!.validate()) {
                          try {
                            print(widget.textEditingController?.text);
                            Navigator.pop(context, true);
                            displayCustomToast();
                          } catch (e) {
                            log("Error:$e");
                          }
                        }
                      });
                    },
                    title: 'Save',
                    fontSize: 14,
                    color: PRIMARY_COLOR,
                  ),
                ),
                SizedBox(
                  width: wp(4, context),
                ),
                Flexible(
                  child: TextButtomWidget(
                    height: hp(6, context),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Cancle',
                    fontSize: 14,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: WHITE_COLOR,
      ),
      child: Text(
        "Add Successfully ${widget.hint!}",
        style: TextStyle(color: PRIMARY_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
