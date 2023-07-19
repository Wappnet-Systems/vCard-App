// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

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
        color: COLOR_PRIMARY_DARK,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Icon(
                icon,
                color: COLOR_WHITE,
              ),
              const SizedBox(height: 3),
              Text(
                data!,
                style: titleTextStyle.copyWith(color: COLOR_WHITE),
              ),
              const SizedBox(height: 3),
              Text(
                data1!,
                style: const TextStyle(fontSize: 12, color: COLOR_WHITE),
              ),
              Text(
                data2!,
                style: const TextStyle(fontSize: 12, color: COLOR_WHITE),
              )
            ],
          ),
        ),
      ),
    );
  }
}
