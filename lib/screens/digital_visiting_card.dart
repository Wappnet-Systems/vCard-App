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
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: BLUE_COLOR,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Text(
                          '${Staticmenbers.listofUsers[cardindex!].compeny}',
                          style: TextStyle(
                              fontSize: 23,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(145),
                          ),
                        ),
                        child: ClipOval(
                            child: Image.network(
                          "${Staticmenbers.listofUsers[cardindex!].image}",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        '${Staticmenbers.listofUsers[cardindex!].name}',
                        style: TextStyle(
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
                              fontSize: 25,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Divider(
                        color: PRIMARY_COLOR,
                        thickness: 2,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}');
                        },
                        child: Image.asset(
                          "assets/icon/telephone.png",
                          scale: 12,
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
                          scale: 12,
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              'mailto:${Staticmenbers.listofUsers[cardindex!].email}');
                        },
                        child: Image.asset(
                          "assets/icon/gmail.png",
                          scale: 35,
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
                          scale: 12,
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
                            scale: 12,
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
                            scale: 12,
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
                            scale: 12,
                          ),
                        ),
                        SizedBox(width: 25),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Address"),
                                content: Text(
                                    '${Staticmenbers.listofUsers[cardindex!].address}'),
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
                            scale: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                          '${Staticmenbers.listofUsers[cardindex!].headline}',
                          style: TextStyle(
                              fontSize: 25,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.bold)),
                    ),
                  ]),
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButton: Align(
        //   alignment: Alignment.bottomRight * 0.9,
        //   child: FloatingActionButton.extended(
        //     icon: Icon(Icons.send_sharp),
        //     label: Text('SEND'),
        //     backgroundColor: PRIMARY_COLOR,
        //     onPressed: () {
        //       setState(() {});
        //     },
        //   ),
        // ),
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
