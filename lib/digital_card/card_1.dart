import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';

import '../utils/constants_color.dart';
import '../widget/text_button_widget.dart';

class cardtheme1 extends StatelessWidget {
  const cardtheme1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("abc"),
        backgroundColor: BLUE_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.ios_share_rounded),
          ),
        ],
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: wp(100, context),
          height: hp(100, context),
          decoration: BoxDecoration(
            color: BLUE_COLOR,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8.0,
              ),
              BoxShadow(
                  // color: Colors.white,
                  // offset: const Offset(0.0, 0.0),
                  // blurRadius: 0.0,
                  // spreadRadius: 0.0,
                  ),
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
                        BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
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
                            child: Text("Compeny",
                                style: TextStyle(fontSize: 24))),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: wp(80, context),
                    height: hp(30, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
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
                            child:
                                Text("Name", style: TextStyle(fontSize: 24))),
                        SizedBox(
                          height: hp(0.10, context),
                        ),
                        Center(
                            child: Text("Department",
                                style: TextStyle(fontSize: 14))),
                        SizedBox(
                          height: hp(2, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Center(
                              child: Text("Headline",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 11))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: wp(80, context),
                    height: hp(10, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
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
                                      // UrlLauncher.launch(
                                      //     'tel:+${Staticmenbers.listofUsers[cardindex!].phone.toString()}');
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
                                              'https://wa.me/$Staticmenbers.listofUsers[cardindex!].whatsapp?text=Hi'),
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
                                      // UrlLauncher.launch(
                                      //     'mailto:${Staticmenbers.listofUsers[cardindex!].email}');
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
                                      // UrlLauncher.launch(
                                      //     'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}');
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
                  SizedBox(height: 15),
                  Container(
                    width: wp(80, context),
                    height: hp(10, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // color: Colors.white,
                          blurRadius: 8.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
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
                                    // UrlLauncher.launch(
                                    //     "https://telegram.me/$Staticmenbers.listofUsers[cardindex!].telegram");
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
                                    // final url =
                                    //     'https://${Staticmenbers.listofUsers[cardindex!].website}';

                                    // await launch(url);
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
                                    // final url =
                                    //     'https://${Staticmenbers.listofUsers[cardindex!].link}';

                                    // await launch(url);
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
                                        content: Text('',
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
                                                  // _pushMap();
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
              left: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: BLUE_COLOR, width: 5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: ClipOval(
                    child: Image.asset(
                  "assets/images/splash1.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
