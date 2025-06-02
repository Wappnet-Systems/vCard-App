// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class PreviewCard2 extends StatefulWidget {
  final int? id;
  const PreviewCard2({super.key, required this.id});

  @override
  State<PreviewCard2> createState() => _PreviewCard2State();
}

class _PreviewCard2State extends State<PreviewCard2> {
  int? previewcolor;

  @override
  void initState() {
    previewcolor = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: wp(8, context),
        vertical: hp(2, context),
      ),
      padding: EdgeInsets.symmetric(
        vertical: hp(2, context),
        horizontal: wp(2, context),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: COLOR_WHITE,
          width: wp(0.5, context),
        ),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: colorList[previewcolor!],
        boxShadow: [
          BoxShadow(
            color: COLOR_PRIMARY_DARK.withOpacity(0.5),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: COLOR_WHITE,
            child: ClipOval(
              child: Image.asset(
                "assets/images/splash1.png",
              ),
            ),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          Text(
            "Your Name",
            textAlign: TextAlign.center,
            style: titleTextStyle.copyWith(color: COLOR_WHITE),
          ),
          SizedBox(
            height: hp(1, context),
          ),
          Text(
            "Profession",
            textAlign: TextAlign.center,
            style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          Text(
            "Company Name",
            textAlign: TextAlign.center,
            style: textMediumTextStyle.copyWith(
                color: COLOR_WHITE, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: wp(10, context),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/icon/call.png",
                      scale: 25,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Text(
                      "xxxxx xxxxx",
                      textAlign: TextAlign.center,
                      style: textSmallTextStyle.copyWith(color: COLOR_WHITE),
                    ),
                  ],
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/email.png",
                      scale: 25,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Text(
                      "xyz12@gmail.com",
                      textAlign: TextAlign.center,
                      style: textSmallTextStyle.copyWith(color: COLOR_WHITE),
                    ),
                  ],
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/pin.png",
                      scale: 25,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Flexible(
                      child: Text(
                        "Your Address",
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        style: smallTextStyle.copyWith(color: COLOR_WHITE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: COLOR_WHITE, width: 1),
            ),
            child: QrImage(
              dataModuleStyle: const QrDataModuleStyle(color: COLOR_WHITE),
              eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
              data: "",
              size: dp(60, context),
            ),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: wp(10, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icon/whats.png",
                  scale: 25,
                  color: COLOR_WHITE,
                ),
                Image.asset(
                  "assets/icon/Face.png",
                  scale: 25,
                  color: COLOR_WHITE,
                ),
                Image.asset(
                  "assets/icon/tele.png",
                  scale: 25,
                  color: COLOR_WHITE,
                ),
                Image.asset(
                  "assets/icon/lin.png",
                  scale: 25,
                  color: COLOR_WHITE,
                ),
                Image.asset(
                  "assets/icon/website.png",
                  scale: 25,
                  color: COLOR_WHITE,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
