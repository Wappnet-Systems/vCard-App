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

class contectvisitingcard extends StatefulWidget {
  final int? id;
  contectvisitingcard({super.key, required this.id});

  @override
  State<contectvisitingcard> createState() => _contectvisitingcardState();
}

class _contectvisitingcardState extends State<contectvisitingcard> {
  int? cvc;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    cvc = widget.id;
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Card"),
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
                        child: Text('${Staticmenbers.newUserCar[cvc!].compeny}',
                            style: TextStyle(
                                fontFamily: 'Marck',
                                fontSize: 23,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                      ),
                      Staticmenbers.newUserCar[cvc!].image == ""
                          ? Image.asset(
                              "assets/images/splash1.png",
                              width: 400,
                              height: 146,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Image.network(
                                "${Staticmenbers.newUserCar[cvc!].image}",
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          '${Staticmenbers.newUserCar[cvc!].name}',
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
                            '${Staticmenbers.newUserCar[cvc!].department}',
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
                                if (Staticmenbers.newUserCar[cvc!].phone
                                        .toString() ==
                                    "") {
                                  displayCustomToast();
                                } else {
                                  UrlLauncher.launch(
                                      'tel:+${Staticmenbers.newUserCar[cvc!].phone.toString()}');
                                }
                              },
                              child: Image.asset(
                                "assets/icon/telephone.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                log('${Staticmenbers.newUserCar[cvc!].whatsapp}');
                                if (Staticmenbers.newUserCar[cvc!].whatsapp ==
                                    "") {
                                  displayCustomToast();
                                } else {
                                  launchUrl(
                                      Uri.parse(
                                          'https://wa.me/$Staticmenbers.newUserCar[cvc!].whatsapp?text=Hi'),
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              child: Image.asset(
                                "assets/icon/whatsapp.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                if (Staticmenbers.newUserCar[cvc!].email ==
                                    "") {
                                  displayCustomToast();
                                } else {
                                  UrlLauncher.launch(
                                      'mailto:${Staticmenbers.newUserCar[cvc!].email}');
                                }
                              },
                              child: Image.asset(
                                "assets/icon/mail.png",
                                scale: 14,
                              ),
                            ),
                            SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                if (Staticmenbers.newUserCar[cvc!].facebook ==
                                    "") {
                                  displayCustomToast();
                                } else {
                                  UrlLauncher.launch(
                                      "fb://facewebmodal/f?href=$Staticmenbers.newUserCar[cvc!].facebook");
                                }
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
                              if (Staticmenbers.newUserCar[cvc!].telegram ==
                                  "") {
                                displayCustomToast();
                              } else {
                                UrlLauncher.launch(
                                    "https://telegram.me/$Staticmenbers.newUserCar[cvc!].telegram");
                              }
                            },
                            child: Image.asset(
                              "assets/icon/telegram.png",
                              scale: 14,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              if (Staticmenbers.newUserCar[cvc!].website ==
                                  "") {
                                displayCustomToast();
                              } else {
                                Uri.parse(
                                    'website${Staticmenbers.newUserCar[cvc!].website}');
                              }
                            },
                            child: Image.asset(
                              "assets/icon/web.png",
                              scale: 14,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              if (Staticmenbers.newUserCar[cvc!].link == "") {
                                displayCustomToast();
                              } else {
                                Uri.parse(
                                    "${Staticmenbers.newUserCar[cvc!].link}");
                              }
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
                                      '${Staticmenbers.newUserCar[cvc!].address}',
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
                            '${Staticmenbers.newUserCar[cvc!].headline}',
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
    if (Staticmenbers.newUserCar[cvc!].address == "") {
      displayCustomToast();
    } else {
      String googleUrl =
          "google.navigation:q=${Staticmenbers.newUserCar[cvc!].address}";
      Uri googleUri = Uri.parse(googleUrl);

      if (await canLaunchUrl(googleUri)) {
        await launchUrl(googleUri);
        print(googleUri);
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
