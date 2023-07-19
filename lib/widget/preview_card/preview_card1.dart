// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: hp(35, context),
          decoration: BoxDecoration(
            color: COLOR_PRIMARY_DARK,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: colorList[previewcolor!] == ""
                    ? COLOR_PRIMARY_DARK
                    : colorList[previewcolor!],
                width: wp(0.4, context)),
            boxShadow: const [
              BoxShadow(
                color: COLOR_PRIMARY_LIGHT,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 15,
                  left: 8,
                  child: Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      width: wp(38, context),
                      text: "Company Name",
                      fontSize: 15,
                      selectionColor: colorList[previewcolor!] == ""
                          ? COLOR_PRIMARY_DARK
                          : colorList[previewcolor!])),
              Row(children: [
                Column(
                  children: [
                    SizedBox(height: hp(8, context)),
                    ClipOval(
                        child: Image.asset(
                      "assets/images/splash1.png",
                      width: wp(23, context),
                      height: hp(11, context),
                      fit: BoxFit.fill,
                    )),
                    SizedBox(height: hp(2, context)),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      width: wp(35, context),
                      text: "Your Name",
                      fontSize: 18,
                      selectionColor: colorList[previewcolor!] == ""
                          ? COLOR_PRIMARY_DARK
                          : colorList[previewcolor!],
                    ),
                    SizedBox(
                      height: hp(0.5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      width: wp(35, context),
                      text: "Profession",
                      fontSize: 12,
                      selectionColor: colorList[previewcolor!] == ""
                          ? COLOR_PRIMARY_DARK
                          : colorList[previewcolor!],
                    ),
                    SizedBox(height: hp(3, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Image.asset(
                            "assets/icon/Face.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? COLOR_PRIMARY_DARK
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            "assets/icon/tele.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? COLOR_PRIMARY_DARK
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            "assets/icon/lin.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? COLOR_PRIMARY_DARK
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            "assets/icon/whats.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? COLOR_PRIMARY_DARK
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            "assets/icon/website.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? COLOR_PRIMARY_DARK
                                : colorList[previewcolor!],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                VerticalDivider(
                    color: Colors.transparent, width: wp(5.5, context)),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(height: hp(1.3, context)),
                  Container(
                    decoration: BoxDecoration(
                        color: colorList[previewcolor!] == ""
                            ? COLOR_PRIMARY_DARK
                            : colorList[previewcolor!],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.elliptical(70, 50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(4))),
                    height: hp(28, context),
                    width: wp(50, context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 30,
                                  color: COLOR_WHITE,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8, top: 15),
                                child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: 130,
                                    text: "xxxxx xxxxx",
                                    fontSize: 12,
                                    selectionColor: COLOR_WHITE),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 30,
                                  color: COLOR_WHITE,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 15),
                                child: SizedBox(
                                  width: wp(40, context),
                                  child: const Textwidget(
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      width: 130,
                                      text: "xyz12@gmail.com",
                                      fontSize: 12,
                                      selectionColor: COLOR_WHITE),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: Image.asset(
                                  "assets/icon/pin.png",
                                  scale: 28,
                                  color: COLOR_WHITE,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8, top: 15),
                                child: Textwidget(
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    width: 140,
                                    text: "Your Address",
                                    fontSize: 11,
                                    selectionColor: COLOR_WHITE),
                              ),
                            ],
                          ),
                          SizedBox(height: hp(3, context)),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: COLOR_WHITE, width: 1)),
                            child: QrImage(
                              dataModuleStyle:
                                  const QrDataModuleStyle(color: COLOR_WHITE),
                              eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                              data: "",
                              size: 60,
                            ),
                          ),
                          SizedBox(height: hp(3, context)),
                        ],
                      ),
                    ),
                  )
                ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
