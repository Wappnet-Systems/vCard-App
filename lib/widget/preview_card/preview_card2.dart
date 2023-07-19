// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
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
      padding: const EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 10),
      child: Container(
        width: wp(80, context),
        height: hp(52, context),
        decoration: BoxDecoration(
          border: Border.all(color: COLOR_WHITE, width: wp(0.5, context)),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: colorList[previewcolor!] == ""
              ? COLOR_PRIMARY_DARK
              : colorList[previewcolor!],
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(height: hp(1, context)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: COLOR_WHITE, width: 3),
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
              SizedBox(height: hp(1, context)),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "Your Name",
                selectionColor: COLOR_WHITE,
                fontSize: 20,
              ),
              SizedBox(
                height: hp(0.5, context),
              ),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "Profession",
                selectionColor: COLOR_WHITE,
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
                selectionColor: COLOR_WHITE,
                fontSize: 14,
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/call.png",
                      scale: 22,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xxxxx xxxxx",
                      selectionColor: COLOR_WHITE,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/email.png",
                      scale: 22,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xyz12@gmail.com",
                      selectionColor: COLOR_WHITE,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/pin.png",
                      scale: 20,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "Yourv Address",
                      selectionColor: COLOR_WHITE,
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
                      border: Border.all(color: COLOR_WHITE, width: 1)),
                  child: QrImage(
                    dataModuleStyle:
                        const QrDataModuleStyle(color: COLOR_WHITE),
                    eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
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
                        color: COLOR_WHITE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/Face.png",
                        scale: 22,
                        color: COLOR_WHITE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/tele.png",
                        scale: 22,
                        color: COLOR_WHITE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/lin.png",
                        scale: 22,
                        color: COLOR_WHITE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/icon/website.png",
                        scale: 22,
                        color: COLOR_WHITE,
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
