import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/style.dart';

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
        color: PRIMARY_COLOR,
        strokeWidth: 1.5,
      ),
    );
  }
}
