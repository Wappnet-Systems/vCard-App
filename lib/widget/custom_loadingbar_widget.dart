import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class Custonloading extends StatefulWidget {
  const Custonloading({super.key});

  @override
  State<Custonloading> createState() => _CustonloadingState();
}

class _CustonloadingState extends State<Custonloading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: COLOR_PRIMARY,
        strokeWidth: wp(1, context),
      ),
    );
  }
}
