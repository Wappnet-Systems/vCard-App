import 'package:flutter/material.dart';
import 'package:vcard/utils/style.dart';

class CustomToast extends StatelessWidget {
  final Widget? child;
  const CustomToast({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: COLOR_PRIMARY_DARK,
        ),
        child: child);
  }
}
