import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNoData extends StatelessWidget {
  String iconaddress;
  CustomNoData({
    super.key,
    required this.iconaddress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Lottie.asset(iconaddress)),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
