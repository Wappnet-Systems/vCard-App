import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';
import '../text_widget.dart';

class Contectdefultcard extends StatefulWidget {
  final int? id;
  const Contectdefultcard({super.key, required this.id});

  @override
  State<Contectdefultcard> createState() => _ContectdefultcardState();
}

class _ContectdefultcardState extends State<Contectdefultcard> {
  int? contactcardindex;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    contactcardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: goldColor, width: wp(0.5, context)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 30,
            color: blackColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.only(left: 48, top: 10, bottom: 10),
                  child: Textwidget(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    width: wp(60, context),
                    text:
                        '${Staticmenbers.cardUsers[contactcardindex!].compeny}',
                    fontSize: 18,
                    selectionColor: goldColor,
                  )),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(50)),
                    border:
                        Border.all(color: goldColor, width: wp(0.1, context)),
                    boxShadow: const [
                      BoxShadow(
                        color: goldColor,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(50)),
                    child: Image.network(
                      "${Staticmenbers.cardUsers[contactcardindex!].image}",
                      width: wp(40, context),
                      height: hp(20, context),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: hp(1.5, context)),
              Center(
                  child: Textwidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                width: wp(40, context),
                text: '${Staticmenbers.cardUsers[contactcardindex!].name}',
                fontSize: 20,
                selectionColor: goldColor,
              )),
              SizedBox(height: hp(0.5, context)),
              Center(
                child: Textwidget(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  width: wp(60, context),
                  text:
                      '${Staticmenbers.cardUsers[contactcardindex!].department}',
                  fontSize: 16,
                  selectionColor: goldColor,
                ),
              ),
              SizedBox(height: hp(0.5, context)),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Divider(
                  color: goldColor,
                  thickness: 2,
                  height: 1,
                ),
              ),
              Column(children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                      },
                      child: Image.asset(
                        "assets/icon/call.png",
                        scale: 24,
                        color: goldColor,
                      ),
                    ),
                  ),
                  SizedBox(width: wp(3, context)),
                  Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(40, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].phone}",
                      fontSize: 14,
                      selectionColor: goldColor),
                ]),
                SizedBox(height: hp(2, context)),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                      },
                      child: Image.asset(
                        "assets/icon/email.png",
                        scale: 24,
                        color: goldColor,
                      ),
                    ),
                  ),
                  SizedBox(width: wp(3, context)),
                  Textwidget(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].email}",
                      fontSize: 14,
                      selectionColor: goldColor),
                ]),
                SizedBox(height: hp(2, context)),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
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
                        scale: 24,
                        color: goldColor,
                      ),
                    ),
                  ),
                  SizedBox(width: wp(3, context)),
                  Textwidget(
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      width: wp(60, context),
                      text:
                          "${Staticmenbers.cardUsers[contactcardindex!].address}",
                      fontSize: 12,
                      selectionColor: goldColor),
                ]),
              ]),
              SizedBox(height: hp(1, context)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: goldColor, width: 1)),
                  child: QrImage(
                    dataModuleStyle: const QrDataModuleStyle(color: goldColor),
                    eyeStyle: const QrEyeStyle(color: goldColor),
                    data:
                        "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                    size: 60,
                  ),
                ),
              ),
              SizedBox(height: hp(1, context)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                (Staticmenbers.cardUsers[contactcardindex!].whatsapp == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
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
                            color: goldColor,
                          ),
                        ),
                      ),
                (Staticmenbers.cardUsers[contactcardindex!].facebook == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                          },
                          child: Image.asset(
                            "assets/icon/Face.png",
                            scale: 20,
                            color: goldColor,
                          ),
                        ),
                      ),
                (Staticmenbers.cardUsers[contactcardindex!].telegram == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://telegram.me/${Staticmenbers.cardUsers[contactcardindex!].telegram}"));
                          },
                          child: Image.asset(
                            "assets/icon/tele.png",
                            scale: 20,
                            color: goldColor,
                          ),
                        ),
                      ),
                (Staticmenbers.cardUsers[contactcardindex!].website == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () async {
                            final url =
                                'https://${Staticmenbers.cardUsers[contactcardindex!].website}';

                            await launchUrl(Uri.parse(url));
                          },
                          child: Image.asset(
                            "assets/icon/website.png",
                            scale: 20,
                            color: goldColor,
                          ),
                        ),
                      ),
                (Staticmenbers.cardUsers[contactcardindex!].linkdin == "")
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () async {
                            final url =
                                'https://www.linkedin.com//${Staticmenbers.cardUsers[contactcardindex!].linkdin}';

                            await launchUrl(Uri.parse(url));
                          },
                          child: Image.asset(
                            "assets/icon/lin.png",
                            scale: 20,
                            color: goldColor,
                          ),
                        ),
                      )
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 1),
              ),
            ]),
          ),
        ]));
  }

  void _pushMap() async {
    if (Staticmenbers.cardUsers[contactcardindex!].address == "") {
      displayCustomToast();
    } else {
      String googleUrl =
          "google.navigation:q=${Staticmenbers.cardUsers[contactcardindex!].address}";
      Uri googleUri = Uri.parse(googleUrl);

      if (await canLaunchUrl(googleUri)) {
        await launchUrl(googleUri);
      }
    }
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
