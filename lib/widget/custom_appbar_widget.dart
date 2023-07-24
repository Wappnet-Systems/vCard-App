import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class Customappbarwidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? leadingWidth;
  const Customappbarwidget(
      {super.key,
      required this.title,
      this.actions,
      this.leading,
      this.centerTitle,
      this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
      ),
      leadingWidth: leadingWidth,
      leading: leading ??
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(4, context)),
              child: const Icon(
                Icons.arrow_back_sharp,
                color: COLOR_PRIMARY_DARK,
              ),
            ),
          ),
      actions: actions,
    );
  }
}
