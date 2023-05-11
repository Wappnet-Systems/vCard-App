import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vcard/utils/responsive.dart';

class CustomNoData extends StatelessWidget {
  final String iconaddress;
  const CustomNoData({
    super.key,
    required this.iconaddress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        iconaddress,
        height: hp(30, context),
      ),
    );
  }
}
