import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

  @override
  void initState() {
    super.initState();
    cardindex = widget.id;
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
                  borderRadius: BorderRadius.circular(30.0), //<-- SEE HERE
                ),
                elevation: 30,
                color: BLUE_COLOR,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Text(
                            '${Staticmenbers.listofUsers[cardindex!].compeny}',
                            style: TextStyle(
                                fontFamily: 'Marck',
                                fontSize: 23,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Image.network(
                          "${Staticmenbers.listofUsers[cardindex!].image}",
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
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
                        child: Text(
                            '${Staticmenbers.listofUsers[cardindex!].department}',
                            style: TextStyle(
                                fontFamily: 'Marck',
                                fontSize: 23,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Divider(
                          color: WHITE_COLOR,
                          thickness: 2,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                UrlLauncher.launch(
                                    'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}');
                              },
                              child: Image.asset(
                                "assets/icon/telephone.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    Uri.parse(
                                        'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Image.asset(
                                "assets/icon/whatsapp.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                UrlLauncher.launch(
                                    'mailto:${Staticmenbers.listofUsers[cardindex!].email}');
                              },
                              child: Image.asset(
                                "assets/icon/mail.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                UrlLauncher.launch(
                                    "fb://facewebmodal/f?href=$Staticmenbers.listofUsers[cardindex!].facebook");
                              },
                              child: Image.asset(
                                "assets/icon/facebook.png",
                                scale: 14,
                              ),
                            ),
                          ]),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              UrlLauncher.launch(
                                  "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram");
                            },
                            child: Image.asset(
                              "assets/icon/telegram.png",
                              scale: 14,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              Uri.parse(
                                  'website${Staticmenbers.listofUsers[cardindex!].website}');
                            },
                            child: Image.asset(
                              "assets/icon/web.png",
                              scale: 14,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              Uri.parse(
                                  "${Staticmenbers.listofUsers[cardindex!].link}");
                            },
                            child: Image.asset(
                              "assets/icon/link.png",
                              scale: 14,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
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
                                      style: TextStyle(
                                          fontFamily: 'Marck',
                                          fontSize: 25,
                                          color: WHITE_COLOR,
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
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
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
}
