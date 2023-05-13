import 'package:flutter/material.dart';
import '../utils/constants_color.dart';

class CardWidget extends StatelessWidget {
  final IconData? icon;
  final String? data;
  final String? data1;
  final String? data2;
  const CardWidget(
      {super.key,
      required this.icon,
      required this.data,
      required this.data1,
      required this.data2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 150,
      child: Card(
        color: PRIMARY_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Icon(
                icon,
                color: WHITE_COLOR,
              ),
              const SizedBox(height: 3),
              Text(
                data!,
                style: const TextStyle(fontSize: 20, color: WHITE_COLOR),
              ),
              const SizedBox(height: 3),
              Text(
                data1!,
                style: const TextStyle(fontSize: 16, color: WHITE_COLOR),
              ),
              Text(
                data2!,
                style: const TextStyle(fontSize: 17, color: WHITE_COLOR),
              )
            ],
          ),
        ),
      ),
    );
  }
}
