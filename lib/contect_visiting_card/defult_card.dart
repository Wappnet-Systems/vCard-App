import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';
import '../widget/text_widget.dart';

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
                          child: (Staticmenbers
                                      .listofUsers[contactcardindex!].compeny ==
                                  "")
                              ? Container()
                              : Textwidget(
                                  width: wp(40, context),
                                  text:
                                      '${Staticmenbers.listofUsers[contactcardindex!].compeny}',
                                  fontSize: 23,
                                  selectionColor: Gold,
                                )),
                      Center(
                        child: Staticmenbers
                                    .listofUsers[contactcardindex!].image ==
                                ""
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
                                    "${Staticmenbers.listofUsers[contactcardindex!].image}",
                                    width: wp(70, context),
                                    height: hp(25, context),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: hp(1.5, context)),
                      Center(
                          child: (Staticmenbers
                                      .listofUsers[contactcardindex!].name ==
                                  "")
                              ? Container()
                              : Textwidget(
                                  width: wp(40, context),
                                  text:
                                      '${Staticmenbers.listofUsers[contactcardindex!].name}',
                                  fontSize: 25,
                                  selectionColor: Gold,
                                )),
                      SizedBox(height: hp(0.5, context)),
                      Center(
                        child: (Staticmenbers.listofUsers[contactcardindex!]
                                    .department ==
                                "")
                            ? Container()
                            : Textwidget(
                                width: wp(60, context),
                                text:
                                    '${Staticmenbers.listofUsers[contactcardindex!].department}',
                                fontSize: 20,
                                selectionColor: Gold,
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
                                width: wp(60, context),
                                alignment: Alignment.center,
                                child: Wrap(
                                    runSpacing: 5.0,
                                    alignment: WrapAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .phone ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'tel:+${Staticmenbers.listofUsers[contactcardindex!].phone.toString()}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/call.png",
                                                  scale: 17,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
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
                                                          'https://wa.me/${Staticmenbers.listofUsers[contactcardindex!].whatsapp}?text=Hi'),
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
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .email ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'mailto:${Staticmenbers.listofUsers[contactcardindex!].email}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/email.png",
                                                  scale: 15,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .facebook ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      'https://www.facebook.com/{${Staticmenbers.listofUsers[contactcardindex!].facebook}}'));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/Face.png",
                                                  scale: 17,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .telegram ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://telegram.me/${Staticmenbers.listofUsers[contactcardindex!].telegram}"));
                                                },
                                                child: Image.asset(
                                                  "assets/icon/tele.png",
                                                  scale: 16,
                                                  color: Gold,
                                                ),
                                              ),
                                            ),
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .website ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final url =
                                                      'https://${Staticmenbers.listofUsers[contactcardindex!].website}';

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
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
                                                  .link ==
                                              "")
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final url =
                                                      'https://${Staticmenbers.listofUsers[contactcardindex!].link}';

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
                                      (Staticmenbers
                                                  .listofUsers[
                                                      contactcardindex!]
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
                                                          '${Staticmenbers.listofUsers[contactcardindex!].address}',
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
                      const Padding(
                        padding: EdgeInsets.only(left: 35, top: 10, bottom: 10),
                      ),
                    ]),
              ),
            ])),
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
