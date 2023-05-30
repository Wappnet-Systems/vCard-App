// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants.dart';
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
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: goldColor, width: wp(0.5, context)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 30,
          color: blackColor,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: hp(0.5, context)),
            Textwidget(
              maxLines: 1,
              textAlign: TextAlign.center,
              width: wp(60, context),
              text: 'Company Name',
              fontSize: 16,
              selectionColor: goldColor,
            ),
            SizedBox(height: hp(0.5, context)),
            Center(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(19),
                    bottomLeft: Radius.circular(19),
                    bottomRight: Radius.circular(19)),
                border: Border.all(color: goldColor, width: wp(0.1, context)),
                boxShadow: const [
                  BoxShadow(
                    color: goldColor,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
                child: Image.asset(
                  "assets/images/splash1.png",
                  width: wp(50, context),
                  height: hp(16, context),
                  fit: BoxFit.fill,
                ),
              ),
            )),
            SizedBox(height: hp(1, context)),
            Center(
                child: Textwidget(
              maxLines: 1,
              textAlign: TextAlign.center,
              width: wp(40, context),
              text: 'Your Name',
              fontSize: 20,
              selectionColor: goldColor,
            )),
            SizedBox(height: hp(0.5, context)),
            Center(
              child: Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: 'Profession',
                fontSize: 16,
                selectionColor: goldColor,
              ),
            ),
            SizedBox(height: hp(0.5, context)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: goldColor,
                thickness: 2,
                height: 1,
              ),
            ),
            Column(children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Image.asset(
                    "assets/icon/call.png",
                    scale: 24,
                    color: goldColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xxxxx xxxxx",
                      fontSize: 16,
                      selectionColor: goldColor),
                ),
              ]),
              SizedBox(height: hp(1.5, context)),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Image.asset(
                    "assets/icon/email.png",
                    scale: 24,
                    color: goldColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text: "xyz12@gmail.com",
                      fontSize: 16,
                      selectionColor: goldColor),
                ),
              ]),
              SizedBox(height: hp(1.5, context)),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Image.asset(
                    "assets/icon/pin.png",
                    scale: 24,
                    color: goldColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Textwidget(
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      width: wp(30, context),
                      text: "Your Address",
                      fontSize: 14,
                      selectionColor: goldColor),
                ),
              ]),
            ]),
            SizedBox(height: hp(0.5, context)),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: goldColor, width: 1)),
                child: QrImage(
                  dataModuleStyle: const QrDataModuleStyle(color: goldColor),
                  eyeStyle: const QrEyeStyle(color: goldColor),
                  data: "",
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: hp(0.5, context)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "assets/icon/whats.png",
                  scale: 22,
                  color: goldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "assets/icon/Face.png",
                  scale: 22,
                  color: goldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "assets/icon/tele.png",
                  scale: 22,
                  color: goldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "assets/icon/website.png",
                  scale: 22,
                  color: goldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "assets/icon/lin.png",
                  scale: 22,
                  color: goldColor,
                ),
              )
            ]),
          ]),
        ),
      ),
    ]);
  }
}
