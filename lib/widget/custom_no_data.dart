import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNoData extends StatelessWidget {
  String iconaddress;
  CustomNoData({
    required this.iconaddress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Lottie.asset('$iconaddress')),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
