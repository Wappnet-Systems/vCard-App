// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/text_widget.dart';
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
    return SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 10),
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: goldColor, width: wp(0.5, context)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 30,
            color: blackColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text: 'Wappnet System Pvt. Ltd.',
                      fontSize: 16,
                      selectionColor: goldColor)),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                  border: Border.all(color: goldColor, width: wp(0.1, context)),
                  boxShadow: const [
                    BoxShadow(
                      color: goldColor,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                  child: Image.asset(
                    "assets/images/splash1.png",
                    width: wp(50, context),
                    height: hp(20, context),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
              SizedBox(height: hp(1.5, context)),
              Center(
                  child: Textwidget(
                maxLines: 1,
                textAlign: TextAlign.start,
                width: wp(40, context),
                text: 'Aman Patel',
                fontSize: 25,
                selectionColor: goldColor,
              )),
              SizedBox(height: hp(0.5, context)),
              Center(
                child: Textwidget(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  width: wp(60, context),
                  text: 'Android Developer',
                  fontSize: 20,
                  selectionColor: goldColor,
                ),
              ),
              SizedBox(height: hp(0.5, context)),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Divider(
                  color: goldColor,
                  thickness: 2,
                  height: 1,
                ),
              ),
              Center(
                child: Container(
                  height: hp(15, context),
                  width: wp(60, context),
                  alignment: Alignment.center,
                  child: Wrap(
                      runSpacing: 5.0,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/call.png",
                            scale: 17,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/whats.png",
                            scale: 15,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/email.png",
                            scale: 15,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/Face.png",
                            scale: 17,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/tele.png",
                            scale: 16,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/website.png",
                            scale: 15,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/lin.png",
                            scale: 16,
                            color: goldColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icon/pin.png",
                            scale: 15,
                            color: goldColor,
                          ),
                        ),
                      ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35, top: 10, bottom: 10),
              ),
            ]),
          ),
        ]));
  }
}
