import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE_COLOR,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: WHITE_COLOR,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: WHITE_COLOR,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              color: Staticmenbers.cardUsers[contactcardindex!].color != null
                  ? colorList[Staticmenbers.cardUsers[contactcardindex!].color!]
                  : BLUE_COLOR,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: (Staticmenbers
                                  .listofUsers[contactcardindex!].compeny ==
                              "")
                          ? Container()
                          : Text(
                              '${Staticmenbers.listofUsers[contactcardindex!].compeny}',
                              style: const TextStyle(
                                  fontFamily: 'Marck',
                                  fontSize: 23,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child:
                          Staticmenbers.listofUsers[contactcardindex!].image ==
                                  ""
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(90, context),
                                  height: hp(30, context),
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  "${Staticmenbers.listofUsers[contactcardindex!].image}",
                                  width: wp(90, context),
                                  height: hp(28, context),
                                  fit: BoxFit.fill,
                                ),
                    ),
                    SizedBox(height: hp(1.5, context)),
                    Center(
                      child:
                          (Staticmenbers.listofUsers[contactcardindex!].name ==
                                  "")
                              ? Container()
                              : Text(
                                  '${Staticmenbers.listofUsers[contactcardindex!].name}',
                                  style: const TextStyle(
                                      fontFamily: 'Marck',
                                      fontSize: 25,
                                      color: WHITE_COLOR,
                                      fontWeight: FontWeight.bold),
                                ),
                    ),
                    SizedBox(height: hp(0.5, context)),
                    Center(
                      child: (Staticmenbers
                                  .listofUsers[contactcardindex!].department ==
                              "")
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Text(
                                  '${Staticmenbers.listofUsers[contactcardindex!].department}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Marck',
                                      fontSize: 20,
                                      color: WHITE_COLOR,
                                      fontWeight: FontWeight.bold)),
                            ),
                    ),
                    SizedBox(height: hp(0.5, context)),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: WHITE_COLOR,
                        thickness: 2,
                        height: 1,
                      ),
                    ),
                    Staticmenbers.listofUsers[contactcardindex!].telegram != "" &&
                                Staticmenbers.listofUsers[contactcardindex!]
                                        .telegram !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].whatsapp != "" &&
                                Staticmenbers.listofUsers[contactcardindex!]
                                        .whatsapp !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].website != "" &&
                                Staticmenbers.listofUsers[contactcardindex!].website !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].address != "" &&
                                Staticmenbers.listofUsers[contactcardindex!].address !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].email != "" &&
                                Staticmenbers.listofUsers[contactcardindex!].email !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].facebook != "" &&
                                Staticmenbers.listofUsers[contactcardindex!]
                                        .facebook !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].link != "" &&
                                Staticmenbers.listofUsers[contactcardindex!].link !=
                                    null ||
                            Staticmenbers.listofUsers[contactcardindex!].phone != "" &&
                                Staticmenbers.listofUsers[contactcardindex!].phone != null
                        ? Center(
                            child: Container(
                              height: hp(15, context),
                              width: wp(70, context),
                              alignment: Alignment.center,
                              child: Wrap(
                                  runSpacing: 5.0,
                                  alignment: WrapAlignment.center,
                                  runAlignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .phone ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    'tel:+${Staticmenbers.listofUsers[contactcardindex!].phone.toString()}'));
                                              },
                                              child: Image.asset(
                                                "assets/icon/telephone.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .whatsapp ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(
                                                    Uri.parse(
                                                        'https://wa.me/$Staticmenbers.listofUsers[contactcardindex!].whatsapp?text=Hi'),
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              },
                                              child: Image.asset(
                                                "assets/icon/whatsapp.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .email ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    'mailto:${Staticmenbers.listofUsers[contactcardindex!].email}'));
                                              },
                                              child: Image.asset(
                                                "assets/icon/mail.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .facebook ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    'https://www.facebook.com/{${Staticmenbers.listofUsers[contactcardindex!].facebook}}'));
                                              },
                                              child: Image.asset(
                                                "assets/icon/facebook.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .telegram ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    "https://telegram.me/$Staticmenbers.listofUsers[contactcardindex!].telegram"));
                                              },
                                              child: Image.asset(
                                                "assets/icon/telegram.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .website ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                final url =
                                                    '${Staticmenbers.listofUsers[contactcardindex!].website}';

                                                await launchUrl(Uri.parse(url));
                                              },
                                              child: Image.asset(
                                                "assets/icon/web.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .link ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                final url =
                                                    '${Staticmenbers.listofUsers[contactcardindex!].link}';

                                                await launchUrl(Uri.parse(url));
                                              },
                                              child: Image.asset(
                                                "assets/icon/link.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                    (Staticmenbers
                                                .listofUsers[contactcardindex!]
                                                .address ==
                                            "")
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    content: Text(
                                                        '${Staticmenbers.listofUsers[contactcardindex!].address}',
                                                        style: const TextStyle(
                                                            fontFamily: 'Marck',
                                                            fontSize: 25,
                                                            color: WHITE_COLOR,
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
                                                "assets/icon/location.png",
                                                scale: 14,
                                              ),
                                            ),
                                          ),
                                  ]),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _pushMap() async {
    if (Staticmenbers.listofUsers[contactcardindex!].address == "") {
      displayCustomToast();
    } else {
      String googleUrl =
          "google.navigation:q=${Staticmenbers.listofUsers[contactcardindex!].address}";
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
