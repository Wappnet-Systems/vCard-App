// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: wp(100, context),
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
                border: Border.all(color: blueColor, width: 3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(90),
                ),
              ),
              child: ClipOval(
                  child: Image.asset(
                "assets/images/splash1.png",
                width: wp(32, context),
                height: hp(15, context),
                fit: BoxFit.fill,
              )),
            ),
            Column(
              children: [
                SizedBox(height: hp(3, context)),
                Textwidget(
                  textAlign: TextAlign.center,
                  width: wp(60, context),
                  text: "Aman Patel",
                  selectionColor: whiteColor,
                  fontSize: 14,
                ),
                SizedBox(
                  height: hp(1, context),
                ),
                Textwidget(
                  textAlign: TextAlign.center,
                  width: wp(60, context),
                  text: "Android Developer",
                  selectionColor: whiteColor,
                  fontSize: 10,
                ),
                SizedBox(
                  height: hp(0.5, context),
                ),
                Textwidget(
                  textAlign: TextAlign.center,
                  width: wp(60, context),
                  text: "Wappnet System Pvt. Ltd.",
                  selectionColor: whiteColor,
                  fontSize: 10,
                ),
                SizedBox(
                  height: hp(3, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon/call.png",
                        scale: 30,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: wp(5, context),
                      ),
                      Textwidget(
                        textAlign: TextAlign.start,
                        width: wp(60, context),
                        text: "7418529517",
                        selectionColor: whiteColor,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hp(3, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon/email.png",
                        scale: 30,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: wp(5, context),
                      ),
                      Textwidget(
                        textAlign: TextAlign.start,
                        width: wp(60, context),
                        text: "aman12@gmail.com",
                        selectionColor: whiteColor,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hp(3, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon/website.png",
                        scale: 30,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: wp(5, context),
                      ),
                      Textwidget(
                        textAlign: TextAlign.start,
                        width: wp(60, context),
                        text: "www.wappnet.com",
                        selectionColor: whiteColor,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
                          scale: 25,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/icon/Face.png",
                          scale: 25,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/icon/tele.png",
                          scale: 25,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/icon/lin.png",
                          scale: 25,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/icon/pin.png",
                          scale: 25,
                          color: whiteColor,
                        ),
                      ),
                    ]),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
