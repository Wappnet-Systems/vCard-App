import 'package:flutter/material.dart';

class Decorationwidget extends StatefulWidget {
  const Decorationwidget({super.key});

  @override
  State<Decorationwidget> createState() => _DecorationwidgetState();
}

class _DecorationwidgetState extends State<Decorationwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.transparent,
          width: 10,
        ),
        color: Colors.transparent,
      ),
    );
  }
}
