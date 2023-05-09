import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:vcard/utils/style.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';

class DefultCard extends StatefulWidget {
  final int? id;

  DefultCard({super.key, required this.id});

  @override
  State<DefultCard> createState() => _DefultCardState();
}

class _DefultCardState extends State<DefultCard> {
  int? cardindex;
  int? contectcardindex;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    cardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Container(
                decoration: new BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: WHITE_COLOR,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: WHITE_COLOR,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 30,
                  color: BLUE_COLOR,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: (Staticmembers
                                      .listofUsers[cardindex!].compeny ==
                                  "")
                              ? Container()
                              : Text(
                                  '${Staticmembers.listofUsers[cardindex!].compeny}',
                                  style: TextStyle(
                                      fontFamily: 'Marck',
                                      fontSize: 23,
                                      color: WHITE_COLOR,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Center(
                          child:
                              Staticmembers.listofUsers[cardindex!].image == ""
                                  ? Image.asset(
                                      "assets/images/splash1.png",
                                      width: wp(90, context),
                                      height: hp(30, context),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "${Staticmembers.listofUsers[cardindex!].image}",
                                      width: wp(90, context),
                                      height: hp(28, context),
                                      fit: BoxFit.fill,
                                    ),
                        ),
                        SizedBox(height: hp(1.5, context)),
                        Center(
                          child:
                              (Staticmembers.listofUsers[cardindex!].name == "")
                                  ? Container()
                                  : Text(
                                      '${Staticmembers.listofUsers[cardindex!].name}',
                                      style: TextStyle(
                                          fontFamily: 'Marck',
                                          fontSize: 25,
                                          color: WHITE_COLOR,
                                          fontWeight: FontWeight.bold),
                                    ),
                        ),
                        SizedBox(height: hp(0.5, context)),
                        Center(
                          child: (Staticmembers
                                      .listofUsers[cardindex!].department ==
                                  "")
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  child: Text(
                                      '${Staticmembers.listofUsers[cardindex!].department}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Marck',
                                          fontSize: 20,
                                          color: WHITE_COLOR,
                                          fontWeight: FontWeight.bold)),
                                ),
                        ),
                        SizedBox(height: hp(0.5, context)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: WHITE_COLOR,
                            thickness: 2,
                            height: 1,
                          ),
                        ),
                        Staticmembers.listofUsers[cardindex!].telegram != "" &&
                                    Staticmembers.listofUsers[cardindex!].telegram !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].whatsapp != "" &&
                                    Staticmembers.listofUsers[cardindex!].whatsapp !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].website != "" &&
                                    Staticmembers.listofUsers[cardindex!].website !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].address != "" &&
                                    Staticmembers.listofUsers[cardindex!].address !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].email != "" &&
                                    Staticmembers.listofUsers[cardindex!].email !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].facebook !=
                                        "" &&
                                    Staticmembers
                                            .listofUsers[cardindex!].facebook !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].link != "" &&
                                    Staticmembers.listofUsers[cardindex!].link !=
                                        null ||
                                Staticmembers.listofUsers[cardindex!].phone != "" &&
                                    Staticmembers.listofUsers[cardindex!].phone !=
                                        null
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
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .phone ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    UrlLauncher.launchUrl(Uri.parse(
                                                        'tel:+${Staticmembers.listofUsers[cardindex!].phone.toString()}'));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/telephone.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .whatsapp ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    launchUrl(
                                                        Uri.parse(
                                                            'https://wa.me/${Staticmembers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/whatsapp.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .email ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    UrlLauncher.launchUrl(Uri.parse(
                                                        'mailto:${Staticmembers.listofUsers[cardindex!].email}'));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/mail.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .facebook ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    UrlLauncher.launchUrl(Uri.parse(
                                                        'https://www.facebook.com/{${Staticmembers.listofUsers[cardindex!].facebook}}'));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/facebook.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .telegram ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    UrlLauncher.launchUrl(Uri.parse(
                                                        "https://telegram.me/${Staticmembers.listofUsers[cardindex!].telegram}"));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/telegram.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .website ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final url =
                                                        'https://${Staticmembers.listofUsers[cardindex!].website}';

                                                    await launchUrl(
                                                        Uri.parse(url));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/web.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .link ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final url =
                                                        'https://${Staticmembers.listofUsers[cardindex!].link}';

                                                    await launchUrl(
                                                        Uri.parse(url));
                                                  },
                                                  child: Image.asset(
                                                    "assets/icon/link.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                        (Staticmembers.listofUsers[cardindex!]
                                                    .address ==
                                                "")
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                            '${Staticmembers.listofUsers[cardindex!].address}',
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
                                                                onPressed: () {
                                                                  _pushMap();
                                                                },
                                                                title:
                                                                    'Use Map',
                                                                fontSize: null,
                                                                color:
                                                                    PRIMARY_COLOR,
                                                              ),
                                                              TextButtomWidget(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                title: 'Cancle',
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
                                                    "assets/icon/location.png",
                                                    scale: 14,
                                                  ),
                                                ),
                                              ),
                                      ]),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Container(
                          padding: EdgeInsets.all(25),
                          child: (Staticmembers
                                      .listofUsers[cardindex!].headline ==
                                  "")
                              ? Container()
                              : Text(
                                  '${Staticmembers.listofUsers[cardindex!].headline}',
                                  style: TextStyle(
                                      fontFamily: 'Marck',
                                      fontSize: 25,
                                      color: WHITE_COLOR,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ]),
                ),
              ),
            ])),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmembers.listofUsers[cardindex!].address}";

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
