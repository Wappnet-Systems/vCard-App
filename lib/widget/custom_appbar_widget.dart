import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants_color.dart';

class Customappbarwidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  final Widget leading;
  final List<Widget>? actions;
  const Customappbarwidget({
    super.key,
    required this.title,
    this.actions,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: const TextStyle(color: blackColor),
        ),
      ),
      backgroundColor: whiteColor,
      leading: leading,
      actions: actions,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
