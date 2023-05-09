import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class Contectcardtheme4 extends StatefulWidget {
  final int? id;
  const Contectcardtheme4({super.key, required this.id});

  @override
  State<Contectcardtheme4> createState() => _Contectcardtheme4State();
}

class _Contectcardtheme4State extends State<Contectcardtheme4> {
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
    return Center(
        child: Container(
      width: wp(95, context),
      height: hp(37, context),
      margin: EdgeInsets.symmetric(
        horizontal: wp(4, context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: WHITE_COLOR,
        boxShadow: [
          BoxShadow(
            color: COLOR_PRIMARY_DARK.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(1, -1),
          ),
          BoxShadow(
            color: COLOR_PRIMARY_DARK.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(-1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(4, context),
                    vertical: hp(2, context),
                  ),
                  child: Text(
                    "${Staticmembers.listofUsers[contactcardindex!].compeny?.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: COLOR_PRIMARY_DARK,
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(2.5, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(3, context),
                        vertical: hp(2.1, context),
                      ),
                      decoration: BoxDecoration(
                        color: BLUE_COLOR,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: COLOR_PRIMARY_DARK.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(1, 0),
                          ),
                          BoxShadow(
                            color: COLOR_PRIMARY_DARK.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              UrlLauncher.launchUrl(Uri.parse(
                                  'tel:+${Staticmembers.listofUsers[contactcardindex!].phone.toString()}'));
                            },
                            child: Image.asset(
                              "assets/icon/call.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: hp(2, context),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://wa.me/$Staticmembers.listofUsers[contactcardindex!].whatsapp?text=Hi'),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Image.asset(
                              "assets/icon/whats.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: hp(2, context),
                          ),
                          InkWell(
                            onTap: () {
                              UrlLauncher.launchUrl(Uri.parse(
                                  'mailto:${Staticmembers.listofUsers[contactcardindex!].email}'));
                            },
                            child: Image.asset(
                              "assets/icon/email.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: hp(2, context),
                          ),
                          InkWell(
                            onTap: () async {
                              final url =
                                  'https://${Staticmembers.listofUsers[contactcardindex!].website}';

                              await launchUrl(Uri.parse(url));
                            },
                            child: Image.asset(
                              "assets/icon/website.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: hp(2, context),
                          ),
                          InkWell(
                            onTap: () {
                              UrlLauncher.launch(
                                  'https://www.facebook.com/{${Staticmembers.listofUsers[contactcardindex!].facebook}}');
                            },
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: wp(2, context),
                      ),
                      child: SizedBox(
                        width: wp(45, context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .phone ==
                                          "" ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .phone ==
                                          null
                                  ? "+91 1234567890"
                                  : "${Staticmembers.listofUsers[contactcardindex!].phone}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_PRIMARY_DARK,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: hp(2.5, context),
                            ),
                            Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .whatsapp ==
                                          "" ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .whatsapp ==
                                          null
                                  ? "+91 1234567890"
                                  : "${Staticmembers.listofUsers[contactcardindex!].whatsapp}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_PRIMARY_DARK,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: hp(2.5, context),
                            ),
                            Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .email ==
                                          "" ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .email ==
                                          null
                                  ? "arti@mailinator.com"
                                  : "${Staticmembers.listofUsers[contactcardindex!].email}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_PRIMARY_DARK,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: hp(2.5, context),
                            ),
                            Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .website ==
                                          "" ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .website ==
                                          null
                                  ? "www.gmail.com"
                                  : "${Staticmembers.listofUsers[contactcardindex!].website}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_PRIMARY_DARK,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: hp(2.3, context),
                            ),
                            Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .facebook ==
                                          "" ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .facebook ==
                                          null
                                  ? "chauhan arti"
                                  : "${Staticmembers.listofUsers[contactcardindex!].facebook}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_PRIMARY_DARK,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          VerticalDivider(
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.4),
            thickness: 1,
            endIndent: hp(3, context),
            indent: hp(3, context),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: wp(3, context),
                vertical: hp(2, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${Staticmembers.listofUsers[contactcardindex!].name?[0].toUpperCase()}${Staticmembers.listofUsers[contactcardindex!].name?.substring(1).toLowerCase()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: BLUE_COLOR,
                    ),
                  ),
                  SizedBox(
                    height: hp(0.5, context),
                  ),
                  Text(
                    "${Staticmembers.listofUsers[contactcardindex!].department}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: COLOR_PRIMARY_LIGHT,
                    ),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child:
                        Staticmembers.listofUsers[contactcardindex!].image == ""
                            ? Image.asset(
                                "assets/images/splash1.png",
                                width: wp(25, context),
                                height: hp(13, context),
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                "${Staticmembers.listofUsers[contactcardindex!].image}",
                                width: wp(25, context),
                                height: hp(13, context),
                                fit: BoxFit.fill,
                              ),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          UrlLauncher.launchUrl(Uri.parse(
                              "https://telegram.me/$Staticmembers.listofUsers[contactcardindex!].telegram"));
                        },
                        child: Image.asset(
                          "assets/icon/tele.png",
                          scale: 30,
                          color: BLUE_COLOR,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final url =
                              'https://${Staticmembers.listofUsers[contactcardindex!].link}';

                          await launchUrl(Uri.parse(url));
                        },
                        child: Image.asset(
                          "assets/icon/lin.png",
                          scale: 30,
                          color: BLUE_COLOR,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (ctx) => AlertDialog(
                          //     backgroundColor: BLUE_COLOR,
                          //     title: const Text("Address",
                          //         style: TextStyle(
                          //             fontFamily: 'Marck',
                          //             fontSize: 25,
                          //             color: WHITE_COLOR,
                          //             fontWeight: FontWeight.bold)),
                          //     content: Text(
                          //         '${Staticmembers.listofUsers[contactcardindex!].address}',
                          //         style: TextStyle(
                          //             fontFamily: 'Marck',
                          //             fontSize: 25,
                          //             color: WHITE_COLOR,
                          //             fontWeight: FontWeight.bold)),
                          //     actions: <Widget>[
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           TextButtomWidget(
                          //             onPressed: () {
                          //               pushMap();
                          //             },
                          //             title: 'Use Map',
                          //             fontSize: null,
                          //             color: PRIMARY_COLOR,
                          //           ),
                          //           TextButtomWidget(
                          //             onPressed: () {
                          //               Navigator.pop(context);
                          //             },
                          //             title: 'Cancle',
                          //             fontSize: 15,
                          //             color: Colors.redAccent,
                          //           )
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                        child: Image.asset(
                          "assets/icon/pin.png",
                          scale: 30,
                          color: BLUE_COLOR,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  void pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmembers.listofUsers[contactcardindex!].address}";

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
