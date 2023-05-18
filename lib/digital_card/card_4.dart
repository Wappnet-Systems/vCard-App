import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/widget/text_widget.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';

class Cardtheme4 extends StatefulWidget {
  final int? id;
  const Cardtheme4({super.key, required this.id});

  @override
  State<Cardtheme4> createState() => _Cardtheme4State();
}

class _Cardtheme4State extends State<Cardtheme4> {
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
    return Scaffold(
      body: Center(
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
                      color: WHITE_COLOR,
                      border: Border.all(
                          color: Staticmenbers.listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : BLACK_COLOR,
                          width: wp(0.5, context)),
                      boxShadow: [
                        BoxShadow(
                          color: Staticmenbers.listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : BLACK_COLOR,
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
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Center(
                                      child: Textwidget(
                                    width: wp(180, context),
                                    text:
                                        "${Staticmenbers.listofUsers[cardindex!].compeny}",
                                    fontSize: 18,
                                    selectionColor: BLUE_COLOR,
                                  )),
                                ),
                                SizedBox(
                                  height: hp(8, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Textwidget(
                                      width: wp(50, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].phone}",
                                      fontSize: 12,
                                      selectionColor: BLUE_COLOR,
                                    )),
                                SizedBox(
                                  height: hp(2, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Textwidget(
                                      width: wp(50, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].whatsapp}",
                                      fontSize: 12,
                                      selectionColor: BLUE_COLOR,
                                    )),
                                SizedBox(
                                  height: hp(2.2, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Textwidget(
                                      width: wp(100, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].email}",
                                      fontSize: 12,
                                      selectionColor: BLUE_COLOR,
                                    )),
                                SizedBox(
                                  height: hp(2.3, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Textwidget(
                                      width: wp(100, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].website}",
                                      fontSize: 12,
                                      selectionColor: BLUE_COLOR,
                                    )),
                                SizedBox(
                                  height: hp(2.5, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Textwidget(
                                        width: wp(100, context),
                                        text:
                                            "${Staticmenbers.listofUsers[cardindex!].facebook}",
                                        fontSize: 12,
                                        selectionColor: BLUE_COLOR))
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
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Textwidget(
                                      width: wp(40, context),
                                      text:
                                          "${Staticmenbers.listofUsers[cardindex!].name}",
                                      fontSize: 20,
                                      selectionColor: BLUE_COLOR,
                                    )),
                                SizedBox(
                                  height: hp(1, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Textwidget(
                                        width: wp(41, context),
                                        text:
                                            "${Staticmenbers.listofUsers[cardindex!].department}",
                                        fontSize: 14,
                                        selectionColor: BLUE_COLOR)),
                                SizedBox(
                                  height: hp(5, context),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: BLUE_COLOR, width: 2)),
                                      child: QrImage(
                                        data:
                                            "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
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
                                      child: InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram"));
                                        },
                                        child: Image.asset(
                                          "assets/icon/tele.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .listofUsers[cardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color!]
                                              : BLUE_COLOR,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: InkWell(
                                        onTap: () async {
                                          final url =
                                              'https://${Staticmenbers.listofUsers[cardindex!].link}';

                                          await launchUrl(Uri.parse(url));
                                        },
                                        child: Image.asset(
                                          "assets/icon/lin.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .listofUsers[cardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color!]
                                              : BLUE_COLOR,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
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
                                                  '${Staticmenbers.listofUsers[cardindex!].address}',
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
                                                      .listofUsers[cardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color!]
                                              : BLUE_COLOR,
                                        ),
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
                      color: Staticmenbers.listofUsers[cardindex!].color != null
                          ? colorList[
                              Staticmenbers.listofUsers[cardindex!].color!]
                          : BLACK_COLOR,
                      boxShadow: [
                        BoxShadow(
                          color: Staticmenbers.listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : BLACK_COLOR,
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
                              InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                },
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
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
                              child: InkWell(
                                onTap: () {
                                  launchUrl(
                                      Uri.parse(
                                          'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
                                      mode: LaunchMode.externalApplication);
                                },
                                child: Image.asset(
                                  "assets/icon/whats.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
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
                              InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                                },
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
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
                              InkWell(
                                onTap: () async {
                                  final url =
                                      'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                  await launchUrl(Uri.parse(url));
                                },
                                child: Image.asset(
                                  "assets/icon/website.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
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
                              child: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                },
                                child: Image.asset(
                                  "assets/icon/Face.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
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
                      color: Staticmenbers.listofUsers[cardindex!].color != null
                          ? colorList[
                              Staticmenbers.listofUsers[cardindex!].color!]
                          : BLACK_COLOR,
                      boxShadow: [
                        BoxShadow(
                          color: Staticmenbers.listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : BLACK_COLOR,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
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
