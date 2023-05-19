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
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        color: blueColor,
      ),
      height: hp(8, context),
      width: wp(20, context),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          color: whiteColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
