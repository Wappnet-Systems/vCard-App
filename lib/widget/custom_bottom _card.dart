// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class CardWidget extends StatelessWidget {
  final IconData? icon;
  final String data;
  final String data1;

  const CardWidget({
    super.key,
    required this.icon,
    required this.data,
    required this.data1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: hp(15, context),
      width: wp(35, context),
      decoration: BoxDecoration(
        color: COLOR_PRIMARY_DARK,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: hp(2, context),
        horizontal: wp(2, context),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: COLOR_WHITE,
            size: 25,
          ),
          SizedBox(
            height: hp(1, context),
          ),
          Text(
            data,
            style: smalltitleTextStyle.copyWith(color: COLOR_WHITE),
          ),
          SizedBox(
            height: hp(0.5, context),
          ),
          Text(
            data1,
            textAlign: TextAlign.center,
            style: smallTextStyle.copyWith(color: COLOR_WHITE),
          ),
        ],
      ),
    );
  }
}
