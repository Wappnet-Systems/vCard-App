import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../widget/alart_dialog_widget.dart';
import '../widget/text_button_widget.dart';

class Digitalvisitingcard extends StatefulWidget {
  final int? id;
  Digitalvisitingcard({super.key, required this.id});

  @override
  State<Digitalvisitingcard> createState() => _DigitalvisitingcardState();
}

class _DigitalvisitingcardState extends State<Digitalvisitingcard> {
  int? cardindex;
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Your Card"),
          backgroundColor: BLUE_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 30,
                color: BLUE_COLOR,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        child: (Staticmenbers.listofUsers[cardindex!].compeny ==
                                "")
                            ? Container()
                            : Text(
                                '${Staticmenbers.listofUsers[cardindex!].compeny}',
                                style: TextStyle(
                                    fontFamily: 'Marck',
                                    fontSize: 23,
                                    color: WHITE_COLOR,
                                    fontWeight: FontWeight.bold)),
                      ),
                      Staticmenbers.listofUsers[cardindex!].image == ""
                          ? Image.asset(
                              "assets/images/splash1.png",
                              width: 400,
                              height: 146,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Image.network(
                                "${Staticmenbers.listofUsers[cardindex!].image}",
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                      SizedBox(height: 10),
                      Center(
                        child:
                            (Staticmenbers.listofUsers[cardindex!].name == "")
                                ? Container()
                                : Text(
                                    '${Staticmenbers.listofUsers[cardindex!].name}',
                                    style: TextStyle(
                                        fontFamily: 'Marck',
                                        fontSize: 25,
                                        color: WHITE_COLOR,
                                        fontWeight: FontWeight.bold),
                                  ),
                      ),
                      SizedBox(height: 2),
                      Center(
                        child: (Staticmenbers
                                    .listofUsers[cardindex!].department ==
                                "")
                            ? Container()
                            : Text(
                                '${Staticmenbers.listofUsers[cardindex!].department}',
                                style: TextStyle(
                                    fontFamily: 'Marck',
                                    fontSize: 23,
                                    color: WHITE_COLOR,
                                    fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Divider(
                          color: WHITE_COLOR,
                          thickness: 2,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 250,
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Wrap(children: [
                              (Staticmenbers.listofUsers[cardindex!].phone ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          UrlLauncher.launch(
                                              'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}');
                                        },
                                        child: Image.asset(
                                          "assets/icon/telephone.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].whatsapp ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          launchUrl(
                                              Uri.parse(
                                                  'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        child: Image.asset(
                                          "assets/icon/whatsapp.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].email ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          UrlLauncher.launch(
                                              'mailto:${Staticmenbers.listofUsers[cardindex!].email}');
                                        },
                                        child: Image.asset(
                                          "assets/icon/mail.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].facebook ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          UrlLauncher.launch(
                                              'https://www.facebook.com/{$Staticmenbers.listofUsers[cardindex!].facebook}');
                                        },
                                        child: Image.asset(
                                          "assets/icon/facebook.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].telegram ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          UrlLauncher.launch(
                                              "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram");
                                        },
                                        child: Image.asset(
                                          "assets/icon/telegram.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].website ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () async {
                                          final url =
                                              '${Staticmenbers.listofUsers[cardindex!].website}';

                                          await launch(url);
                                        },
                                        child: Image.asset(
                                          "assets/icon/web.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].link == "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () async {
                                          final url =
                                              '${Staticmenbers.listofUsers[cardindex!].link}';

                                          await launch(url);
                                        },
                                        child: Image.asset(
                                          "assets/icon/link.png",
                                          scale: 14,
                                        ),
                                      ),
                                    ),
                              (Staticmenbers.listofUsers[cardindex!].address ==
                                      "")
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                                          FontWeight.bold)),
                                              content: Text(
                                                  '${Staticmenbers.listofUsers[cardindex!].address}',
                                                  style: TextStyle(
                                                      fontFamily: 'Marck',
                                                      fontSize: 25,
                                                      color: WHITE_COLOR,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                      color: PRIMARY_COLOR,
                                                    ),
                                                    TextButtomWidget(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      title: 'Cancle',
                                                      color: Colors.redAccent,
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
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(25),
                        child: (Staticmenbers
                                    .listofUsers[cardindex!].headline ==
                                "")
                            ? Container()
                            : Text(
                                '${Staticmenbers.listofUsers[cardindex!].headline}',
                                style: TextStyle(
                                    fontFamily: 'Marck',
                                    fontSize: 25,
                                    color: WHITE_COLOR,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "google.navigation:q=${Staticmenbers.listofUsers[cardindex!].address}";
    Uri googleUri = Uri.parse(googleUrl);

    if (await canLaunchUrl(googleUri)) {
      await launchUrl(googleUri);
      print(googleUri);
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
