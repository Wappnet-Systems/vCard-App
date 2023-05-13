import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import '../utils/constants_color.dart';
import '../widget/text_button_widget.dart';

class Contectcardtheme1 extends StatefulWidget {
  final int? id;
  const Contectcardtheme1({
    super.key,
    required this.id,
  });

  @override
  State<Contectcardtheme1> createState() => _Contectcardtheme1State();
}

class _Contectcardtheme1State extends State<Contectcardtheme1> {
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
          height: hp(100, context),
          decoration: BoxDecoration(
            color: BLUE_COLOR,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
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
                  Container(
                    width: wp(80, context),
                    height: hp(25, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .listofUsers[contactcardindex!].color!]
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
                          height: hp(5, context),
                        ),
                        Center(
                            child: Text(
                                "${Staticmenbers.listofUsers[contactcardindex!].compeny}",
                                style: const TextStyle(fontSize: 24))),
                      ],
                    ),
                  ),
                  SizedBox(height: hp(3, context)),
                  Container(
                    width: wp(80, context),
                    height: hp(30, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .listofUsers[contactcardindex!].color!]
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
                          height: hp(12, context),
                        ),
                        Center(
                            child: Text(
                                "${Staticmenbers.listofUsers[contactcardindex!].name}",
                                style: const TextStyle(fontSize: 24))),
                        SizedBox(
                          height: hp(0.10, context),
                        ),
                        Center(
                            child: Text(
                                "${Staticmenbers.listofUsers[contactcardindex!].department}",
                                style: const TextStyle(fontSize: 14))),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Center(
                              child: Text(
                                  "${Staticmenbers.listofUsers[contactcardindex!].headline}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 11))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: hp(3, context)),
                  Container(
                    width: wp(80, context),
                    height: hp(10, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .listofUsers[contactcardindex!].color!]
                              : Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                          height: hp(15, context),
                          width: wp(60, context),
                          alignment: Alignment.center,
                          child: Wrap(
                              runSpacing: 5.0,
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'tel:+${Staticmenbers.listofUsers[contactcardindex!].phone.toString()}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/call.png",
                                      scale: 18,
                                      color: BLUE_COLOR,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(
                                          Uri.parse(
                                              'https://wa.me/${Staticmenbers.listofUsers[contactcardindex!].whatsapp}?text=Hi'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Image.asset(
                                      "assets/icon/whats.png",
                                      scale: 18,
                                      color: BLUE_COLOR,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'mailto:${Staticmenbers.listofUsers[contactcardindex!].email}'));
                                    },
                                    child: Image.asset(
                                      "assets/icon/email.png",
                                      scale: 18,
                                      color: BLUE_COLOR,
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
                                      color: BLUE_COLOR,
                                    ),
                                  ),
                                ),
                              ])),
                    ),
                  ),
                  SizedBox(height: hp(3, context)),
                  Container(
                    width: wp(80, context),
                    height: hp(10, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Staticmenbers
                                      .cardUsers[contactcardindex!].color !=
                                  null
                              ? colorList[Staticmenbers
                                  .listofUsers[contactcardindex!].color!]
                              : Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        height: hp(15, context),
                        width: wp(60, context),
                        alignment: Alignment.center,
                        child: Wrap(
                            runSpacing: 5.0,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "https://telegram.me/${Staticmenbers.listofUsers[contactcardindex!].telegram}"));
                                  },
                                  child: Image.asset(
                                    "assets/icon/tele.png",
                                    scale: 18,
                                    color: BLUE_COLOR,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        'https://${Staticmenbers.listofUsers[contactcardindex!].website}';

                                    await launchUrl(Uri.parse(url));
                                  },
                                  child: Image.asset(
                                    "assets/icon/website.png",
                                    scale: 18,
                                    color: BLUE_COLOR,
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
                                    color: BLUE_COLOR,
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
                                        content: const Text('',
                                            style: TextStyle(
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
                                                color: PRIMARY_COLOR,
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
                                    color: BLUE_COLOR,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 110,
              left: 90,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: BLUE_COLOR, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child:
                        Staticmenbers.listofUsers[contactcardindex!].image == ""
                            ? Image.asset(
                                "assets/images/splash1.png",
                                width: wp(40, context),
                                height: hp(20, context),
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                "${Staticmenbers.listofUsers[contactcardindex!].image}",
                                width: wp(40, context),
                                height: hp(20, context),
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
