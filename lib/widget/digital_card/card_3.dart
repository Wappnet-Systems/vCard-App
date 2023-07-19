import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';

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
                          : COLOR_PRIMARY_DARK,
                      width: wp(0.3, context)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: COLOR_WHITE,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: hp(5, context),
                    ),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(40, context),
                        text: "${Staticmenbers.listofUsers[cardindex!].name}",
                        fontSize: 20,
                        selectionColor:
                            Staticmenbers.listofUsers[cardindex!].color != null
                                ? colorList[Staticmenbers
                                    .listofUsers[cardindex!].color!]
                                : COLOR_PRIMARY_DARK),
                    SizedBox(height: hp(1, context)),
                    Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(40, context),
                        text:
                            "${Staticmenbers.listofUsers[cardindex!].department}",
                        fontSize: 14,
                        selectionColor:
                            Staticmenbers.listofUsers[cardindex!].color != null
                                ? colorList[Staticmenbers
                                    .listofUsers[cardindex!].color!]
                                : COLOR_PRIMARY_DARK),
                    SizedBox(
                      height: hp(4, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  Staticmenbers.listofUsers[cardindex!].color !=
                                          null
                                      ? colorList[Staticmenbers
                                          .listofUsers[cardindex!].color!]
                                      : COLOR_PRIMARY_DARK,
                              width: wp(0.2, context)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(90),
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "${Staticmenbers.listofUsers[cardindex!].image}",
                            width: wp(23, context),
                            height: hp(11, context),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(6, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Staticmenbers.listofUsers[cardindex!].facebook == ""
                            ? const SizedBox.shrink()
                            : InkWell(
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
                                      : COLOR_PRIMARY_DARK,
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].website == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                    await launchUrl(Uri.parse(url));
                                  },
                                  child: Image.asset(
                                    "assets/icon/website.png",
                                    scale: 30,
                                    color: Staticmenbers.listofUsers[cardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .listofUsers[cardindex!].color!]
                                        : COLOR_PRIMARY_DARK,
                                  ),
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].telegram == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                                        : COLOR_PRIMARY_DARK,
                                  ),
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].linkdin == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                                        : COLOR_PRIMARY_DARK,
                                  ),
                                ),
                              ),
                        Staticmenbers.listofUsers[cardindex!].whatsapp == ""
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () async {
                                    launchUrl(
                                        Uri.parse(
                                            'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
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
                                        : COLOR_PRIMARY_DARK,
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
                      : COLOR_PRIMARY_DARK,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: hp(12, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          InkWell(
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
                          SizedBox(width: wp(2, context)),
                          Textwidget(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              width: wp(25, context),
                              text:
                                  "${Staticmenbers.listofUsers[cardindex!].phone}",
                              fontSize: 10,
                              selectionColor: COLOR_WHITE),
                        ],
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
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
                              color: COLOR_WHITE,
                            ),
                          ),
                          SizedBox(
                            width: wp(2, context),
                          ),
                          Textwidget(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              width: wp(37, context),
                              text:
                                  "${Staticmenbers.listofUsers[cardindex!].email}",
                              fontSize: 10,
                              selectionColor: COLOR_WHITE),
                        ],
                      ),
                    ),
                    SizedBox(height: hp(2, context)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
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
                                              '${Staticmenbers.listofUsers[cardindex!].address}',
                                          textAlign: TextAlign.center,
                                          maxLines: 5,
                                          selectionColor: COLOR_PRIMARY_LIGHT,
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
                              scale: 30,
                              color: COLOR_WHITE,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wp(2, context),
                        ),
                        Textwidget(
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            width: wp(37, context),
                            text:
                                "${Staticmenbers.listofUsers[cardindex!].address}",
                            fontSize: 9,
                            selectionColor: COLOR_WHITE),
                      ],
                    ),
                    SizedBox(height: hp(2, context)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: COLOR_WHITE, width: wp(0.3, context))),
                      child: QrImage(
                        dataModuleStyle:
                            const QrDataModuleStyle(color: COLOR_WHITE),
                        eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                        data:
                            "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                        size: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 20,
              right: 3,
              child: Container(
                width: wp(53, context),
                height: hp(8, context),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Colors.grey.shade600,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Center(
                    child: Textwidget(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        width: wp(60, context),
                        text:
                            "${Staticmenbers.listofUsers[cardindex!].compeny}",
                        fontSize: 12,
                        selectionColor: COLOR_WHITE),
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
