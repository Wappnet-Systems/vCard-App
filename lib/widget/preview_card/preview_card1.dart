// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants_color.dart';

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
            color: blackColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: colorList[previewcolor!] == ""
                    ? grayColor
                    : colorList[previewcolor!],
                width: wp(0.4, context)),
            boxShadow: const [
              BoxShadow(
                color: grayColor,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Column(
                children: [
                  SizedBox(height: hp(2.5, context)),
                  Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    width: wp(36, context),
                    text: "Company Name",
                    fontSize: 15,
                    selectionColor: colorList[previewcolor!] == ""
                        ? grayColor
                        : colorList[previewcolor!],
                  ),
                  SizedBox(height: hp(5, context)),
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
                        ? grayColor
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
                    fontSize: 14,
                    selectionColor: colorList[previewcolor!] == ""
                        ? grayColor
                        : colorList[previewcolor!],
                  ),
                ],
              ),
            ),
            const VerticalDivider(color: Colors.transparent, width: 22),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Textwidget(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  width: wp(50, context),
                  text: "www.xyz.com",
                  fontSize: 15,
                  selectionColor: colorList[previewcolor!] == ""
                      ? grayColor
                      : colorList[previewcolor!],
                ),
              ),
              SizedBox(height: hp(1.3, context)),
              Container(
                decoration: BoxDecoration(
                    color: colorList[previewcolor!] == ""
                        ? grayColor
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
                            padding: const EdgeInsets.only(left: 3, top: 15),
                            child: Image.asset(
                              "assets/icon/call.png",
                              scale: 30,
                              color: whiteColor,
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
                                selectionColor: whiteColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3, top: 15),
                            child: Image.asset(
                              "assets/icon/whats.png",
                              scale: 30,
                              color: whiteColor,
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
                                selectionColor: whiteColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3, top: 15),
                            child: Image.asset(
                              "assets/icon/email.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 15),
                            child: SizedBox(
                              width: wp(40, context),
                              child: const Textwidget(
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  width: 130,
                                  text: "xyz12@gmail.com",
                                  fontSize: 12,
                                  selectionColor: whiteColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hp(0.5, context)),
                      QrImage(
                        data: "",
                        size: 60,
                      ),
                      SizedBox(height: hp(2, context)),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                            ),
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/icon/tele.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/icon/lin.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/icon/pin.png",
                              scale: 28,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
