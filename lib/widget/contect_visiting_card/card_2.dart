import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../custom_alartdialog.dart';

class Contectcardtheme2 extends StatefulWidget {
  final int? id;
  const Contectcardtheme2({super.key, required this.id});

  @override
  State<Contectcardtheme2> createState() => _Contectcardtheme2State();
}

class _Contectcardtheme2State extends State<Contectcardtheme2> {
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
            color: Staticmenbers.cardUsers[contactcardindex!].color != null
                ? colorList[Staticmenbers.cardUsers[contactcardindex!].color!]
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
                  child:
                      Staticmenbers.cardUsers[contactcardindex!].image == null
                          ? Image(
                              image: const AssetImage(
                                "assets/images/splash1.png",
                              ),
                              width: wp(35, context),
                              height: hp(16.7, context),
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              "${Staticmenbers.cardUsers[contactcardindex!].image}",
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
                "${Staticmenbers.cardUsers[contactcardindex!].name}",
                textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(color: COLOR_WHITE),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Text(
                "${Staticmenbers.cardUsers[contactcardindex!].department}",
                textAlign: TextAlign.center,
                style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Text(
                "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
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
                        (Staticmenbers.cardUsers[contactcardindex!].phone == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
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
                        (Staticmenbers.cardUsers[contactcardindex!].phone == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : Text(
                                "+${Staticmenbers.cardUsers[contactcardindex!].country} ${Staticmenbers.cardUsers[contactcardindex!].phone}",
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
                        (Staticmenbers.cardUsers[contactcardindex!].email == "")
                            ? SizedBox(
                                height: hp(2, context),
                              )
                            : InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
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
                        (Staticmenbers.cardUsers[contactcardindex!].email == "")
                            ? Container(
                                height: hp(2, context),
                              )
                            : Text(
                                "${Staticmenbers.cardUsers[contactcardindex!].email}",
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
                        (Staticmenbers.cardUsers[contactcardindex!].address ==
                                "")
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
                                              '${Staticmenbers.cardUsers[contactcardindex!].address}',
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
                        (Staticmenbers.cardUsers[contactcardindex!].address ==
                                "")
                            ? Container(
                                height: hp(2, context),
                              )
                            : Flexible(
                                child: Text(
                                  "${Staticmenbers.cardUsers[contactcardindex!].address}",
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
                      "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
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
                    (Staticmenbers.cardUsers[contactcardindex!].whatsapp == "")
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
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].facebook == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                            },
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].telegram == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "https://telegram.me/$Staticmenbers.cardUsers[contactcardindex!].telegram"));
                            },
                            child: Image.asset(
                              "assets/icon/tele.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].linkdin == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () async {
                              final url =
                                  'https://www.linkedin.com//${Staticmenbers.cardUsers[contactcardindex!].linkdin}';

                              await launchUrl(Uri.parse(url));
                            },
                            child: Image.asset(
                              "assets/icon/lin.png",
                              scale: 25,
                              color: COLOR_WHITE,
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].website == "")
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () async {
                              final url =
                                  'https://${Staticmenbers.cardUsers[contactcardindex!].website}';

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
