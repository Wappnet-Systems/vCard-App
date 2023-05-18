import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import '../widget/text_button_widget.dart';
import '../widget/text_widget.dart';

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
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: wp(100, context),
          height: hp(70, context),
          decoration: BoxDecoration(
            border: Border.all(color: WHITE_COLOR, width: wp(0.5, context)),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Staticmenbers.listofUsers[contactcardindex!].color != null
                ? colorList[Staticmenbers.listofUsers[contactcardindex!].color!]
                : BLUE_COLOR,
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
                border: Border.all(color: BLUE_COLOR, width: 3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(90),
                ),
              ),
              child: ClipOval(
                child: Staticmenbers.listofUsers[contactcardindex!].image == ""
                    ? Image.asset(
                        "assets/images/splash1.png",
                        width: wp(42, context),
                        height: hp(21, context),
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        "${Staticmenbers.listofUsers[contactcardindex!].image}",
                        width: wp(42, context),
                        height: hp(21, context),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Staticmenbers.listofUsers[contactcardindex!].telegram != "" &&
                        Staticmenbers.listofUsers[contactcardindex!].telegram !=
                            null ||
                    Staticmenbers.listofUsers[contactcardindex!].whatsapp !=
                            "" &&
                        Staticmenbers.listofUsers[contactcardindex!].whatsapp !=
                            null ||
                    Staticmenbers.listofUsers[contactcardindex!].website !=
                            "" &&
                        Staticmenbers.listofUsers[contactcardindex!].website !=
                            null ||
                    Staticmenbers.listofUsers[contactcardindex!].facebook !=
                            "" &&
                        Staticmenbers.listofUsers[contactcardindex!].facebook !=
                            null ||
                    Staticmenbers.listofUsers[contactcardindex!].link != "" &&
                        Staticmenbers.listofUsers[contactcardindex!].link !=
                            null
                ? Column(
                    children: [
                      SizedBox(height: hp(3, context)),
                      Textwidget(
                        width: wp(60, context),
                        text:
                            "${Staticmenbers.listofUsers[contactcardindex!].name}",
                        selectionColor: WHITE_COLOR,
                        fontSize: 24,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Textwidget(
                        width: wp(60, context),
                        text:
                            "${Staticmenbers.listofUsers[contactcardindex!].department}",
                        selectionColor: WHITE_COLOR,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: hp(0.5, context),
                      ),
                      Textwidget(
                        width: wp(60, context),
                        text:
                            "${Staticmenbers.listofUsers[contactcardindex!].compeny}",
                        selectionColor: WHITE_COLOR,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'tel:${Staticmenbers.listofUsers[contactcardindex!].phone.toString()}'));
                              },
                              child: Image.asset(
                                "assets/icon/call.png",
                                scale: 22,
                                color: WHITE_COLOR,
                              ),
                            ),
                            SizedBox(
                              width: wp(8, context),
                            ),
                            Textwidget(
                              width: wp(60, context),
                              text:
                                  "${Staticmenbers.listofUsers[contactcardindex!].phone}",
                              selectionColor: WHITE_COLOR,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'mailto:${Staticmenbers.listofUsers[contactcardindex!].email}'));
                              },
                              child: Image.asset(
                                "assets/icon/email.png",
                                scale: 22,
                                color: WHITE_COLOR,
                              ),
                            ),
                            SizedBox(
                              width: wp(8, context),
                            ),
                            Textwidget(
                              width: wp(60, context),
                              text:
                                  "${Staticmenbers.listofUsers[contactcardindex!].email}",
                              selectionColor: WHITE_COLOR,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final url =
                                    'https://${Staticmenbers.listofUsers[contactcardindex!].website}';

                                await launchUrl(Uri.parse(url));
                              },
                              child: Image.asset(
                                "assets/icon/website.png",
                                scale: 22,
                                color: WHITE_COLOR,
                              ),
                            ),
                            SizedBox(
                              width: wp(8, context),
                            ),
                            Textwidget(
                              width: wp(60, context),
                              text:
                                  "${Staticmenbers.listofUsers[contactcardindex!].website}",
                              selectionColor: WHITE_COLOR,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                          runSpacing: 5.0,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(
                                      Uri.parse(
                                          'https://wa.me/$Staticmenbers.listofUsers[contactcardindex!].whatsapp?text=Hi'),
                                      mode: LaunchMode.externalApplication);
                                },
                                child: Image.asset(
                                  "assets/icon/whats.png",
                                  scale: 18,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[contactcardindex!].facebook}}'));
                                },
                                child: Image.asset(
                                  "assets/icon/Face.png",
                                  scale: 18,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      "https://telegram.me/$Staticmenbers.listofUsers[contactcardindex!].telegram"));
                                },
                                child: Image.asset(
                                  "assets/icon/tele.png",
                                  scale: 18,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () async {
                                  final url =
                                      'https://${Staticmenbers.listofUsers[contactcardindex!].link}';

                                  await launchUrl(Uri.parse(url));
                                },
                                child: Image.asset(
                                  "assets/icon/lin.png",
                                  scale: 18,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      backgroundColor: BLUE_COLOR,
                                      title: const Text("Address",
                                          style: TextStyle(
                                              fontFamily: 'Marck',
                                              fontSize: 25,
                                              color: WHITE_COLOR,
                                              fontWeight: FontWeight.bold)),
                                      content: Text(
                                          '${Staticmenbers.listofUsers[contactcardindex!].address}',
                                          style: const TextStyle(
                                              fontFamily: 'Marck',
                                              fontSize: 25,
                                              color: WHITE_COLOR,
                                              fontWeight: FontWeight.bold)),
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButtomWidget(
                                              onPressed: () {
                                                _pushMap();
                                              },
                                              title: 'Use Map',
                                              fontSize: null,
                                              color: BLUE_COLOR,
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
                                  scale: 18,
                                  color: WHITE_COLOR,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  )
                : const SizedBox.shrink(),
          ]),
        ),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[contactcardindex!].address}";

    await launchUrl(Uri.parse(googleUrl));
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: WHITE_COLOR,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: BLUE_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
