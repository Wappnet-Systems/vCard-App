import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants.dart';

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
            color: COLOR_PRIMARY_DARK,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Staticmenbers.listofUsers[cardindex!].color != null
                    ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
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
                    text: "${Staticmenbers.listofUsers[cardindex!].compeny}",
                    fontSize: 18,
                    selectionColor:
                        Staticmenbers.listofUsers[cardindex!].color != null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
                            : COLOR_WHITE),
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: hp(7, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  Staticmenbers.listofUsers[cardindex!].color !=
                                          null
                                      ? colorList[Staticmenbers
                                          .listofUsers[cardindex!].color!]
                                      : COLOR_WHITE,
                              width: wp(0.2, context)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(90),
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "${Staticmenbers.listofUsers[cardindex!].image}",
                            width: wp(22, context),
                            height: hp(10.5, context),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(44, context),
                        text: "${Staticmenbers.listofUsers[cardindex!].name}",
                        fontSize: 18,
                        selectionColor:
                            Staticmenbers.listofUsers[cardindex!].color != null
                                ? colorList[Staticmenbers
                                    .listofUsers[cardindex!].color!]
                                : COLOR_WHITE),
                    SizedBox(
                      height: hp(0.5, context),
                    ),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(44, context),
                        text:
                            "${Staticmenbers.listofUsers[cardindex!].department}",
                        fontSize: 12,
                        selectionColor:
                            Staticmenbers.listofUsers[cardindex!].color != null
                                ? colorList[Staticmenbers
                                    .listofUsers[cardindex!].color!]
                                : COLOR_WHITE),
                    SizedBox(height: hp(5, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (Staticmenbers.listofUsers[cardindex!].facebook == "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(
                                  left: 11,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/Face.png",
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : COLOR_WHITE,
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
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : COLOR_WHITE,
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
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : COLOR_WHITE,
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
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : COLOR_WHITE,
                                  ),
                                ),
                              ),
                        (Staticmenbers.listofUsers[cardindex!].whatsapp == "")
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://${Staticmenbers.listofUsers[cardindex!].website}'));
                                  },
                                  child: Image.asset(
                                    "assets/icon/website.png",
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
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
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: hp(1.3, context)),
                      Container(
                        decoration: BoxDecoration(
                            color:
                                Staticmenbers.listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
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
                                            'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
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
                                            "${Staticmenbers.listofUsers[cardindex!].phone}",
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
                                            'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
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
                                              "${Staticmenbers.listofUsers[cardindex!].email}",
                                          fontSize: 10,
                                          selectionColor: COLOR_WHITE),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => CustomAlartDialog(
                                                title: const Textwidget(
                                                    text: "Address",
                                                    textAlign:
                                                        TextAlign.center),
                                                content: Textwidget(
                                                  text:
                                                      '${Staticmenbers.listofUsers[cardindex!].address}',
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 15),
                                    child: Textwidget(
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        width: 140,
                                        text:
                                            "${Staticmenbers.listofUsers[cardindex!].address}",
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
                                        color: COLOR_WHITE, width: 0.3)),
                                child: QrImage(
                                  dataModuleStyle: const QrDataModuleStyle(
                                      color: COLOR_WHITE),
                                  eyeStyle:
                                      const QrEyeStyle(color: COLOR_WHITE),
                                  data:
                                      "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
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
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[cardindex!].address}";

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
