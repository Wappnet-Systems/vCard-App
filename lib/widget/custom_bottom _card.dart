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
        color: blueColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Icon(
                icon,
                color: whiteColor,
              ),
              const SizedBox(height: 3),
              Text(
                data!,
                style: const TextStyle(fontSize: 20, color: whiteColor),
              ),
              const SizedBox(height: 3),
              Text(
                data1!,
                style: const TextStyle(fontSize: 12, color: whiteColor),
              ),
              Text(
                data2!,
                style: const TextStyle(fontSize: 12, color: whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
