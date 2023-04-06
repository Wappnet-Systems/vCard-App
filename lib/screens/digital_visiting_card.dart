import 'dart:ui';

import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    cardindex = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Card(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        '${Staticmenbers.listofUsers[cardindex!].name}',
                        style: TextStyle(
                            fontSize: 30,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: ClipOval(
                            child: Image.network(
                          "${Staticmenbers.listofUsers[cardindex!].image}",
                          width: 170,
                          height: 170,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/template2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 90),
                    Text('${Staticmenbers.listofUsers[cardindex!].department}',
                        style: TextStyle(
                            fontSize: 25,
                            color: BLACK_COLOR,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text('${Staticmenbers.listofUsers[cardindex!].compeny}',
                        style: TextStyle(
                            fontSize: 25,
                            color: BLACK_COLOR,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text('${Staticmenbers.listofUsers[cardindex!].headline}',
                        style: TextStyle(
                            fontSize: 25,
                            color: BLACK_COLOR,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 40),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}');
                        },
                        child: Image.asset(
                          "assets/icon/call.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          launchUrl(
                              Uri.parse(
                                  'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Image.asset(
                          "assets/icon/whatsapp.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              'mailto:${Staticmenbers.listofUsers[cardindex!].email}');
                        },
                        child: Image.asset(
                          "assets/icon/email.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              "fb://facewebmodal/f?href=$Staticmenbers.listofUsers[cardindex!].facebook");
                        },
                        child: Image.asset(
                          "assets/icon/facebook.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          UrlLauncher.launch(
                              "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram");
                        },
                        child: Image.asset(
                          "assets/icon/telegram.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          Uri.parse(
                              'website${Staticmenbers.listofUsers[cardindex!].website}');
                        },
                        child: Image.asset(
                          "assets/icon/website.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      InkWell(
                        onTap: () {
                          Uri.parse(
                              "${Staticmenbers.listofUsers[cardindex!].link}");
                        },
                        child: Image.asset(
                          "assets/icon/link.png",
                          scale: 20,
                        ),
                      ),

                      SizedBox(width: 9),
                      Image.asset(
                        "assets/icon/snapchat.png",
                        scale: 20,
                      ),
                      // Text('${Staticmenbers.listofUsers[cardindex!].snapchat}',
                      //     style: TextStyle(
                      //         fontSize: 25,
                      //         color: BLACK_COLOR,
                      //         fontWeight: FontWeight.bold)),
                      SizedBox(width: 9),
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
                                    // TextButtomWidget(
                                    //   onPressed: () {},
                                    //   title: 'Abc',
                                    //   color: PRIMARY_COLOR,
                                    // ),
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
                          "assets/icon/address.png",
                          scale: 15,
                        ),
                      ),
                    ]),
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight * 0.9,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.send_sharp),
          label: Text('SEND'),
          backgroundColor: PRIMARY_COLOR,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
