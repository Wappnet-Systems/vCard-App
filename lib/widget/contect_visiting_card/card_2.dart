import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import '../custom_alartdialog.dart';
import '../text_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: wp(100, context),
        height: hp(70, context),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: wp(0.5, context)),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Staticmenbers.cardUsers[contactcardindex!].color != null
              ? colorList[Staticmenbers.cardUsers[contactcardindex!].color!]
              : blueColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(height: hp(2, context)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: wp(0.2, context)),
              borderRadius: const BorderRadius.all(
                Radius.circular(90),
              ),
            ),
            child: ClipOval(
              child: Image.network(
                "${Staticmenbers.cardUsers[contactcardindex!].image}",
                width: wp(35, context),
                height: hp(16.7, context),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: hp(3, context)),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "${Staticmenbers.cardUsers[contactcardindex!].name}",
                selectionColor: whiteColor,
                fontSize: 20,
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text:
                    "${Staticmenbers.cardUsers[contactcardindex!].department}",
                selectionColor: whiteColor,
                fontSize: 14,
              ),
              SizedBox(
                height: hp(0.5, context),
              ),
              Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(60, context),
                text: "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                selectionColor: whiteColor,
                fontSize: 14,
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                      },
                      child: Image.asset(
                        "assets/icon/call.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].phone}",
                      selectionColor: whiteColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                      },
                      child: Image.asset(
                        "assets/icon/email.png",
                        scale: 22,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].email}",
                      selectionColor: whiteColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
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
                                    selectionColor: grayColor,
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
                        scale: 20,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Textwidget(
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].address}",
                      selectionColor: whiteColor,
                      fontSize: 11,
                    ),
                  ],
                ),
              ),
              SizedBox(height: hp(3, context)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor, width: 1)),
                  child: QrImage(
                    dataModuleStyle: const QrDataModuleStyle(color: whiteColor),
                    eyeStyle: const QrEyeStyle(color: whiteColor),
                    data:
                        "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                    size: 60,
                  ),
                ),
              ),
              SizedBox(height: hp(0.5, context)),
              Wrap(
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    (Staticmenbers.cardUsers[contactcardindex!].whatsapp == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                    Uri.parse(
                                        'https://wa.me/${Staticmenbers.cardUsers[contactcardindex!].whatsapp}?text=Hi'),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Image.asset(
                                "assets/icon/whats.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].facebook == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                              },
                              child: Image.asset(
                                "assets/icon/Face.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].telegram == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    "https://telegram.me/$Staticmenbers.cardUsers[contactcardindex!].telegram"));
                              },
                              child: Image.asset(
                                "assets/icon/tele.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].linkdin == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://www.linkedin.com//${Staticmenbers.cardUsers[contactcardindex!].linkdin}';

                                await launchUrl(Uri.parse(url));
                              },
                              child: Image.asset(
                                "assets/icon/lin.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.cardUsers[contactcardindex!].website == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://${Staticmenbers.cardUsers[contactcardindex!].website}';

                                await launchUrl(Uri.parse(url));
                              },
                              child: Image.asset(
                                "assets/icon/website.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                  ])
            ],
          )
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
        color: whiteColor,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: blueColor),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
