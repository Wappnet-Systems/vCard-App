import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import '../widget/text_button_widget.dart';

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
            color: Staticmenbers.listofUsers[cardindex!].color != null
                ? colorList[Staticmenbers.listofUsers[cardindex!].color!]
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
                child: Staticmenbers.listofUsers[cardindex!].image == ""
                    ? Image.asset(
                        "assets/images/splash1.png",
                        width: wp(42, context),
                        height: hp(21, context),
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        "${Staticmenbers.listofUsers[cardindex!].image}",
                        width: wp(42, context),
                        height: hp(21, context),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Staticmenbers.listofUsers[cardindex!].telegram != "" &&
                        Staticmenbers.listofUsers[cardindex!].telegram !=
                            null ||
                    Staticmenbers.listofUsers[cardindex!].whatsapp != "" &&
                        Staticmenbers.listofUsers[cardindex!].whatsapp !=
                            null ||
                    Staticmenbers.listofUsers[cardindex!].website != "" &&
                        Staticmenbers.listofUsers[cardindex!].website != null ||
                    Staticmenbers.listofUsers[cardindex!].facebook != "" &&
                        Staticmenbers.listofUsers[cardindex!].facebook !=
                            null ||
                    Staticmenbers.listofUsers[cardindex!].link != "" &&
                        Staticmenbers.listofUsers[cardindex!].link != null
                ? Column(
                    children: [
                      SizedBox(height: hp(3, context)),
                      Center(
                          child: Text(
                              "${Staticmenbers.listofUsers[cardindex!].name}",
                              style: const TextStyle(
                                  fontSize: 24, color: WHITE_COLOR))),
                      SizedBox(
                        height: hp(0.10, context),
                      ),
                      Center(
                          child: Text(
                              "${Staticmenbers.listofUsers[cardindex!].department}",
                              style: const TextStyle(
                                  fontSize: 16, color: WHITE_COLOR))),
                      SizedBox(
                        height: hp(0.3, context),
                      ),
                      Center(
                          child: Text(
                              "${Staticmenbers.listofUsers[cardindex!].compeny}",
                              style: const TextStyle(
                                  fontSize: 16, color: WHITE_COLOR))),
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
                                    'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
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
                            Text(
                                "${Staticmenbers.listofUsers[cardindex!].phone}",
                                style: const TextStyle(
                                    fontSize: 14, color: WHITE_COLOR))
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
                                    'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
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
                            Text(
                                "${Staticmenbers.listofUsers[cardindex!].email}",
                                style: const TextStyle(
                                    fontSize: 14, color: WHITE_COLOR))
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
                                    'https://${Staticmenbers.listofUsers[cardindex!].website}';

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
                            Text(
                                "${Staticmenbers.listofUsers[cardindex!].website}",
                                style: const TextStyle(
                                    fontSize: 14, color: WHITE_COLOR))
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
                                          'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
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
                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
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
                                      "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram"));
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
                                      'https://${Staticmenbers.listofUsers[cardindex!].link}';

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
                                          '${Staticmenbers.listofUsers[cardindex!].address}',
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
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[cardindex!].address}";

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
