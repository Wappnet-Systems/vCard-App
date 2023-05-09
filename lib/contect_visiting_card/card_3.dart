import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class Contectcardtheme3 extends StatefulWidget {
  final int? id;
  const Contectcardtheme3({super.key, required this.id});

  @override
  State<Contectcardtheme3> createState() => _Contectcardtheme3State();
}

class _Contectcardtheme3State extends State<Contectcardtheme3> {
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
        margin: EdgeInsets.symmetric(
          horizontal: wp(4, context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: PRIMARY_COLOR,
          boxShadow: [
            BoxShadow(
              color: COLOR_PRIMARY_DARK.withOpacity(0.3),
              blurRadius: 3.0,
              offset: const Offset(1, -1),
            ),
            BoxShadow(
              color: COLOR_PRIMARY_DARK.withOpacity(0.3),
              blurRadius: 3.0,
              offset: const Offset(-1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: wp(46, context),
                  height: hp(35, context),
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(4, context),
                    vertical: hp(2, context),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    color: WHITE_COLOR,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${Staticmembers.listofUsers[contactcardindex!].name?.toUpperCase()}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: COLOR_PRIMARY_DARK),
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "${Staticmembers.listofUsers[contactcardindex!].department}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Staticmembers
                                    .listofUsers[contactcardindex!].image ==
                                ""
                            ? Image.asset(
                                "assets/images/splash1.png",
                                width: wp(25, context),
                                height: hp(13, context),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${Staticmembers.listofUsers[contactcardindex!].image}",
                                width: wp(25, context),
                                height: hp(13, context),
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              urlLauncher.launchUrl(Uri.parse(
                                  "https://telegram.me/${Staticmembers.listofUsers[contactcardindex!].telegram}"));
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
                            onTap: () async {
                              final url =
                                  'https://${Staticmembers.listofUsers[contactcardindex!].website}';

                              await launchUrl(Uri.parse(url));
                            },
                            child: Image.asset(
                              "assets/icon/website.png",
                              scale: 30,
                              color: BLUE_COLOR,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: WHITE_COLOR,
                                  titlePadding: EdgeInsets.symmetric(
                                    horizontal: wp(6, context),
                                    vertical: hp(1.5, context),
                                  ),
                                  title: const Text(
                                    "Address",
                                    style: TextStyle(
                                      fontFamily: 'Marck',
                                      fontSize: 20,
                                      color: BLUE_COLOR,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: wp(6, context),
                                    vertical: hp(1, context),
                                  ),
                                  content: Text(
                                    Staticmembers.listofUsers[contactcardindex!]
                                                    .address ==
                                                null ||
                                            Staticmembers
                                                    .listofUsers[
                                                        contactcardindex!]
                                                    .address ==
                                                ""
                                        ? "N/A"
                                        : '${Staticmembers.listofUsers[contactcardindex!].address}',
                                    style: TextStyle(
                                        fontFamily: 'Marck',
                                        fontSize: 18,
                                        color: BLUE_COLOR.withOpacity(0.8),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: TextButtomWidget(
                                            height: hp(6.5, context),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            title: 'Cancle',
                                            fontSize: 15,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        SizedBox(
                                          width: wp(4, context),
                                        ),
                                        Flexible(
                                          child: TextButtomWidget(
                                            height: hp(6.5, context),
                                            onPressed: () {
                                              pushMap();
                                            },
                                            title: 'Use Map',
                                            fontSize: null,
                                            color: PRIMARY_COLOR,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
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
                Container(
                  width: wp(46, context),
                  height: hp(35, context),
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(3, context),
                    vertical: hp(2, context),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: BLUE_COLOR,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: hp(8, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              urlLauncher.launchUrl(Uri.parse(
                                  'tel:+${Staticmembers.listofUsers[contactcardindex!].phone.toString()}'));
                            },
                            child: Image.asset(
                              "assets/icon/call.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: wp(4, context),
                          ),
                          Expanded(
                            child: Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .phone ==
                                          null ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .phone ==
                                          ""
                                  ? "+91 1234567890"
                                  : "${Staticmembers.listofUsers[contactcardindex!].phone}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://wa.me/${Staticmembers.listofUsers[contactcardindex!].whatsapp}?text=Hi'),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Image.asset(
                              "assets/icon/whats.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: wp(4, context),
                          ),
                          Expanded(
                            child: Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .whatsapp ==
                                          null ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .whatsapp ==
                                          ""
                                  ? "+91 1234567890"
                                  : "${Staticmembers.listofUsers[contactcardindex!].whatsapp}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              urlLauncher.launchUrl(Uri.parse(
                                  'mailto:${Staticmembers.listofUsers[contactcardindex!].email}'));
                            },
                            child: Image.asset(
                              "assets/icon/email.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: wp(4, context),
                          ),
                          Expanded(
                            child: Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .email ==
                                          null ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .email ==
                                          ""
                                  ? "arti@mailinator.com"
                                  : "${Staticmembers.listofUsers[contactcardindex!].email}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: hp(3, context),
                      ),
                      // Row(
                      //   children: [
                      //     InkWell(
                      //       onTap: () async {
                      //         final url =
                      //             'https://${Staticmembers.listofUsers[contactcardindex!].website}';

                      //         await launchUrl(Uri.parse(url));
                      //       },
                      //       child: Image.asset(
                      //         "assets/icon/website.png",
                      //         scale: 30,
                      //         color: WHITE_COLOR,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: wp(4, context),
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         Staticmembers.listofUsers[contactcardindex!]
                      //                         .website ==
                      //                     null ||
                      //                 Staticmembers
                      //                         .listofUsers[contactcardindex!]
                      //                         .website ==
                      //                     ""
                      //             ? "www.google.com"
                      //             : "${Staticmembers.listofUsers[contactcardindex!].website}",
                      //         maxLines: 1,
                      //         overflow: TextOverflow.ellipsis,
                      //         style: const TextStyle(
                      //           fontSize: 14,
                      //           color: WHITE_COLOR,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: hp(2, context),
                      // ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              urlLauncher.launchUrl(Uri.parse(
                                  'https://www.facebook.com/{${Staticmembers.listofUsers[contactcardindex!].facebook}}'));
                            },
                            child: Image.asset(
                              "assets/icon/Face.png",
                              scale: 30,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: wp(4, context),
                          ),
                          Expanded(
                            child: Text(
                              Staticmembers.listofUsers[contactcardindex!]
                                              .facebook ==
                                          null ||
                                      Staticmembers
                                              .listofUsers[contactcardindex!]
                                              .facebook ==
                                          ""
                                  ? "chauhan arti"
                                  : "${Staticmembers.listofUsers[contactcardindex!].facebook}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: hp(1.5, context),
              right: wp(0, context),
              child: Container(
                alignment: Alignment.center,
                height: hp(7, context),
                width: wp(50, context),
                decoration: const BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(3),
                  ),
                ),
                child: Text(
                  '${Staticmembers.listofUsers[contactcardindex!].compeny?[0].toUpperCase()}${Staticmembers.listofUsers[contactcardindex!].compeny?.substring(1).toLowerCase()}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: WHITE_COLOR,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
