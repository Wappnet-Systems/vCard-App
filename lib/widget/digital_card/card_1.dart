import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
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
                color: Staticmenbers.listofUsers[cardindex!].color != null
                    ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
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
                        "${Staticmenbers.listofUsers[cardindex!].compeny}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: textMediumTextStyle.copyWith(
                          color: Staticmenbers.listofUsers[cardindex!].color !=
                                  null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : COLOR_WHITE,
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Staticmenbers.listofUsers[cardindex!].color != null
                                ? colorList[Staticmenbers
                                    .listofUsers[cardindex!].color!]
                                : COLOR_WHITE,
                        child: ClipOval(
                          child: Staticmenbers.listofUsers[cardindex!].image ==
                                  null
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(22, context),
                                  height: hp(10.5, context),
                                  fit: BoxFit.contain,
                                )
                              : Image.network(
                                  "${Staticmenbers.listofUsers[cardindex!].image}",
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
                        "${Staticmenbers.listofUsers[cardindex!].name}",
                        style: smalltitleTextStyle.copyWith(
                            color:
                                Staticmenbers.listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : COLOR_WHITE),
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "${Staticmenbers.listofUsers[cardindex!].department}",
                        style: smallTextStyle.copyWith(
                            color:
                                Staticmenbers.listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
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
                            (Staticmenbers.listofUsers[cardindex!].facebook ==
                                    "")
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
                                                  .listofUsers[cardindex!]
                                                  .color !=
                                              null
                                          ? colorList[Staticmenbers
                                              .listofUsers[cardindex!].color!]
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.listofUsers[cardindex!].telegram ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                                    },
                                    child: Image.asset(
                                      "assets/icon/tele.png",
                                      scale: 30,
                                      color: Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color !=
                                              null
                                          ? colorList[Staticmenbers
                                              .listofUsers[cardindex!].color!]
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.listofUsers[cardindex!].linkdin ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () async {
                                      final url =
                                          'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

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
                                              .listofUsers[cardindex!].color!]
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.listofUsers[cardindex!].whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      launchUrl(
                                          Uri.parse(
                                              'https://wa.me/${Staticmenbers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Image.asset(
                                      "assets/icon/whats.png",
                                      scale: 30,
                                      color: Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color !=
                                              null
                                          ? colorList[Staticmenbers
                                              .listofUsers[cardindex!].color!]
                                          : COLOR_WHITE,
                                    ),
                                  ),
                            SizedBox(
                              width: wp(2, context),
                            ),
                            (Staticmenbers.listofUsers[cardindex!].whatsapp ==
                                    "")
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://${Staticmenbers.listofUsers[cardindex!].website}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/website.png",
                                      scale: 30,
                                      color: Staticmenbers
                                                  .listofUsers[cardindex!]
                                                  .color !=
                                              null
                                          ? colorList[Staticmenbers
                                              .listofUsers[cardindex!].color!]
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
                        color: Staticmenbers.listofUsers[cardindex!].color !=
                                null
                            ? colorList[
                                Staticmenbers.listofUsers[cardindex!].color!]
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
                                      'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
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
                                "+${Staticmenbers.listofUsers[cardindex!].country} ${Staticmenbers.listofUsers[cardindex!].phone}",
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
                              Text(
                                "${Staticmenbers.listofUsers[cardindex!].email}",
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
                                        '${Staticmenbers.listofUsers[cardindex!].address}',
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
                                  "${Staticmenbers.listofUsers[cardindex!].address}",
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
                                  "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
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
