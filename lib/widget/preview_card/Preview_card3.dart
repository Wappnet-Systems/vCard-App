// ignore_for_file: unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';

class PreviewCard3 extends StatefulWidget {
  final int? id;
  const PreviewCard3({super.key, required this.id});

  @override
  State<PreviewCard3> createState() => _PreviewCard3State();
}

class _PreviewCard3State extends State<PreviewCard3> {
  int? previewcolor;

  @override
  void initState() {
    previewcolor = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(3, context),
          vertical: hp(2, context),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: hp(30, context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2, context),
                      horizontal: wp(3, context),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorList[previewcolor!],
                        width: wp(0.3, context),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: COLOR_WHITE,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Name",
                          textAlign: TextAlign.center,
                          style: smalltitleTextStyle.copyWith(
                            color: colorList[previewcolor!],
                          ),
                        ),
                        SizedBox(
                          height: hp(1, context),
                        ),
                        Text(
                          "Profession",
                          textAlign: TextAlign.center,
                          style: textSmallTextStyle.copyWith(
                            color: colorList[previewcolor!],
                          ),
                        ),
                        SizedBox(
                          height: hp(3, context),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: colorList[previewcolor!],
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/splash1.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: hp(4, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icon/Face.png",
                              scale: 30,
                              color: colorList[previewcolor!],
                            ),
                            Image.asset(
                              "assets/icon/website.png",
                              scale: 30,
                              color: colorList[previewcolor!],
                            ),
                            Image.asset(
                              "assets/icon/tele.png",
                              scale: 30,
                              color: colorList[previewcolor!],
                            ),
                            Image.asset(
                              "assets/icon/lin.png",
                              scale: 30,
                              color: colorList[previewcolor!],
                            ),
                            Image.asset(
                              "assets/icon/whats.png",
                              scale: 30,
                              color: colorList[previewcolor!],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: hp(30, context),
                    padding: EdgeInsets.only(
                        left: wp(2, context), bottom: hp(0.5, context)),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: colorList[previewcolor!]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: hp(10, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icon/call.png",
                              scale: 35,
                              color: COLOR_WHITE,
                            ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            Text(
                              "xxxxx xxxxx",
                              textAlign: TextAlign.center,
                              style:
                                  smallTextStyle.copyWith(color: COLOR_WHITE),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icon/email.png",
                              scale: 35,
                              color: COLOR_WHITE,
                            ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            Text(
                              "xyz12@gmail.com",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style:
                                  smallTextStyle.copyWith(color: COLOR_WHITE),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icon/pin.png",
                              scale: 30,
                              color: COLOR_WHITE,
                            ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            Text(
                              "Your Address",
                              textAlign: TextAlign.start,
                              style: smallTextStyle.copyWith(
                                  color: COLOR_WHITE, fontSize: 9),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: COLOR_WHITE,
                              width: wp(0.3, context),
                            ),
                          ),
                          child: QrImage(
                            dataModuleStyle:
                                const QrDataModuleStyle(color: COLOR_WHITE),
                            eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                            data: "",
                            size: dp(50, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: hp(2, context),
              right: wp(0, context),
              child: Wrap(
                children: [
                  Container(
                    width: wp(53, context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2, context),
                      horizontal: wp(2, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      color: COLOR_PRIMARY_DARK.withOpacity(1),
                    ),
                    child: Text(
                      "Company Name",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_WHITE, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
