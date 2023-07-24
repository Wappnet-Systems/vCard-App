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
    return Center(
      child: Padding(
        padding: EdgeInsets.all(wp(2, context)),
        child: Stack(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: hp(30, context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2, context),
                      horizontal: wp(3, context),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_PRIMARY_DARK,
                        width: wp(0.3, context),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: COLOR_WHITE,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${Staticmenbers.cardUsers[contactcardindex!].name}",
                          textAlign: TextAlign.center,
                          style: smalltitleTextStyle.copyWith(
                              color: Staticmenbers
                                          .cardUsers[contactcardindex!].color !=
                                      null
                                  ? colorList[Staticmenbers
                                      .cardUsers[contactcardindex!].color!]
                                  : COLOR_PRIMARY_DARK),
                        ),
                        SizedBox(
                          height: hp(1, context),
                        ),
                        Text(
                          "${Staticmenbers.cardUsers[contactcardindex!].department}",
                          textAlign: TextAlign.center,
                          style: textSmallTextStyle.copyWith(
                              color: Staticmenbers
                                          .cardUsers[contactcardindex!].color !=
                                      null
                                  ? colorList[Staticmenbers
                                      .cardUsers[contactcardindex!].color!]
                                  : COLOR_PRIMARY_DARK),
                        ),
                        SizedBox(
                          height: hp(3, context),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .cardUsers[contactcardindex!].color!]
                              : COLOR_PRIMARY,
                          child: ClipOval(
                            child: Image.network(
                              "${Staticmenbers.cardUsers[contactcardindex!].image}",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: hp(4, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                    onTap: () async {
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: hp(30, context),
                    padding: EdgeInsets.only(
                        left: wp(0, context), bottom: hp(0.5, context)),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Staticmenbers.cardUsers[contactcardindex!].color !=
                              null
                          ? colorList[
                              Staticmenbers.cardUsers[contactcardindex!].color!]
                          : COLOR_PRIMARY_DARK,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: hp(8.3, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(
                                  wp(0.5, context),
                                ),
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 35,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            Text(
                              "+${Staticmenbers.cardUsers[contactcardindex!].country} ${Staticmenbers.cardUsers[contactcardindex!].phone}",
                              textAlign: TextAlign.center,
                              style:
                                  smallTextStyle.copyWith(color: COLOR_WHITE),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(0.5, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(
                                  wp(0.5, context),
                                ),
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 35,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            Flexible(
                              child: Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style:
                                    smallTextStyle.copyWith(color: COLOR_WHITE),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(0.5, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                              child: Padding(
                                padding: EdgeInsets.all(wp(1, context)),
                                child: Image.asset(
                                  "assets/icon/pin.png",
                                  scale: 30,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            Flexible(
                              child: Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].address}",
                                textAlign: TextAlign.start,
                                style: smallTextStyle.copyWith(
                                    color: COLOR_WHITE, fontSize: 9),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: COLOR_WHITE,
                              width: wp(0.3, context),
                            ),
                          ),
                          child: QrImage(
                            dataModuleStyle:
                                const QrDataModuleStyle(color: COLOR_WHITE),
                            eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                            data:
                                "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                            size: dp(60, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: hp(2, context),
              right: wp(0, context),
              child: Wrap(
                children: [
                  Container(
                    width: wp(53, context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2, context),
                      horizontal: wp(2, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      color: COLOR_PRIMARY_DARK.withOpacity(1),
                    ),
                    child: Text(
                      "${Staticmenbers.cardUsers[contactcardindex!].compeny} private limited.",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_WHITE, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
