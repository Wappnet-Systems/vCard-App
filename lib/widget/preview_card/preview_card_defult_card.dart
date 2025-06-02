// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/responsive.dart';

class PreviewDefultCard extends StatefulWidget {
  const PreviewDefultCard({super.key});

  @override
  State<PreviewDefultCard> createState() => _PreviewDefultCardState();
}

class _PreviewDefultCardState extends State<PreviewDefultCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: hp(2, context),
            horizontal: wp(2, context),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: wp(8, context),
            vertical: hp(1, context),
          ),
          decoration: BoxDecoration(
            color: COLOR_PRIMARY_DARK,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: COLOR_YELLOW,
              width: wp(0.5, context),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Company Name',
                textAlign: TextAlign.center,
                style: smalltitleTextStyle.copyWith(color: COLOR_YELLOW),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                  border: Border.all(
                    color: COLOR_YELLOW,
                    width: wp(0.2, context),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: COLOR_YELLOW.withOpacity(0.1),
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                  child: Image.asset(
                    "assets/images/splash1.png",
                    width: wp(28, context),
                    height: hp(12, context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: hp(1.5, context),
              ),
              Text(
                'Your Name',
                textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(color: COLOR_YELLOW),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Text(
                'Profession',
                textAlign: TextAlign.center,
                style: textMediumTextStyle.copyWith(color: COLOR_YELLOW),
              ),
              SizedBox(height: hp(1, context)),
              const Divider(
                color: COLOR_YELLOW,
                thickness: 1,
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: wp(10, context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icon/call.png",
                          scale: 35,
                          color: COLOR_YELLOW,
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Text(
                          'xxxxx xxxxx',
                          textAlign: TextAlign.center,
                          style:
                              textMediumTextStyle.copyWith(color: COLOR_YELLOW),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: hp(1, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icon/email.png",
                          scale: 35,
                          color: COLOR_YELLOW,
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Text(
                          "xzy12@gmail.com",
                          textAlign: TextAlign.center,
                          style:
                              textMediumTextStyle.copyWith(color: COLOR_YELLOW),
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
                          scale: 30,
                          color: COLOR_YELLOW,
                        ),
                        SizedBox(
                          width: wp(3, context),
                        ),
                        Text(
                          "Your Address",
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          style: textMediumTextStyle.copyWith(
                              color: COLOR_YELLOW, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: COLOR_YELLOW, width: 1),
                  ),
                  child: QrImage(
                    dataModuleStyle:
                        const QrDataModuleStyle(color: COLOR_YELLOW),
                    eyeStyle: const QrEyeStyle(color: COLOR_YELLOW),
                    data: "",
                    size: dp(50, context),
                  ),
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(5, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/icon/whats.png",
                      scale: 30,
                      color: COLOR_YELLOW,
                    ),
                    Image.asset(
                      "assets/icon/Face.png",
                      scale: 30,
                      color: COLOR_YELLOW,
                    ),
                    Image.asset(
                      "assets/icon/tele.png",
                      scale: 30,
                      color: COLOR_YELLOW,
                    ),
                    Image.asset(
                      "assets/icon/website.png",
                      scale: 30,
                      color: COLOR_YELLOW,
                    ),
                    Image.asset(
                      "assets/icon/lin.png",
                      scale: 30,
                      color: COLOR_YELLOW,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
