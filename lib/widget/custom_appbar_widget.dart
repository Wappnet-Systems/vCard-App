import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(title),
      ),
      backgroundColor: Colors.transparent,
      leading: leading,
      actions: actions,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green.shade300, Colors.green],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}
