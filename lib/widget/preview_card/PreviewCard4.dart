// ignore_for_file: unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants_color.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Stack(children: [
              Container(
                  width: wp(95, context),
                  height: hp(37, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteColor,
                    border: Border.all(
                        color: colorList[previewcolor!] == ""
                            ? blackColor
                            : colorList[previewcolor!],
                        width: wp(0.5, context)),
                    boxShadow: [
                      BoxShadow(
                        color: colorList[previewcolor!] == ""
                            ? blackColor
                            : colorList[previewcolor!],
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: hp(3, context)),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Center(
                                    child: Textwidget(
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  width: wp(170, context),
                                  text: "Company Name",
                                  fontSize: 16,
                                  selectionColor: blueColor,
                                )),
                              ),
                              SizedBox(
                                height: hp(8, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(50, context),
                                    text: "xxxxx xxxxx",
                                    fontSize: 12,
                                    selectionColor: blueColor,
                                  )),
                              SizedBox(
                                height: hp(2, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(50, context),
                                    text: "xxxxx xxxxx",
                                    fontSize: 12,
                                    selectionColor: blueColor,
                                  )),
                              SizedBox(
                                height: hp(2.2, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(100, context),
                                    text: "xyz2@gmail.com",
                                    fontSize: 12,
                                    selectionColor: blueColor,
                                  )),
                              SizedBox(
                                height: hp(2.3, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(100, context),
                                    text: "www.xyz.com",
                                    fontSize: 12,
                                    selectionColor: blueColor,
                                  )),
                              SizedBox(
                                height: hp(2.5, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Textwidget(
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      width: wp(100, context),
                                      text: "YourID",
                                      fontSize: 12,
                                      selectionColor: blueColor))
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: VerticalDivider(
                          width: 1,
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: hp(5, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    width: wp(40, context),
                                    text: "Your Name",
                                    fontSize: 20,
                                    selectionColor: blueColor,
                                  )),
                              SizedBox(
                                height: hp(1, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Textwidget(
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      width: wp(41, context),
                                      text: "Profession",
                                      fontSize: 14,
                                      selectionColor: blueColor)),
                              SizedBox(
                                height: hp(5, context),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: blueColor, width: 2)),
                                    child: QrImage(
                                      data: "",
                                      size: 70,
                                    ),
                                  )),
                              SizedBox(
                                height: hp(5, context),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Image.asset(
                                      "assets/icon/tele.png",
                                      scale: 30,
                                      color: colorList[previewcolor!] == ""
                                          ? blueColor
                                          : colorList[previewcolor!],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Image.asset(
                                      "assets/icon/lin.png",
                                      scale: 30,
                                      color: colorList[previewcolor!] == ""
                                          ? blueColor
                                          : colorList[previewcolor!],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Image.asset(
                                      "assets/icon/pin.png",
                                      scale: 30,
                                      color: colorList[previewcolor!] == ""
                                          ? blueColor
                                          : colorList[previewcolor!],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: wp(10, context),
                  height: hp(25, context),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: colorList[previewcolor!] == ""
                        ? blackColor
                        : colorList[previewcolor!],
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
                    children: [
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon/call.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon/whats.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon/email.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon/website.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 30,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: wp(10, context),
                  height: hp(25, context),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: colorList[previewcolor!] == ""
                        ? blackColor
                        : colorList[previewcolor!],
                    boxShadow: [
                      BoxShadow(
                        color: colorList[previewcolor!] == ""
                            ? blackColor
                            : colorList[previewcolor!],
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
