import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';
import '../widget/text_widget.dart';

class Contectcardtheme3 extends StatefulWidget {
  final int? id;
  const Contectcardtheme3({super.key, required this.id});

  @override
  State<Contectcardtheme3> createState() => _Contectcardtheme3State();
}

class _Contectcardtheme3State extends State<Contectcardtheme3> {
  int? contactcardindex;
  FToast? fToast;
  @override
  void initState() {
    contactcardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Center(
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
                        color: Staticmenbers
                                    .listofUsers[contactcardindex!].color !=
                                null
                            ? colorList[Staticmenbers
                                .listofUsers[contactcardindex!].color!]
                            : BLACK_COLOR,
                        width: wp(0.5, context)),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    color: WHITE_COLOR,
                    boxShadow: [
                      BoxShadow(
                        color: Staticmenbers
                                    .listofUsers[contactcardindex!].color !=
                                null
                            ? colorList[Staticmenbers
                                .listofUsers[contactcardindex!].color!]
                            : BLACK_COLOR,
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
                            width: wp(40, context),
                            text:
                                "${Staticmenbers.listofUsers[contactcardindex!].name}",
                            fontSize: 20,
                            selectionColor: Staticmenbers
                                        .listofUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .listofUsers[contactcardindex!].color!]
                                : BLACK_COLOR),
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Textwidget(
                            width: wp(40, context),
                            text:
                                "${Staticmenbers.listofUsers[contactcardindex!].department}",
                            fontSize: 14,
                            selectionColor: Staticmenbers
                                        .listofUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .listofUsers[contactcardindex!].color!]
                                : BLACK_COLOR),
                      ),
                      SizedBox(
                        height: hp(4, context),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: BLUE_COLOR, width: 2)),
                            child: QrImage(
                              data:
                                  "${Staticmenbers.listofUsers[contactcardindex!].user} ${Staticmenbers.listofUsers[contactcardindex!].id}",
                              size: 70,
                            ),
                          )),
                      SizedBox(height: hp(4, context)),
                      Center(
                        child: Row(
                          children: [
                            Staticmenbers.listofUsers[contactcardindex!]
                                        .telegram ==
                                    ""
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://telegram.me/${Staticmenbers.listofUsers[contactcardindex!].telegram}"));
                                      },
                                      child: Image.asset(
                                        "assets/icon/tele.png",
                                        scale: 30,
                                        color: Staticmenbers
                                                    .listofUsers[
                                                        contactcardindex!]
                                                    .color !=
                                                null
                                            ? colorList[Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .color!]
                                            : BLACK_COLOR,
                                      ),
                                    ),
                                  ),
                            Staticmenbers.listofUsers[contactcardindex!].link ==
                                    ""
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () async {
                                        final url =
                                            'https://${Staticmenbers.listofUsers[contactcardindex!].link}';

                                        await launchUrl(Uri.parse(url));
                                      },
                                      child: Image.asset(
                                        "assets/icon/lin.png",
                                        scale: 30,
                                        color: Staticmenbers
                                                    .listofUsers[
                                                        contactcardindex!]
                                                    .color !=
                                                null
                                            ? colorList[Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .color!]
                                            : BLACK_COLOR,
                                      ),
                                    ),
                                  ),
                            Staticmenbers.listofUsers[contactcardindex!]
                                        .address ==
                                    ""
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            backgroundColor: BLUE_COLOR,
                                            title: const Text("Address",
                                                style: TextStyle(
                                                    fontFamily: 'Marck',
                                                    fontSize: 25,
                                                    color: WHITE_COLOR,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                '${Staticmenbers.listofUsers[contactcardindex!].address}',
                                                style: const TextStyle(
                                                    fontFamily: 'Marck',
                                                    fontSize: 25,
                                                    color: WHITE_COLOR,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                    color: BLUE_COLOR,
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
                                        color: Staticmenbers
                                                    .listofUsers[
                                                        contactcardindex!]
                                                    .color !=
                                                null
                                            ? colorList[Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .color!]
                                            : BLACK_COLOR,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
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
                    color: Staticmenbers.listofUsers[contactcardindex!].color !=
                            null
                        ? colorList[
                            Staticmenbers.listofUsers[contactcardindex!].color!]
                        : BLUE_COLOR,
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
                        child: Staticmenbers
                                    .listofUsers[contactcardindex!].phone ==
                                ""
                            ? const SizedBox.shrink()
                            : Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'tel:+${Staticmenbers.listofUsers[contactcardindex!].phone.toString()}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/call.png",
                                      scale: 30,
                                      color: WHITE_COLOR,
                                    ),
                                  ),
                                  SizedBox(width: wp(4, context)),
                                  Textwidget(
                                      width: wp(25, context),
                                      text:
                                          "${Staticmenbers.listofUsers[contactcardindex!].phone}",
                                      fontSize: 10,
                                      selectionColor: WHITE_COLOR),
                                ],
                              ),
                      ),
                      SizedBox(height: hp(2, context)),
                      Staticmenbers.listofUsers[contactcardindex!].whatsapp ==
                              ""
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(
                                          Uri.parse(
                                              'https://wa.me/${Staticmenbers.listofUsers[contactcardindex!].whatsapp}?text=Hi'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Image.asset(
                                      "assets/icon/whats.png",
                                      scale: 30,
                                      color: WHITE_COLOR,
                                    ),
                                  ),
                                ),
                                SizedBox(width: wp(4, context)),
                                Textwidget(
                                    width: wp(25, context),
                                    text:
                                        "${Staticmenbers.listofUsers[contactcardindex!].whatsapp}",
                                    fontSize: 10,
                                    selectionColor: WHITE_COLOR),
                              ],
                            ),
                      SizedBox(height: hp(2, context)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Staticmenbers
                                    .listofUsers[contactcardindex!].email ==
                                ""
                            ? const SizedBox.shrink()
                            : Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'mailto:${Staticmenbers.listofUsers[contactcardindex!].email}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/email.png",
                                      scale: 30,
                                      color: WHITE_COLOR,
                                    ),
                                  ),
                                  SizedBox(
                                    width: wp(4, context),
                                  ),
                                  Textwidget(
                                      width: wp(30, context),
                                      text:
                                          "${Staticmenbers.listofUsers[contactcardindex!].email}",
                                      fontSize: 10,
                                      selectionColor: WHITE_COLOR),
                                ],
                              ),
                      ),
                      SizedBox(height: hp(2, context)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Staticmenbers
                                    .listofUsers[contactcardindex!].website ==
                                ""
                            ? const SizedBox.shrink()
                            : Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final url =
                                          'https://${Staticmenbers.listofUsers[contactcardindex!].website}';

                                      await launchUrl(Uri.parse(url));
                                    },
                                    child: Image.asset(
                                      "assets/icon/website.png",
                                      scale: 30,
                                      color: WHITE_COLOR,
                                    ),
                                  ),
                                  SizedBox(
                                    width: wp(4, context),
                                  ),
                                  Textwidget(
                                      width: wp(30, context),
                                      text:
                                          "${Staticmenbers.listofUsers[contactcardindex!].website}",
                                      fontSize: 10,
                                      selectionColor: WHITE_COLOR),
                                ],
                              ),
                      ),
                      SizedBox(height: hp(2, context)),
                      Staticmenbers.listofUsers[contactcardindex!].facebook ==
                              ""
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://www.facebook.com/{${Staticmenbers.listofUsers[contactcardindex!].facebook}}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/Face.png",
                                      scale: 30,
                                      color: WHITE_COLOR,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: wp(4, context),
                                ),
                                Textwidget(
                                    width: wp(30, context),
                                    text:
                                        "${Staticmenbers.listofUsers[contactcardindex!].facebook}",
                                    fontSize: 10,
                                    selectionColor: WHITE_COLOR),
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
                        color: BLACK_COLOR,
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Center(
                      child: Textwidget(
                          width: wp(50, context),
                          text:
                              "${Staticmenbers.listofUsers[contactcardindex!].compeny}",
                          fontSize: 18,
                          selectionColor: WHITE_COLOR),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[contactcardindex!].address}";

    await launchUrl(Uri.parse(googleUrl));
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: WHITE_COLOR,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: BLUE_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
