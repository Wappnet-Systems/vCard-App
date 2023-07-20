import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';
import '../text_widget.dart';

class Contectcardtheme4 extends StatefulWidget {
  final int? id;
  const Contectcardtheme4({super.key, required this.id});

  @override
  State<Contectcardtheme4> createState() => _Contectcardtheme4State();
}

class _Contectcardtheme4State extends State<Contectcardtheme4> {
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
    return Center(
      child: Padding(
        padding: EdgeInsets.all(wp(2, context)),
        child: Stack(children: [
          Container(
            width: wp(95, context),
            height: hp(38, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: COLOR_WHITE,
              border: Border.all(
                color: Staticmenbers.cardUsers[contactcardindex!].color != null
                    ? colorList[
                        Staticmenbers.cardUsers[contactcardindex!].color!]
                    : COLOR_PRIMARY_DARK,
                width: wp(0.5, context),
              ),
              boxShadow: [
                BoxShadow(
                  color: Staticmenbers.cardUsers[contactcardindex!].color !=
                          null
                      ? colorList[
                              Staticmenbers.cardUsers[contactcardindex!].color!]
                          .withOpacity(0.5)
                      : COLOR_PRIMARY_DARK.withOpacity(0.5),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2, context),
                      horizontal: wp(1, context),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: textMediumTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: hp(6, context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: wp(10, context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+${Staticmenbers.cardUsers[contactcardindex!].country} ${Staticmenbers.cardUsers[contactcardindex!].phone}",
                                textAlign: TextAlign.start,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                              SizedBox(
                                height: hp(3, context),
                              ),
                              Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                textAlign: TextAlign.start,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                              SizedBox(
                                height: hp(3, context),
                              ),
                              Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].address}",
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                style: smallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                              SizedBox(
                                height: hp(2, context),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: wp(10, context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: COLOR_PRIMARY, width: 1),
                                ),
                                child: QrImage(
                                  data:
                                      "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                                  size: dp(60, context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  endIndent: hp(4, context),
                  indent: hp(4, context),
                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                  thickness: 1,
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: hp(5, context),
                      left: wp(2, context),
                      right: wp(2, context),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${Staticmenbers.cardUsers[contactcardindex!].name}",
                          textAlign: TextAlign.center,
                          style: textMediumTextStyle,
                        ),
                        SizedBox(
                          height: hp(1, context),
                        ),
                        Text(
                          "${Staticmenbers.cardUsers[contactcardindex!].department}",
                          textAlign: TextAlign.center,
                          style: textMediumTextStyle.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: hp(4, context),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .cardUsers[contactcardindex!].color!]
                              : COLOR_PRIMARY_DARK,
                          child: ClipOval(
                            child: Image.network(
                              "${Staticmenbers.cardUsers[contactcardindex!].image}",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: hp(6, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Staticmenbers
                                        .cardUsers[contactcardindex!].website ==
                                    ""
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () async {
                                      final url =
                                          'https://${Staticmenbers.cardUsers[contactcardindex!].website}';

                                      await launchUrl(Uri.parse(url));
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
                                          : COLOR_PRIMARY_DARK,
                                    ),
                                  ),
                            Staticmenbers.cardUsers[contactcardindex!]
                                        .telegram ==
                                    ""
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          "https://telegram.me/$Staticmenbers.cardUsers[contactcardindex!].telegram"));
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
                                          : COLOR_PRIMARY_DARK,
                                    ),
                                  ),
                            Staticmenbers
                                        .cardUsers[contactcardindex!].linkdin ==
                                    ""
                                ? const SizedBox.shrink()
                                : InkWell(
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
                                          : COLOR_PRIMARY_DARK,
                                    ),
                                  ),
                            Staticmenbers.cardUsers[contactcardindex!]
                                        .whatsapp ==
                                    ""
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      launchUrl(
                                          Uri.parse(
                                              'https://wa.me/$Staticmenbers.cardUsers[contactcardindex!].whatsapp?text=Hi'),
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
                                          : COLOR_PRIMARY_DARK,
                                    ),
                                  ),
                            Staticmenbers.cardUsers[contactcardindex!]
                                        .facebook ==
                                    ""
                                ? const SizedBox.shrink()
                                : InkWell(
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
                                          : COLOR_PRIMARY_DARK,
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: hp(9, context),
            left: wp(0, context),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: hp(2.5, context),
                horizontal: wp(2.5, context),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Staticmenbers.cardUsers[contactcardindex!].color != null
                    ? colorList[
                        Staticmenbers.cardUsers[contactcardindex!].color!]
                    : COLOR_PRIMARY_DARK,
                boxShadow: [
                  BoxShadow(
                    color: Staticmenbers.cardUsers[contactcardindex!].color !=
                            null
                        ? colorList[
                            Staticmenbers.cardUsers[contactcardindex!].color!]
                        : COLOR_PRIMARY_DARK,
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                    },
                    child: Image.asset(
                      "assets/icon/call.png",
                      scale: 35,
                      color: COLOR_WHITE,
                    ),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Staticmenbers.cardUsers[contactcardindex!].email == ""
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                          },
                          child: Image.asset(
                            "assets/icon/email.png",
                            scale: 35,
                            color: COLOR_WHITE,
                          ),
                        ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  InkWell(
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
                ],
              ),
            ),
          ),
        ]),
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
