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
      child: SizedBox(
        height: hp(20, context),
        child: Lottie.asset(iconaddress),
      ),
    );
  }
}
