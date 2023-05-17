import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';

class DefultCard extends StatefulWidget {
  final int? id;

  const DefultCard({super.key, required this.id});

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
        backgroundColor: WHITE_COLOR,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Gold, width: wp(0.5, context)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 30,
                color: BLACK_COLOR,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 35, top: 10, bottom: 10),
                        child: (Staticmenbers.listofUsers[cardindex!].compeny ==
                                "")
                            ? Container()
                            : Text(
                                '${Staticmenbers.listofUsers[cardindex!].compeny}',
                                style: const TextStyle(
                                    fontFamily: 'Marck',
                                    fontSize: 23,
                                    color: Gold,
                                    fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Staticmenbers.listofUsers[cardindex!].image == ""
                            ? ClipRRect(
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(90, context),
                                  height: hp(30, context),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50)),
                                  border: Border.all(
                                      color: Gold, width: wp(0.1, context)),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Gold,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50)),
                                  child: Image.network(
                                    "${Staticmenbers.listofUsers[cardindex!].image}",
                                    width: wp(70, context),
                                    height: hp(25, context),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: hp(1.5, context)),
                      Center(
                        child:
                            (Staticmenbers.listofUsers[cardindex!].name == "")
                                ? Container()
                                : Text(
                                    '${Staticmenbers.listofUsers[cardindex!].name}',
                                    style: const TextStyle(
                                        fontFamily: 'Marck',
                                        fontSize: 25,
                                        color: Gold,
                                        fontWeight: FontWeight.bold),
                                  ),
                      ),
                      SizedBox(height: hp(0.5, context)),
                      Center(
                        child:
                            (Staticmenbers.listofUsers[cardindex!].department ==
                                    "")
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    child: Text(
                                        '${Staticmenbers.listofUsers[cardindex!].department}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Marck',
                                            fontSize: 20,
                                            color: Gold,
                                            fontWeight: FontWeight.bold)),
                                  ),
                      ),
                      SizedBox(height: hp(0.5, context)),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(
                          color: Gold,
                          thickness: 2,
                          height: 1,
                        ),
                      ),
                      Staticmenbers.listofUsers[cardindex!].telegram != "" &&
                                  Staticmenbers.listofUsers[cardindex!].telegram !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].whatsapp != "" &&
                                  Staticmenbers.listofUsers[cardindex!].whatsapp !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].website != "" &&
                                  Staticmenbers.listofUsers[cardindex!].website !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].address !=
                                      "" &&
                                  Staticmenbers.listofUsers[cardindex!].address !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].email != "" &&
                                  Staticmenbers.listofUsers[cardindex!].email !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].facebook !=
                                      "" &&
                                  Staticmenbers
                                          .listofUsers[cardindex!].facebook !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].link != "" &&
                                  Staticmenbers.listofUsers[cardindex!].link !=
                                      null ||
                              Staticmenbers.listofUsers[cardindex!].phone != "" &&
                                  Staticmenbers.listofUsers[cardindex!].phone !=
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
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .phone ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/call.png",
                                                  scale: 17,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .whatsapp ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                                  scale: 15,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .email ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/email.png",
                                                  scale: 15,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .facebook ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/Face.png",
                                                  scale: 17,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .telegram ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/tele.png",
                                                  scale: 16,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .website ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final url =
                                                      'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                                  await launchUrl(
                                                      Uri.parse(url));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/website.png",
                                                  scale: 15,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .link ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final url =
                                                      'https://${Staticmenbers.listofUsers[cardindex!].link}';

                                                  await launchUrl(
                                                      Uri.parse(url));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/lin.png",
                                                  scale: 16,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers.listofUsers[cardindex!]
                                                  .address ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                                          style: const TextStyle(
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
                                                              title: 'Use Map',
                                                              fontSize: null,
                                                              color: BLUE_COLOR,
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
                                                  "assets/icon/pin.png",
                                                  scale: 15,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                    ]),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 35, top: 10, bottom: 10),
                      ),
                    ]),
              ),
            ])),
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
