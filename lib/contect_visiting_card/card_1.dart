import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/text_widget.dart';
import '../utils/constants_color.dart';
import '../widget/text_button_widget.dart';

class Contectcardtheme1 extends StatefulWidget {
  final int? id;
  const Contectcardtheme1({
    super.key,
    required this.id,
  });

  @override
  State<Contectcardtheme1> createState() => _Contectcardtheme1State();
}

class _Contectcardtheme1State extends State<Contectcardtheme1> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: hp(35, context),
            decoration: BoxDecoration(
              color: BLUE_COLOR,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color:
                      Staticmenbers.cardUsers[contactcardindex!].color != null
                          ? colorList[
                              Staticmenbers.cardUsers[contactcardindex!].color!]
                          : GRAY,
                  width: wp(0.4, context)),
              boxShadow: const [
                BoxShadow(
                  color: GRAY,
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
                        width: wp(36, context),
                        text:
                            "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                        fontSize: 15,
                        selectionColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : WHITE_COLOR),
                    SizedBox(height: hp(5, context)),
                    ClipOval(
                      child:
                          Staticmenbers.cardUsers[contactcardindex!].image == ""
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(23, context),
                                  height: hp(11, context),
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  "${Staticmenbers.cardUsers[contactcardindex!].image}",
                                  width: wp(23, context),
                                  height: hp(11, context),
                                  fit: BoxFit.fill,
                                ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Textwidget(
                        width: wp(35, context),
                        text:
                            "${Staticmenbers.cardUsers[contactcardindex!].name}",
                        fontSize: 18,
                        selectionColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : WHITE_COLOR),
                    SizedBox(
                      height: hp(0.5, context),
                    ),
                    Textwidget(
                        width: wp(35, context),
                        text:
                            "${Staticmenbers.cardUsers[contactcardindex!].department}",
                        fontSize: 12,
                        selectionColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : WHITE_COLOR),
                  ],
                ),
              ),
              VerticalDivider(color: Colors.transparent, width: 22),
              Column(children: [
                (Staticmenbers.cardUsers[contactcardindex!].website == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Textwidget(
                            width: wp(50, context),
                            text:
                                "${Staticmenbers.cardUsers[contactcardindex!].website}",
                            fontSize: 15,
                            selectionColor: Staticmenbers
                                        .cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : WHITE_COLOR),
                      ),
                SizedBox(height: hp(1.3, context)),
                Container(
                  decoration: BoxDecoration(
                      color: Staticmenbers.cardUsers[contactcardindex!].color !=
                              null
                          ? colorList[
                              Staticmenbers.cardUsers[contactcardindex!].color!]
                          : GRAY,
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
                              child: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                                },
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 15),
                              child: Textwidget(
                                  width: 130,
                                  text:
                                      "${Staticmenbers.cardUsers[contactcardindex!].phone}",
                                  fontSize: 12,
                                  selectionColor: WHITE_COLOR),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding:
                                        const EdgeInsets.only(left: 3, top: 15),
                                    child: InkWell(
                                      onTap: () {
                                        launchUrl(
                                            Uri.parse(
                                                'https://wa.me/${Staticmenbers.cardUsers[contactcardindex!].whatsapp}?text=Hi'),
                                            mode:
                                                LaunchMode.externalApplication);
                                      },
                                      child: Image.asset(
                                        "assets/icon/whats.png",
                                        scale: 30,
                                        color: WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 15),
                                    child: Textwidget(
                                        width: 130,
                                        text:
                                            "${Staticmenbers.cardUsers[contactcardindex!].whatsapp}",
                                        fontSize: 12,
                                        selectionColor: WHITE_COLOR),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3, top: 15),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                                },
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 30,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 15),
                              child: SizedBox(
                                width: wp(40, context),
                                child: Textwidget(
                                    width: 130,
                                    text:
                                        "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                    fontSize: 12,
                                    selectionColor: WHITE_COLOR),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: hp(0.5, context)),
                        QrImage(
                          data:
                              "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                          size: 60,
                        ),
                        SizedBox(height: hp(2, context)),
                        Row(
                          children: [
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .facebook ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                      left: 50,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                                      },
                                      child: Image.asset(
                                        "assets/icon/Face.png",
                                        scale: 30,
                                        color: WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .telegram ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://telegram.me/${Staticmenbers.cardUsers[contactcardindex!].telegram}"));
                                      },
                                      child: Image.asset(
                                        "assets/icon/tele.png",
                                        scale: 30,
                                        color: WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                            (Staticmenbers.cardUsers[contactcardindex!].link ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: InkWell(
                                      onTap: () async {
                                        final url =
                                            'https://${Staticmenbers.cardUsers[contactcardindex!].link}';

                                        await launchUrl(Uri.parse(url));
                                      },
                                      child: Image.asset(
                                        "assets/icon/lin.png",
                                        scale: 30,
                                        color: WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                            (Staticmenbers
                                        .cardUsers[contactcardindex!].address ==
                                    "")
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 15),
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
                                                '${Staticmenbers.cardUsers[contactcardindex!].address}',
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
                                                    color: BLUEGRAY,
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
                                        color: WHITE_COLOR,
                                      ),
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
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.cardUsers[contactcardindex!].address}";

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
