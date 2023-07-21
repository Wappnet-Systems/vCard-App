// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/constants.dart';

class PreviewCard1 extends StatefulWidget {
  final int? id;
  const PreviewCard1({
    super.key,
    required this.id,
  });

  @override
  State<PreviewCard1> createState() => _PreviewCard1State();
}

class _PreviewCard1State extends State<PreviewCard1> {
  int? previewcolor;

  @override
  void initState() {
    previewcolor = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: hp(1, context),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: wp(2, context), vertical: hp(2, context)),
        decoration: BoxDecoration(
          color: COLOR_PRIMARY_DARK,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorList[previewcolor!],
            width: wp(0.4, context),
          ),
          boxShadow: [
            BoxShadow(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Company Name",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: textMediumTextStyle.copyWith(
                      color: colorList[previewcolor!],
                    ),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: colorList[previewcolor!],
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/splash1.png",
                        width: wp(22, context),
                        height: hp(10.5, context),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Text(
                    "Your Name",
                    style: smalltitleTextStyle.copyWith(
                      color: colorList[previewcolor!],
                    ),
                  ),
                  SizedBox(
                    height: hp(1, context),
                  ),
                  Text(
                    "Profession",
                    style: smallTextStyle.copyWith(
                      color: colorList[previewcolor!],
                    ),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(4, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icon/Face.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Image.asset(
                          "assets/icon/tele.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Image.asset(
                          "assets/icon/lin.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Image.asset(
                          "assets/icon/whats.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Image.asset(
                          "assets/icon/website.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.transparent,
              thickness: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: hp(1, context),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(2, context),
                    vertical: hp(2, context),
                  ),
                  decoration: BoxDecoration(
                    color: colorList[previewcolor!],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(70, 50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/call.png",
                            scale: 30,
                            color: COLOR_WHITE,
                          ),
                          SizedBox(
                            width: wp(2, context),
                          ),
                          Text(
                            "xxxxx xxxxx",
                            style: smallTextStyle.copyWith(
                              color: COLOR_WHITE,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(1.5, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/email.png",
                            scale: 30,
                            color: COLOR_WHITE,
                          ),
                          SizedBox(
                            width: wp(2, context),
                          ),
                          Text(
                            "xyz12@gmail.com",
                            style: smallTextStyle.copyWith(
                              color: COLOR_WHITE,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon/pin.png",
                            scale: 25,
                            color: COLOR_WHITE,
                          ),
                          SizedBox(
                            width: wp(2, context),
                          ),
                          SizedBox(
                            width: wp(40, context),
                            child: Text(
                              "Your Address",
                              maxLines: 4,
                              style: smallTextStyle.copyWith(
                                fontSize: 10,
                                color: COLOR_WHITE,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: wp(15, context),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: COLOR_WHITE, width: 0.3)),
                        child: QrImage(
                          dataModuleStyle:
                              const QrDataModuleStyle(color: COLOR_WHITE),
                          eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                          data: "",
                          size: dp(60, context),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
