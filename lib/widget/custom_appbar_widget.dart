import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/app_shere_screen.dart';
import '../utils/constants_color.dart';

class Customappbarwidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  final Widget leading;
  final List<Widget>? actions;
  const Customappbarwidget(
      {super.key,
      required this.title,
      required this.actions,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text(title),
      backgroundColor: Colors.transparent,
      leading: leading,
      actions: actions,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
                colors: [Colors.green, PRIMARY_COLOR],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}
