// ignore_for_file: unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/widget/text_widget.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Row(
            children: [
              Container(
                width: wp(47.5, context),
                height: hp(37, context),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: colorList[previewcolor!] == ""
                          ? blackColor
                          : colorList[previewcolor!],
                      width: wp(0.5, context)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: colorList[previewcolor!] == ""
                          ? blackColor
                          : colorList[previewcolor!],
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: hp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      width: wp(40, context),
                      text: "Your Name",
                      fontSize: 20,
                      selectionColor: colorList[previewcolor!] == ""
                          ? blackColor
                          : colorList[previewcolor!],
                    ),
                    SizedBox(height: hp(1, context)),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      width: wp(40, context),
                      text: "Profession",
                      fontSize: 14,
                      selectionColor: colorList[previewcolor!] == ""
                          ? blackColor
                          : colorList[previewcolor!],
                    ),
                    SizedBox(
                      height: hp(3, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: colorList[previewcolor!] == ""
                                  ? blackColor
                                  : colorList[previewcolor!],
                              width: 3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(90),
                          ),
                        ),
                        child: ClipOval(
                            child: Image.asset(
                          "assets/images/splash1.png",
                          width: wp(22, context),
                          height: hp(11, context),
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                    SizedBox(height: hp(5, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/Face.png",
                          scale: 30,
                          color: colorList[previewcolor!] == ""
                              ? blackColor
                              : colorList[previewcolor!],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/icon/website.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? blackColor
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/icon/tele.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? blackColor
                                : colorList[previewcolor!],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/icon/lin.png",
                            scale: 30,
                            color: colorList[previewcolor!] == ""
                                ? blackColor
                                : colorList[previewcolor!],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: wp(47.5, context),
                height: hp(37, context),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: colorList[previewcolor!] == ""
                      ? blackColor
                      : colorList[previewcolor!],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: hp(14, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon/call.png",
                            scale: 30,
                            color: whiteColor,
                          ),
                          SizedBox(width: wp(4, context)),
                          Textwidget(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              width: wp(25, context),
                              text: "xxxxx xxxxx",
                              fontSize: 10,
                              selectionColor: whiteColor),
                        ],
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon/email.png",
                            scale: 30,
                            color: whiteColor,
                          ),
                          SizedBox(
                            width: wp(4, context),
                          ),
                          Textwidget(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              width: wp(30, context),
                              text: "xyz12@gmail.com",
                              fontSize: 10,
                              selectionColor: whiteColor),
                        ],
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/icon/pin.png",
                            scale: 30,
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: wp(4, context),
                        ),
                        Textwidget(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            width: wp(30, context),
                            text: "Your Address",
                            fontSize: 10,
                            selectionColor: whiteColor),
                      ],
                    ),
                    SizedBox(height: hp(2, context)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: whiteColor, width: 2)),
                      child: QrImage(
                        dataModuleStyle:
                            const QrDataModuleStyle(color: whiteColor),
                        eyeStyle: const QrEyeStyle(color: whiteColor),
                        data: "",
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 30,
              left: 151,
              child: Container(
                width: wp(53, context),
                height: hp(8, context),
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Center(
                    child: Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        width: wp(50, context),
                        text: "Company Name",
                        fontSize: 18,
                        selectionColor: whiteColor),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
