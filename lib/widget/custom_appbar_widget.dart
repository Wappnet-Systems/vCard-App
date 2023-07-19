import 'package:flutter/material.dart';

class Customappbarwidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  final Widget leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? leadingWidth;
  const Customappbarwidget(
      {super.key,
      required this.title,
      this.actions,
      required this.leading,
      this.centerTitle,
      this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      centerTitle: centerTitle ?? true,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          title,
        ),
      ),
      leadingWidth: leadingWidth,
      leading: leading,
      actions: actions,
    );
  }
}
