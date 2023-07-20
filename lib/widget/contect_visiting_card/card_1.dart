import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
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
    return Center(
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: wp(2, context),
            ),
            decoration: BoxDecoration(
              color: COLOR_PRIMARY_DARK,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Staticmenbers.cardUsers[contactcardindex!].color != null
                    ? colorList[
                        Staticmenbers.cardUsers[contactcardindex!].color!]
                    : COLOR_PRIMARY_LIGHT,
                width: wp(0.4, context),
              ),
              boxShadow: [
                BoxShadow(
                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: textMediumTextStyle.copyWith(
                          color: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .cardUsers[contactcardindex!].color!]
                              : COLOR_WHITE,
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Staticmenbers.cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_WHITE,
                        child: ClipOval(
                          child: Staticmenbers
                                      .cardUsers[contactcardindex!].image ==
                                  null
                              ? Image(
                                  image: const AssetImage(
                                    "assets/images/splash1.png",
                                  ),
                                  width: wp(22, context),
                                  height: hp(10.5, context),
                                  fit: BoxFit.contain,
                                )
                              : Image.network(
                                  "${Staticmenbers.cardUsers[contactcardindex!].image}",
                                  width: wp(22, context),
                                  height: hp(10.5, context),
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Text(
                        "${Staticmenbers.cardUsers[contactcardindex!].name}",
                        style: smalltitleTextStyle.copyWith(
                            color: Staticmenbers
                                        .cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_WHITE),
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "${Staticmenbers.cardUsers[contactcardindex!].department}",
                        style: smallTextStyle.copyWith(
                            color: Staticmenbers
                                        .cardUsers[contactcardindex!].color !=
                                    null
                                ? colorList[Staticmenbers
                                    .cardUsers[contactcardindex!].color!]
                                : COLOR_WHITE),
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: wp(4, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .facebook ==
                                    "")
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
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .telegram ==
                                    "")
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
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers
                                        .cardUsers[contactcardindex!].linkdin ==
                                    "")
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
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
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
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.cardUsers[contactcardindex!]
                                        .whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: hp(1, context),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(2, context),
                        vertical: hp(2, context),
                      ),
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
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
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
                              SizedBox(
                                width: wp(2, context),
                              ),
                              Text(
                                "+${Staticmenbers.cardUsers[contactcardindex!].country} ${Staticmenbers.cardUsers[contactcardindex!].phone}",
                                style: smallTextStyle.copyWith(
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: hp(1.5, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
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
                              SizedBox(
                                width: wp(2, context),
                              ),
                              Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                style: smallTextStyle.copyWith(
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: hp(1, context),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => CustomAlartDialog(
                                      title: Text(
                                        "Address",
                                        textAlign: TextAlign.center,
                                        style: smalltitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      content: Text(
                                        '${Staticmenbers.cardUsers[contactcardindex!].address}',
                                        selectionColor: COLOR_PRIMARY_LIGHT,
                                        textAlign: TextAlign.center,
                                        style: textMediumTextStyle.copyWith(
                                            color: COLOR_PRIMARY_LIGHT),
                                      ),
                                      onPressedNo: () {
                                        Navigator.pop(context);
                                      },
                                      onPressedYes: () {
                                        _pushMap();
                                      },
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "assets/icon/pin.png",
                                  scale: 25,
                                  color: COLOR_WHITE,
                                ),
                              ),
                              SizedBox(
                                width: wp(2, context),
                              ),
                              SizedBox(
                                width: wp(40, context),
                                child: Text(
                                  "${Staticmenbers.cardUsers[contactcardindex!].address}",
                                  maxLines: 4,
                                  style: smallTextStyle.copyWith(
                                    fontSize: 10,
                                    color: COLOR_WHITE,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: hp(2, context),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: wp(15, context),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: COLOR_WHITE, width: 0.3)),
                            child: QrImage(
                              dataModuleStyle:
                                  const QrDataModuleStyle(color: COLOR_WHITE),
                              eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                              data:
                                  "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                              size: dp(70, context),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
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
