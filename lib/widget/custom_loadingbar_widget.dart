import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/constants_color.dart';

class Custonloading extends StatefulWidget {
  const Custonloading({super.key});

  @override
  State<Custonloading> createState() => _CustonloadingState();
}

class _CustonloadingState extends State<Custonloading> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      content: Center(
        child: CircularProgressIndicator(
          color: PRIMARY_COLOR,
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}
