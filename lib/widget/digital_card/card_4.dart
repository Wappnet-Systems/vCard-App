import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/text_widget.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';

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
    return Center(
      child: Container(
        width: wp(95, context),
        height: hp(35, context),
        margin: EdgeInsets.all(wp(2, context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: COLOR_WHITE,
          border: Border.all(
            color: Staticmenbers.listofUsers[cardindex!].color != null
                ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
                : COLOR_PRIMARY_DARK,
            width: wp(0.5, context),
          ),
          boxShadow: [
            BoxShadow(
              color: Staticmenbers.listofUsers[cardindex!].color != null
                  ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
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
                  vertical: hp(1.5, context),
                  horizontal: wp(2, context),
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
                        "${Staticmenbers.listofUsers[cardindex!].compeny}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: textMediumTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: hp(3, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                              },
                              child: Container(
                                padding: EdgeInsets.all(wp(1.5, context)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Staticmenbers
                                              .listofUsers[cardindex!].color !=
                                          null
                                      ? colorList[Staticmenbers
                                          .listofUsers[cardindex!].color!]
                                      : COLOR_PRIMARY_DARK,
                                ),
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 35,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Text(
                              "+${Staticmenbers.listofUsers[cardindex!].country} ${Staticmenbers.listofUsers[cardindex!].phone}",
                              textAlign: TextAlign.start,
                              style: textSmallTextStyle.copyWith(
                                  color: COLOR_PRIMARY_DARK),
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
                                launchUrl(Uri.parse(
                                    'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                              },
                              child: Container(
                                padding: EdgeInsets.all(wp(1.5, context)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Staticmenbers
                                              .listofUsers[cardindex!].color !=
                                          null
                                      ? colorList[Staticmenbers
                                          .listofUsers[cardindex!].color!]
                                      : COLOR_PRIMARY_DARK,
                                ),
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 35,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Flexible(
                              child: Text(
                                "${Staticmenbers.listofUsers[cardindex!].email}",
                                textAlign: TextAlign.start,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
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
                              child: Container(
                                padding: EdgeInsets.all(wp(1.5, context)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Staticmenbers
                                              .listofUsers[cardindex!].color !=
                                          null
                                      ? colorList[Staticmenbers
                                          .listofUsers[cardindex!].color!]
                                      : COLOR_PRIMARY_DARK,
                                ),
                                child: Image.asset(
                                  "assets/icon/pin.png",
                                  scale: 35,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wp(1.5, context),
                            ),
                            Flexible(
                              child: Text(
                                "${Staticmenbers.listofUsers[cardindex!].address} ",
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: smallTextStyle.copyWith(
                                    color: COLOR_PRIMARY_DARK),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hp(1.3, context),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: COLOR_PRIMARY, width: 1),
                            ),
                            child: QrImage(
                              data:
                                  "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                              size: dp(60, context),
                            ),
                          ),
                        ),
                      ],
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
                      "${Staticmenbers.listofUsers[cardindex!].name}",
                      textAlign: TextAlign.center,
                      style: textMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: hp(1, context),
                    ),
                    Text(
                      "${Staticmenbers.listofUsers[cardindex!].department}",
                      textAlign: TextAlign.center,
                      style: textMediumTextStyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: hp(4, context),
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor:
                          Staticmenbers.listofUsers[cardindex!].color != null
                              ? colorList[
                                  Staticmenbers.listofUsers[cardindex!].color!]
                              : COLOR_PRIMARY_DARK,
                      child: ClipOval(
                        child: Image.network(
                          "${Staticmenbers.listofUsers[cardindex!].image}",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hp(6, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Staticmenbers.listofUsers[cardindex!].website == ""
                            ? const SizedBox.shrink()
                            : InkWell(
                                onTap: () async {
                                  final url =
                                      'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                  await launchUrl(Uri.parse(url));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: wp(2.5, context)),
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
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram"));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: wp(2.5, context)),
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
                            : InkWell(
                                onTap: () async {
                                  final url =
                                      'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

                                  await launchUrl(Uri.parse(url));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: wp(2.5, context)),
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
                            : InkWell(
                                onTap: () {
                                  launchUrl(
                                      Uri.parse(
                                          'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
                                      mode: LaunchMode.externalApplication);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: wp(2.5, context)),
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
                        Staticmenbers.listofUsers[cardindex!].facebook == ""
                            ? const SizedBox.shrink()
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: wp(1.5, context)),
                                  child: Image.asset(
                                    "assets/icon/Face.png",
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
            ),
          ],
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
