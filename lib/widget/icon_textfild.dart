// ignore_for_file: unnecessary_new
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants_color.dart';
import 'custom_textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'text_button_widget.dart';

class IconTextField extends StatefulWidget {
  final Icon? icon;
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validationfunction;
  IconTextField(
      {super.key,
      required this.icon,
      required this.hint,
      required this.textInputType,
      required this.validationfunction,
      required this.textEditingController});

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
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            CustomTextFormField(
                textInputType: widget.textInputType!,
                textEditingController: widget.textEditingController!,
                texteditinghinttext: widget.hint!,
                customobscuretext: true,
                custominkwell: null,
                customprefixicon: widget.icon,
                validationfunction: widget.validationfunction),
            SizedBox(height: 30),
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
                              print(widget.textEditingController?.text);
                              Navigator.pop(context, true);
                              displayCustomToast();
                            } catch (e) {
                              return null;
                            }
                          }
                        });
                      },
                      title: 'Save',
                      color: PRIMARY_COLOR,
                    ),
                    TextButtomWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancle',
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
        style: TextStyle(color: PRIMARY_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
    
//     Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               SizedBox(height: 300),
//               CustomTextFormField(
//                 textInputType: widget.textInputType!,
//                 textEditingController: widget.textEditingController!,
//                 texteditinghinttext: widget.hint!,
//                 customobscuretext: true,
//                 custominkwell: null,
//                 customprefixicon: widget.icon,
//                 validationfunction: (value) {
//                   widget.validationfunction;
//                 },
//               ),
//               SizedBox(height: 30),
//               SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: PRIMARY_COLOR,
//                       ),
//                       child: TextButton(
//                           onPressed: () {
//                             setState(() {
//                               print(widget.textEditingController?.text);
//                               Navigator.pop(context, true);
//                             });
//                           },
//                           child: Text("Save",
//                               style: TextStyle(
//                                 color: Color(0xfffefefd),
//                                 fontSize: 17,
//                               ))))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
