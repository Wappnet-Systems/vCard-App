import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';

class CustomToast extends StatelessWidget {
  final Widget? child;
  const CustomToast({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: wp(5, context),
          vertical: hp(1.5, context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.green[700],
        ),
        child: child);
  } 
}
