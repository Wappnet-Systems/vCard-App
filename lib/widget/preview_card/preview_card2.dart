// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/text_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
      child: Container(
        width: wp(50, context),
        height: hp(70, context),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: wp(0.5, context)),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: colorList[previewcolor!] == ""
              ? blueColor
              : colorList[previewcolor!],
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(height: hp(2, context)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: 3),
              borderRadius: const BorderRadius.all(
                Radius.circular(90),
              ),
            ),
            child: ClipOval(
                child: Image.asset(
              "assets/images/splash1.png",
              width: wp(24, context),
              height: hp(12, context),
              fit: BoxFit.fill,
            )),
          ),
          Column(
            children: [
              SizedBox(height: hp(2, context)),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "Your Name",
                selectionColor: whiteColor,
                fontSize: 20,
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "Profession",
                selectionColor: whiteColor,
                fontSize: 14,
              ),
              SizedBox(
                height: hp(0.5, context),
              ),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(40, context),
                text: "Company Name",
                selectionColor: whiteColor,
                fontSize: 14,
              ),
              SizedBox(
                height: hp(1.5, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/call.png",
                      scale: 22,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xxxxx xxxxx",
                      selectionColor: whiteColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1.5, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/email.png",
                      scale: 22,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xyz12@gmail.com",
                      selectionColor: whiteColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1.5, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/pin.png",
                      scale: 20,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "Yourv Address",
                      selectionColor: whiteColor,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(height: hp(0.5, context)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor, width: 1)),
                  child: QrImage(
                    dataModuleStyle: const QrDataModuleStyle(color: whiteColor),
                    eyeStyle: const QrEyeStyle(color: whiteColor),
                    data: "",
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: hp(0.5, context)),
              Wrap(
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/whats.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/Face.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/tele.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/lin.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/website.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                  ])
            ],
          )
        ]),
      ),
    );
  }
}
