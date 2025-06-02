// ignore_for_file: unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';

class PreviewCard4 extends StatefulWidget {
  final int? id;
  const PreviewCard4({super.key, required this.id});

  @override
  State<PreviewCard4> createState() => _PreviewCard4State();
}

class _PreviewCard4State extends State<PreviewCard4> {
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
        margin: EdgeInsets.symmetric(
            horizontal: wp(2, context), vertical: hp(2, context)),
        width: wp(95, context),
        height: hp(33, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: COLOR_WHITE,
          border: Border.all(
            color: colorList[previewcolor!],
            width: wp(0.5, context),
          ),
          boxShadow: [
            BoxShadow(
              color: colorList[previewcolor!].withOpacity(0.5),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: hp(2, context),
                  horizontal: wp(2, context),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Company Name",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: textMediumTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: hp(5, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(wp(1.5, context)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorList[previewcolor!],
                              ),
                              child: Image.asset(
                                "assets/icon/call.png",
                                scale: 35,
                                color: COLOR_WHITE,
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Text(
                              "xxxxx xxxxx",
                              textAlign: TextAlign.start,
                              style: textSmallTextStyle.copyWith(
                                  color: COLOR_PRIMARY_DARK),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(1.5, context),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(wp(1.5, context)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorList[previewcolor!],
                              ),
                              child: Image.asset(
                                "assets/icon/email.png",
                                scale: 35,
                                color: COLOR_WHITE,
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Flexible(
                              child: Text(
                                "xyz12@gmail.com",
                                textAlign: TextAlign.start,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(1.5, context),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(wp(1.5, context)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorList[previewcolor!],
                              ),
                              child: Image.asset(
                                "assets/icon/pin.png",
                                scale: 35,
                                color: COLOR_WHITE,
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Flexible(
                              child: Text(
                                "Your Address",
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                style: smallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: COLOR_PRIMARY, width: 1),
                            ),
                            child: QrImage(
                              data: "",
                              size: dp(50, context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              endIndent: hp(4, context),
              indent: hp(4, context),
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
              thickness: 1,
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(
                  top: hp(5, context),
                  left: wp(2, context),
                  right: wp(2, context),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Name",
                      textAlign: TextAlign.center,
                      style: textMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: hp(1, context),
                    ),
                    Text(
                      "Profession",
                      textAlign: TextAlign.center,
                      style: textMediumTextStyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: hp(4, context),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: colorList[previewcolor!],
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/splash1.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hp(5, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Image.asset(
                          "assets/icon/Face.png",
                          scale: 30,
                          color: colorList[previewcolor!],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
