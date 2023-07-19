import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants.dart';
import '../custom_alartdialog.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: hp(35, context),
          decoration: BoxDecoration(
            color: COLOR_PRIMARY_DARK,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Staticmenbers.cardUsers[contactcardindex!].color != null
                    ? colorList[
                        Staticmenbers.cardUsers[contactcardindex!].color!]
                    : COLOR_PRIMARY_LIGHT,
                width: wp(0.4, context)),
            boxShadow: const [
              BoxShadow(
                color: COLOR_PRIMARY_LIGHT,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 8,
                child: Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    width: wp(90, context),
                    text:
                        "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                    fontSize: 18,
                    selectionColor:
                        Staticmenbers.cardUsers[contactcardindex!].color != null
                            ? colorList[Staticmenbers
                                .cardUsers[contactcardindex!].color!]
                            : COLOR_WHITE),
              ),
              Row(children: [
                Column(
                  children: [
                    SizedBox(height: hp(7, context)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Staticmenbers
                                        .cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_PRIMARY_DARK,
                            width: wp(0.2, context)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(90),
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "${Staticmenbers.cardUsers[contactcardindex!].image}",
                          width: wp(22, context),
                          height: hp(10.5, context),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(44, context),
                        text:
                            "${Staticmenbers.cardUsers[contactcardindex!].name}",
                        fontSize: 18,
                        selectionColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_WHITE),
                    SizedBox(
                      height: hp(0.5, context),
                    ),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(44, context),
                        text:
                            "${Staticmenbers.cardUsers[contactcardindex!].department}",
                        fontSize: 12,
                        selectionColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_WHITE),
                    SizedBox(height: hp(5, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (Staticmenbers.cardUsers[contactcardindex!].facebook ==
                                "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/Face.png",
                                    scale: 30,
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                        (Staticmenbers.cardUsers[contactcardindex!].telegram ==
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
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                        (Staticmenbers.cardUsers[contactcardindex!].linkdin ==
                                "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        'https://www.linkedin.com//${Staticmenbers.cardUsers[contactcardindex!].linkdin}';

                                    await launchUrl(Uri.parse(url));
                                  },
                                  child: Image.asset(
                                    "assets/icon/lin.png",
                                    scale: 30,
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                        (Staticmenbers.cardUsers[contactcardindex!].whatsapp ==
                                "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse(
                                            'https://wa.me/${Staticmenbers.cardUsers[contactcardindex!].whatsapp}?text=Hi'),
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Image.asset(
                                    "assets/icon/whats.png",
                                    scale: 30,
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                        (Staticmenbers.cardUsers[contactcardindex!].whatsapp ==
                                "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://${Staticmenbers.cardUsers[contactcardindex!].website}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/website.png",
                                    scale: 30,
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                      ],
                    )
                  ],
                ),
                VerticalDivider(
                    color: Colors.transparent, width: wp(1, context)),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    decoration: BoxDecoration(
                        color:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_PRIMARY_LIGHT,
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
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/call.png",
                                    scale: 30,
                                    color: COLOR_WHITE,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 15),
                                child: Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: 130,
                                    text:
                                        "${Staticmenbers.cardUsers[contactcardindex!].phone}",
                                    fontSize: 10,
                                    selectionColor: COLOR_WHITE),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/email.png",
                                    scale: 30,
                                    color: COLOR_WHITE,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 15),
                                child: SizedBox(
                                  width: wp(40, context),
                                  child: Textwidget(
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      width: 130,
                                      text:
                                          "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                      fontSize: 10,
                                      selectionColor: COLOR_WHITE),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, top: 15),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => CustomAlartDialog(
                                              title: const Textwidget(
                                                  text: "Address",
                                                  textAlign: TextAlign.center),
                                              content: Textwidget(
                                                text:
                                                    '${Staticmenbers.cardUsers[contactcardindex!].address}',
                                                textAlign: TextAlign.center,
                                                maxLines: 5,
                                                selectionColor:
                                                    COLOR_PRIMARY_LIGHT,
                                              ),
                                              onPressedNo: () {
                                                Navigator.pop(context);
                                              },
                                              onPressedYes: () {
                                                _pushMap();
                                              },
                                            ));
                                  },
                                  child: Image.asset(
                                    "assets/icon/pin.png",
                                    scale: 28,
                                    color: COLOR_WHITE,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 15),
                                child: Textwidget(
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    width: 140,
                                    text:
                                        "${Staticmenbers.cardUsers[contactcardindex!].address}",
                                    fontSize: 10,
                                    selectionColor: COLOR_WHITE),
                              ),
                            ],
                          ),
                          SizedBox(height: hp(2, context)),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: COLOR_WHITE,
                                    width: wp(0.3, context))),
                            child: QrImage(
                              dataModuleStyle:
                                  const QrDataModuleStyle(color: COLOR_WHITE),
                              eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                              data:
                                  "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                              size: 60,
                            ),
                          ),
                          SizedBox(height: hp(3, context)),
                        ],
                      ),
                    ),
                  )
                ]),
              ]),
            ],
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
        color: COLOR_WHITE,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: COLOR_PRIMARY_DARK),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
