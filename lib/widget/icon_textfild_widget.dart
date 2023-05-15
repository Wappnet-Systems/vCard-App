import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants_color.dart';
import 'custom_textformfield_widget.dart';
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
            const SizedBox(width: double.infinity),
            CustomTextFormField(
                inputFormatters: widget.inputFormatters,
                textInputType: widget.textInputType!,
                textEditingController: widget.textEditingController!,
                texteditinghinttext: widget.hint!,
                customobscuretext: true,
                custominkwell: null,
                customprefixicon: widget.icon,
                validationfunction: widget.validationfunction),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButtomWidget(
                      onPressed: () {
                        setState(() {
                          if (_formfield.currentState!.validate()) {
                            try {
                              Navigator.pop(context, true);
                              displayCustomToast();
                            } catch (e) {
                              return;
                            }
                          }
                        });
                      },
                      title: 'Save',
                      fontSize: 15,
                      color: BLUE_COLOR,
                    ),
                    TextButtomWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancle',
                      fontSize: 13,
                      color: Colors.redAccent,
                    )
                  ],
                )),
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
        style: const TextStyle(color: BLUE_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
