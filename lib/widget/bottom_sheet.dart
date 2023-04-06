import 'package:flutter/material.dart';
import '../utils/constants_color.dart';

class CardWidget extends StatelessWidget {
  final IconData? icon;
  final String? data;
  final String? data1;
  final String? data2;
  CardWidget(
      {required this.icon,
      required this.data,
      required this.data1,
      required this.data2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 150,
      child: Card(
        color: PRIMARY_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Icon(
                icon,
                color: WHITE_COLOR,
              ),
              SizedBox(height: 3),
              Text(
                data!,
                style: TextStyle(fontSize: 20, color: WHITE_COLOR),
              ),
              SizedBox(height: 3),
              Text(
                data1!,
                style: TextStyle(fontSize: 17, color: WHITE_COLOR),
              ),
              Text(
                data2!,
                style: TextStyle(fontSize: 17, color: WHITE_COLOR),
              )
            ],
          ),
        ),
      ),
    );
  }
}
