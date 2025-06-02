import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../custom_alartdialog.dart';

class Cardtheme2 extends StatefulWidget {
  final int? id;
  const Cardtheme2({super.key, required this.id});

  @override
  State<Cardtheme2> createState() => _Cardtheme2State();
}

class _Cardtheme2State extends State<Cardtheme2> {
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
    return Wrap(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: wp(4, context),
            vertical: hp(6, context),
          ),
          padding: EdgeInsets.symmetric(
            vertical: hp(2, context),
            horizontal: wp(2, context),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: COLOR_WHITE,
              width: wp(0.5, context),
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Staticmenbers.listofUsers[cardindex!].color != null
                ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
                : COLOR_PRIMARY_DARK,
            boxShadow: [
              BoxShadow(
                color: COLOR_PRIMARY_DARK.withOpacity(0.5),
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: COLOR_WHITE,
                child: ClipOval(
                  child: Image.network(
                    "${Staticmenbers.listofUsers[cardindex!].image}",
                    width: wp(35, context),
                    height: hp(16.7, context),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              Text(
                "${Staticmenbers.listofUsers[cardindex!].name}",
                textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(color: COLOR_WHITE),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Text(
                "${Staticmenbers.listofUsers[cardindex!].department}",
                textAlign: TextAlign.center,
                style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Text(
                "${Staticmenbers.listofUsers[cardindex!].compeny}",
                textAlign: TextAlign.center,
                style: textMediumTextStyle.copyWith(
                    color: COLOR_WHITE, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: wp(10, context),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        (Staticmenbers.listofUsers[cardindex!].phone == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                },
                                child: Image.asset(
                                  "assets/icon/call.png",
                                  scale: 25,
                                  color: COLOR_WHITE,
                                ),
                              ),
                        SizedBox(
                          width: wp(5, context),
                        ),
                        (Staticmenbers.listofUsers[cardindex!].phone == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : Text(
                                "+${Staticmenbers.listofUsers[cardindex!].country} ${Staticmenbers.listofUsers[cardindex!].phone}",
                                textAlign: TextAlign.center,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_WHITE),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: hp(2, context),
                    ),
                    Row(
                      children: [
                        (Staticmenbers.listofUsers[cardindex!].email == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                                },
                                child: Image.asset(
                                  "assets/icon/email.png",
                                  scale: 25,
                                  color: COLOR_WHITE,
                                ),
                              ),
                        SizedBox(
                          width: wp(5, context),
                        ),
                        (Staticmenbers.listofUsers[cardindex!].email == "")
                            ? Container(
                                height: hp(2, context),
                              )
                            : Text(
                                "${Staticmenbers.listofUsers[cardindex!].email}",
                                textAlign: TextAlign.center,
                                style: textSmallTextStyle.copyWith(
                                    color: COLOR_WHITE),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: hp(2, context),
                    ),
                    Row(
                      children: [
                        (Staticmenbers.listofUsers[cardindex!].address == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => CustomAlartDialog(
                                            title: Text(
                                              "Address",
                                              textAlign: TextAlign.center,
                                              style:
                                                  smalltitleTextStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            content: Text(
                                              '${Staticmenbers.listofUsers[cardindex!].address}',
                                              selectionColor:
                                                  COLOR_PRIMARY_LIGHT,
                                              textAlign: TextAlign.center,
                                              style:
                                                  textMediumTextStyle.copyWith(
                                                      color:
                                                          COLOR_PRIMARY_LIGHT),
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
                                  scale: 25,
                                  color: COLOR_WHITE,
                                ),
                              ),
                        SizedBox(
                          width: wp(5, context),
                        ),
                        (Staticmenbers.listofUsers[cardindex!].address == "")
                            ? Container(
                                height: hp(2, context),
                              )
                            : Flexible(
                                child: Text(
                                  "${Staticmenbers.listofUsers[cardindex!].address}",
                                  textAlign: TextAlign.start,
                                  maxLines: 4,
                                  style: smallTextStyle.copyWith(
                                      color: COLOR_WHITE),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: COLOR_WHITE, width: 1),
                ),
                child: QrImage(
                  dataModuleStyle: const QrDataModuleStyle(color: COLOR_WHITE),
                  eyeStyle: const QrEyeStyle(color: COLOR_WHITE),
                  data:
                      "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                  size: dp(70, context),
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(10, context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (Staticmenbers.listofUsers[cardindex!].whatsapp == "")
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
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].facebook == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                            },
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].telegram == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram"));
                            },
                            child: Image.asset(
                              "assets/icon/tele.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].linkdin == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () async {
                              final url =
                                  'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

                              await launchUrl(Uri.parse(url));
                            },
                            child: Image.asset(
                              "assets/icon/lin.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].website == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () async {
                              final url =
                                  'https://${Staticmenbers.listofUsers[cardindex!].website}';

                              await launchUrl(Uri.parse(url));
                            },
                            child: Image.asset(
                              "assets/icon/website.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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
