import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constants_color.dart';

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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        border: Border.all(
          color: PRIMARY_COLOR,
          width: 10,
        ),
        color: PRIMARY_COLOR,
      ),
    );
  }
}
