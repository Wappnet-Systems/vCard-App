import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/text_widget.dart';
import '../text_button_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: wp(100, context),
        height: hp(70, context),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: wp(0.5, context)),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Staticmenbers.listofUsers[cardindex!].color != null
              ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
              : blueColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(height: hp(3, context)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: wp(0.2, context)),
              borderRadius: const BorderRadius.all(
                Radius.circular(90),
              ),
            ),
            child: ClipOval(
              child: Staticmenbers.listofUsers[cardindex!].image == ""
                  ? Image.asset(
                      "assets/images/splash1.png",
                      width: wp(36, context),
                      height: hp(18, context),
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      "${Staticmenbers.listofUsers[cardindex!].image}",
                      width: wp(36, context),
                      height: hp(18, context),
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
                text: "${Staticmenbers.listofUsers[cardindex!].name}",
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
                text: "${Staticmenbers.listofUsers[cardindex!].department}",
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
                text: "${Staticmenbers.listofUsers[cardindex!].compeny}",
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
                    (Staticmenbers.listofUsers[cardindex!].phone == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
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
                    (Staticmenbers.listofUsers[cardindex!].phone == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : Textwidget(
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            width: wp(60, context),
                            text:
                                "${Staticmenbers.listofUsers[cardindex!].phone}",
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
                    (Staticmenbers.listofUsers[cardindex!].email == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
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
                    (Staticmenbers.listofUsers[cardindex!].email == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : Textwidget(
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            width: wp(60, context),
                            text:
                                "${Staticmenbers.listofUsers[cardindex!].email}",
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
                    (Staticmenbers.listofUsers[cardindex!].address == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: whiteColor,
                                  title: const Text("Address",
                                      style: TextStyle(
                                          fontFamily: 'Marck',
                                          fontSize: 25,
                                          color: blueColor,
                                          fontWeight: FontWeight.bold)),
                                  content: Text(
                                      '${Staticmenbers.listofUsers[cardindex!].address}',
                                      style: const TextStyle(
                                          fontFamily: 'Marck',
                                          fontSize: 20,
                                          color: grayColor,
                                          fontWeight: FontWeight.bold)),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButtomWidget(
                                          onPressed: () {
                                            _pushMap();
                                          },
                                          title: 'Use Map',
                                          color: blueColor,
                                        ),
                                        TextButtomWidget(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Cancle',
                                          fontSize: 15,
                                          color: Colors.redAccent,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
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
                    (Staticmenbers.listofUsers[cardindex!].address == "")
                        ? Container(
                            height: hp(2, context),
                          )
                        : Textwidget(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            width: wp(60, context),
                            text:
                                "${Staticmenbers.listofUsers[cardindex!].address}",
                            selectionColor: whiteColor,
                            fontSize: 12,
                          ),
                  ],
                ),
              ),
              SizedBox(height: hp(2, context)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor, width: 1)),
                  child: QrImage(
                    dataModuleStyle: const QrDataModuleStyle(color: whiteColor),
                    eyeStyle: const QrEyeStyle(color: whiteColor),
                    data:
                        "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
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
                    (Staticmenbers.listofUsers[cardindex!].whatsapp == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                    Uri.parse(
                                        'https://wa.me/${Staticmenbers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Image.asset(
                                "assets/icon/whats.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].facebook == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                              },
                              child: Image.asset(
                                "assets/icon/Face.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].telegram == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram"));
                              },
                              child: Image.asset(
                                "assets/icon/tele.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].linkdin == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

                                await launchUrl(Uri.parse(url));
                              },
                              child: Image.asset(
                                "assets/icon/lin.png",
                                scale: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                    (Staticmenbers.listofUsers[cardindex!].website == "")
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://${Staticmenbers.listofUsers[cardindex!].website}';

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
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[cardindex!].address}";

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
