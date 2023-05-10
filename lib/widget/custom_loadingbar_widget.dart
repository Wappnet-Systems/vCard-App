import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffc1c4be),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        color: WHITE_COLOR,
      ),
      height: hp(8, context),
      width: wp(20, context),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          color: PRIMARY_COLOR,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
