import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcard/widget/text_button_widget.dart';

import '../utils/constants_color.dart';

class AlartDialogWidget extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  AlartDialogWidget(
      {required this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: <Widget>[],
    );
  }
}
