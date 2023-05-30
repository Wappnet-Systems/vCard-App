import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants.dart';
import '../text_button_widget.dart';

class Cardtheme1 extends StatefulWidget {
  final int? id;
  const Cardtheme1({
    super.key,
    required this.id,
  });

  @override
  State<Cardtheme1> createState() => _Cardtheme1State();
}

class _Cardtheme1State extends State<Cardtheme1> {
  int? cardindex;
  FToast? fToast;

  @override
  void initState() {
    cardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
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
            color: blueColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Staticmenbers.listofUsers[cardindex!].color != null
                    ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
                    : grayColor,
                width: wp(0.4, context)),
            boxShadow: const [
              BoxShadow(
                color: grayColor,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Row(children: [
            Column(
              children: [
                SizedBox(height: hp(2.5, context)),
                Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    width: wp(38, context),
                    text: "${Staticmenbers.listofUsers[cardindex!].compeny}",
                    fontSize: 15,
                    selectionColor:
                        Staticmenbers.listofUsers[cardindex!].color != null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
                            : whiteColor),
                SizedBox(height: hp(4, context)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Staticmenbers.listofUsers[cardindex!].color !=
                                null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
                            : whiteColor,
                        width: wp(0.2, context)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(90),
                    ),
                  ),
                  child: ClipOval(
                    child: Staticmenbers.listofUsers[cardindex!].image == ""
                        ? Image.asset(
                            "assets/images/splash1.png",
                            width: wp(22, context),
                            height: hp(11, context),
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            "${Staticmenbers.listofUsers[cardindex!].image}",
                            width: wp(22, context),
                            height: hp(11, context),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                SizedBox(height: hp(2, context)),
                Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    width: wp(35, context),
                    text: "${Staticmenbers.listofUsers[cardindex!].name}",
                    fontSize: 18,
                    selectionColor:
                        Staticmenbers.listofUsers[cardindex!].color != null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
                            : whiteColor),
                SizedBox(
                  height: hp(0.5, context),
                ),
                Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    width: wp(35, context),
                    text: "${Staticmenbers.listofUsers[cardindex!].department}",
                    fontSize: 12,
                    selectionColor:
                        Staticmenbers.listofUsers[cardindex!].color != null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
                            : whiteColor),
                SizedBox(height: hp(3, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (Staticmenbers.listofUsers[cardindex!].facebook == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                              },
                              child: Image.asset(
                                "assets/icon/Face.png",
                                scale: 30,
                                color: Staticmenbers
                                            .listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].telegram == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                              },
                              child: Image.asset(
                                "assets/icon/tele.png",
                                scale: 30,
                                color: Staticmenbers
                                            .listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].linkdin == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

                                await launchUrl(Uri.parse(url));
                              },
                              child: Image.asset(
                                "assets/icon/lin.png",
                                scale: 30,
                                color: Staticmenbers
                                            .listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].whatsapp == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                    Uri.parse(
                                        'https://wa.me/${Staticmenbers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Image.asset(
                                "assets/icon/whats.png",
                                scale: 30,
                                color: Staticmenbers
                                            .listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : whiteColor,
                              ),
                            ),
                          ),
                  ],
                )
              ],
            ),
            VerticalDivider(
                color: Colors.transparent, width: wp(6.75, context)),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              (Staticmenbers.listofUsers[cardindex!].website == "")
                  ? Container(
                      height: hp(5.2, context),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Textwidget(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          width: wp(50, context),
                          text:
                              "${Staticmenbers.listofUsers[cardindex!].website}",
                          fontSize: 15,
                          selectionColor: Staticmenbers
                                      .listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : whiteColor),
                    ),
              SizedBox(height: hp(1.3, context)),
              Container(
                decoration: BoxDecoration(
                    color: Staticmenbers.listofUsers[cardindex!].color != null
                        ? colorList[
                            Staticmenbers.listofUsers[cardindex!].color!]
                        : grayColor,
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
                          (Staticmenbers.listofUsers[cardindex!].phone == "")
                              ? Container(
                                  height: hp(2, context),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/call.png",
                                      scale: 30,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                          (Staticmenbers.listofUsers[cardindex!].phone == "")
                              ? Container(
                                  height: hp(2, context),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15),
                                  child: Textwidget(
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      width: 130,
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].phone}",
                                      fontSize: 12,
                                      selectionColor: whiteColor),
                                ),
                        ],
                      ),
                      Row(
                        children: [
                          (Staticmenbers.listofUsers[cardindex!].email == "")
                              ? Container(
                                  height: hp(2, context),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/email.png",
                                      scale: 30,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                          (Staticmenbers.listofUsers[cardindex!].email == "")
                              ? Container(
                                  height: hp(2, context),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15),
                                  child: SizedBox(
                                    width: wp(40, context),
                                    child: Textwidget(
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        width: 130,
                                        text:
                                            "${Staticmenbers.listofUsers[cardindex!].email}",
                                        fontSize: 12,
                                        selectionColor: whiteColor),
                                  ),
                                ),
                        ],
                      ),
                      Row(
                        children: [
                          (Staticmenbers.listofUsers[cardindex!].address == "")
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          backgroundColor: whiteColor,
                                          title: const Text("Address",
                                              style: TextStyle(
                                                  fontFamily: 'Marck',
                                                  fontSize: 25,
                                                  color: blueColor,
                                                  fontWeight: FontWeight.bold)),
                                          content: Text(
                                              '${Staticmenbers.listofUsers[cardindex!].address}',
                                              style: const TextStyle(
                                                  fontFamily: 'Marck',
                                                  fontSize: 20,
                                                  color: grayColor,
                                                  fontWeight: FontWeight.bold)),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButtomWidget(
                                                  onPressed: () {
                                                    _pushMap();
                                                  },
                                                  title: 'Use Map',
                                                  color: blueColor,
                                                ),
                                                TextButtomWidget(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  title: 'Cancle',
                                                  fontSize: 15,
                                                  color: Colors.redAccent,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/icon/pin.png",
                                      scale: 28,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                          (Staticmenbers.listofUsers[cardindex!].address == "")
                              ? Container(
                                  height: hp(2, context),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15),
                                  child: Textwidget(
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      width: 140,
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].address}",
                                      fontSize: 11,
                                      selectionColor: whiteColor),
                                ),
                        ],
                      ),
                      SizedBox(height: hp(2, context)),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: whiteColor, width: 1)),
                        child: QrImage(
                          dataModuleStyle:
                              const QrDataModuleStyle(color: whiteColor),
                          eyeStyle: const QrEyeStyle(color: whiteColor),
                          data:
                              "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                          size: 50,
                        ),
                      ),
                      SizedBox(height: hp(3, context)),
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

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[cardindex!].address}";

    await launchUrl(Uri.parse(googleUrl));
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: whiteColor,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: blueColor),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
