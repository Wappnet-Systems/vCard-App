import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import '../utils/constants_color.dart';

class Custonloading extends StatefulWidget {
  const Custonloading({super.key});

  @override
  State<Custonloading> createState() => _CustonloadingState();
}

class _CustonloadingState extends State<Custonloading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hp(9, context),
      width: wp(15, context),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          color: bluegrayColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
