import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/style.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? leadinWidget;
  final Widget? titleWidget;
  final bool? centerTitle;
  final List<Widget>? actions;
  const AppBarWidget({
    super.key,
    required this.title,
    this.leadinWidget,
    this.centerTitle,
    this.titleWidget,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        // For iOS (dark icons)
      ),
      leading: leadinWidget ?? const SizedBox.shrink(),
      elevation: 0.0,
      backgroundColor: PRIMARY_COLOR,
      foregroundColor: PRIMARY_COLOR,
      centerTitle: centerTitle ?? false,
      title: titleWidget ??
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: WHITE_COLOR,
            ),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
