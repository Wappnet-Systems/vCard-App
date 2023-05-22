import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants_color.dart';
import '../../utils/responsive.dart';
import '../text_button_widget.dart';

class Cardtheme3 extends StatefulWidget {
  final int? id;
  const Cardtheme3({super.key, required this.id});

  @override
  State<Cardtheme3> createState() => _Cardtheme3State();
}

class _Cardtheme3State extends State<Cardtheme3> {
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
                      color: Staticmenbers.listofUsers[cardindex!].color != null
                          ? colorList[
                              Staticmenbers.listofUsers[cardindex!].color!]
                          : blackColor,
                      width: wp(0.5, context)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Staticmenbers.listofUsers[cardindex!].color != null
                          ? colorList[
                              Staticmenbers.listofUsers[cardindex!].color!]
                          : blackColor,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Textwidget(
                          textAlign: TextAlign.center,
                          width: wp(40, context),
                          text: "${Staticmenbers.listofUsers[cardindex!].name}",
                          fontSize: 20,
                          selectionColor: Staticmenbers
                                      .listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : blackColor),
                    ),
                    SizedBox(
                      height: hp(1, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Textwidget(
                          textAlign: TextAlign.center,
                          width: wp(40, context),
                          text:
                              "${Staticmenbers.listofUsers[cardindex!].department}",
                          fontSize: 14,
                          selectionColor: Staticmenbers
                                      .listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : blackColor),
                    ),
                    SizedBox(
                      height: hp(4, context),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: blueColor, width: 2)),
                          child: QrImage(
                            data:
                                "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                            size: 70,
                          ),
                        )),
                    SizedBox(height: hp(6, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Staticmenbers.listofUsers[cardindex!].telegram == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                                  },
                                  child: Image.asset(
                                    "assets/icon/tele.png",
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : blackColor,
                                  ),
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].link == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        'https://${Staticmenbers.listofUsers[cardindex!].link}';

                                    await launchUrl(Uri.parse(url));
                                  },
                                  child: Image.asset(
                                    "assets/icon/lin.png",
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : blackColor,
                                  ),
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].address == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        backgroundColor: blueColor,
                                        title: const Text("Address",
                                            style: TextStyle(
                                                fontFamily: 'Marck',
                                                fontSize: 25,
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold)),
                                        content: Text(
                                            '${Staticmenbers.listofUsers[cardindex!].address}',
                                            style: const TextStyle(
                                                fontFamily: 'Marck',
                                                fontSize: 25,
                                                color: whiteColor,
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
                                                fontSize: null,
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
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : blackColor,
                                  ),
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
                  color: Staticmenbers.listofUsers[cardindex!].color != null
                      ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
                      : blueColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: hp(14, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Staticmenbers.listofUsers[cardindex!].phone == ""
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/call.png",
                                    scale: 30,
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(width: wp(4, context)),
                                Textwidget(
                                    textAlign: TextAlign.start,
                                    width: wp(25, context),
                                    text:
                                        "${Staticmenbers.listofUsers[cardindex!].phone}",
                                    fontSize: 10,
                                    selectionColor: whiteColor),
                              ],
                            ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Staticmenbers.listofUsers[cardindex!].whatsapp == ""
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: wp(4, context)),
                              Staticmenbers
                                          .listofUsers[cardindex!].whatsapp ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Textwidget(
                                      textAlign: TextAlign.start,
                                      width: wp(25, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].whatsapp}",
                                      fontSize: 10,
                                      selectionColor: whiteColor),
                            ],
                          ),
                    SizedBox(height: hp(2, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Staticmenbers.listofUsers[cardindex!].email == ""
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                InkWell(
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
                                SizedBox(
                                  width: wp(4, context),
                                ),
                                Textwidget(
                                    textAlign: TextAlign.start,
                                    width: wp(30, context),
                                    text:
                                        "${Staticmenbers.listofUsers[cardindex!].email}",
                                    fontSize: 10,
                                    selectionColor: whiteColor),
                              ],
                            ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Staticmenbers.listofUsers[cardindex!].website == ""
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final url =
                                        'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                    await launchUrl(Uri.parse(url));
                                  },
                                  child: Image.asset(
                                    "assets/icon/website.png",
                                    scale: 30,
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: wp(4, context),
                                ),
                                Textwidget(
                                    textAlign: TextAlign.start,
                                    width: wp(30, context),
                                    text:
                                        "${Staticmenbers.listofUsers[cardindex!].website}",
                                    fontSize: 10,
                                    selectionColor: whiteColor),
                              ],
                            ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Staticmenbers.listofUsers[cardindex!].facebook == ""
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/Face.png",
                                    scale: 30,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: wp(4, context),
                              ),
                              Textwidget(
                                  textAlign: TextAlign.start,
                                  width: wp(30, context),
                                  text:
                                      "${Staticmenbers.listofUsers[cardindex!].facebook}",
                                  fontSize: 10,
                                  selectionColor: whiteColor),
                            ],
                          )
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
                  boxShadow: const [
                    BoxShadow(
                      color: blackColor,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Center(
                    child: Textwidget(
                        textAlign: TextAlign.start,
                        width: wp(50, context),
                        text:
                            "${Staticmenbers.listofUsers[cardindex!].compeny}",
                        fontSize: 18,
                        selectionColor: whiteColor),
                  ),
                ),
              )),
        ]),
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
