import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/model/data_controllers.dart';
import 'package:vcard/utils/responsive.dart';
import '../utils/constants_color.dart';
import '../widget/text_button_widget.dart';

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
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          width: wp(100, context),
          height: hp(75, context),
          decoration: BoxDecoration(
            color: BLACK_COLOR,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8.0,
              ),
              BoxShadow(),
            ],
          ),
          child: Stack(children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: hp(6, context)),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(160),
                            topRight: Radius.circular(160))),
                    child: Container(
                      width: wp(67, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(160),
                            topRight: Radius.circular(160)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                          ),
                          BoxShadow(
                            color:
                                Staticmenbers.listofUsers[cardindex!].color !=
                                        null
                                    ? colorList[Staticmenbers
                                        .listofUsers[cardindex!].color!]
                                    : Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: hp(32, context),
                          ),
                          Center(
                              child: Text(
                                  "${Staticmenbers.listofUsers[cardindex!].name}",
                                  style: TextStyle(fontSize: 24))),
                          SizedBox(
                            height: hp(0.5, context),
                          ),
                          Center(
                              child: Text(
                                  "${Staticmenbers.listofUsers[cardindex!].department}",
                                  style: TextStyle(fontSize: 14))),
                          SizedBox(
                            height: hp(0.5, context),
                          ),
                          Center(
                              child: Text(
                                  "${Staticmenbers.listofUsers[cardindex!].compeny}",
                                  style: TextStyle(fontSize: 14))),
                          SizedBox(
                            height: hp(1, context),
                          ),
                          Staticmenbers.listofUsers[cardindex!].telegram != "" &&
                                      Staticmenbers.listofUsers[cardindex!]
                                              .telegram !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].whatsapp != "" &&
                                      Staticmenbers.listofUsers[cardindex!]
                                              .whatsapp !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].website != "" &&
                                      Staticmenbers.listofUsers[cardindex!].website !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].address != "" &&
                                      Staticmenbers.listofUsers[cardindex!].address !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].email != "" &&
                                      Staticmenbers.listofUsers[cardindex!].email !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].facebook != "" &&
                                      Staticmenbers.listofUsers[cardindex!]
                                              .facebook !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].link != "" &&
                                      Staticmenbers.listofUsers[cardindex!].link !=
                                          null ||
                                  Staticmenbers.listofUsers[cardindex!].phone !=
                                          "" &&
                                      Staticmenbers.listofUsers[cardindex!].phone != null
                              ? Center(
                                  child: Container(
                                    height: hp(15, context),
                                    width: wp(60, context),
                                    alignment: Alignment.center,
                                    child: Wrap(
                                        runSpacing: 5.0,
                                        alignment: WrapAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .phone ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      UrlLauncher.launchUrl(
                                                          Uri.parse(
                                                              'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/call.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .whatsapp ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              'https://wa.me/${Staticmenbers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/whats.png",
                                                      scale: 17,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .email ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      UrlLauncher.launchUrl(
                                                          Uri.parse(
                                                              'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/email.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .facebook ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      UrlLauncher.launchUrl(
                                                          Uri.parse(
                                                              'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/Face.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .telegram ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      UrlLauncher.launchUrl(
                                                          Uri.parse(
                                                              "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/tele.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .website ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final url =
                                                          'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                                      await launchUrl(
                                                          Uri.parse(url));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/website.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .link ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final url =
                                                          'https://${Staticmenbers.listofUsers[cardindex!].link}';

                                                      await launchUrl(
                                                          Uri.parse(url));
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/lin.png",
                                                      scale: 18,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                          (Staticmenbers.listofUsers[cardindex!]
                                                      .address ==
                                                  "")
                                              ? const SizedBox.shrink()
                                              : Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (ctx) =>
                                                            AlertDialog(
                                                          backgroundColor:
                                                              BLUE_COLOR,
                                                          title: const Text(
                                                              "Address",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Marck',
                                                                  fontSize: 25,
                                                                  color:
                                                                      WHITE_COLOR,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          content: Text(
                                                              '${Staticmenbers.listofUsers[cardindex!].address}',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Marck',
                                                                  fontSize: 25,
                                                                  color:
                                                                      WHITE_COLOR,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          actions: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                TextButtomWidget(
                                                                  onPressed:
                                                                      () {
                                                                    _pushMap();
                                                                  },
                                                                  title:
                                                                      'Use Map',
                                                                  fontSize:
                                                                      null,
                                                                  color:
                                                                      PRIMARY_COLOR,
                                                                ),
                                                                TextButtomWidget(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  title:
                                                                      'Cancle',
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .redAccent,
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      "assets/icon/pin.png",
                                                      scale: 15,
                                                      color: BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                        ]),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Center(
                                child: Text(
                                    "${Staticmenbers.listofUsers[cardindex!].headline}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 42,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: BLUE_COLOR, width: 3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(150),
                    ),
                  ),
                  child: ClipOval(
                    child: Staticmenbers.listofUsers[cardindex!].image == ""
                        ? Image.asset(
                            "assets/images/splash1.png",
                            width: wp(44, context),
                            height: hp(20, context),
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            "${Staticmenbers.listofUsers[cardindex!].image}",
                            width: wp(64, context),
                            height: hp(30, context),
                            fit: BoxFit.fill,
                          ),
                  )),
            ),
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
