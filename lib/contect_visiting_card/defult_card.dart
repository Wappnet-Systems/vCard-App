import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:vcard/utils/style.dart';
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
    return Center(
      child: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: wp(4, context),
              vertical: hp(4, context),
            ),
            decoration: BoxDecoration(
              color: BLUE_COLOR.withOpacity(0.95),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                  offset: const Offset(1, -1),
                  blurRadius: 8.0,
                ),
                BoxShadow(
                  color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                  offset: const Offset(-1, 1),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(4, context),
                  ),
                  child: Text(
                    Staticmembers.listofUsers[contactcardindex!].compeny ==
                                "" ||
                            Staticmembers
                                    .listofUsers[contactcardindex!].compeny ==
                                null
                        ? "N/A"
                        : '${Staticmembers.listofUsers[contactcardindex!].compeny?[0].toUpperCase()}${Staticmembers.listofUsers[contactcardindex!].compeny?.substring(1).toLowerCase()}',
                    style: const TextStyle(
                      fontFamily: 'Marck',
                      fontSize: 20,
                      color: WHITE_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Center(
                  child:
                      Staticmembers.listofUsers[contactcardindex!].image == ""
                          ? Image.asset(
                              "assets/images/splash1.png",
                              width: wp(100, context),
                              height: hp(28, context),
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              "${Staticmembers.listofUsers[contactcardindex!].image}",
                              width: wp(100, context),
                              height: hp(28, context),
                              fit: BoxFit.fill,
                            ),
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Center(
                  child: Text(
                    Staticmembers.listofUsers[contactcardindex!].name == "" ||
                            Staticmembers.listofUsers[contactcardindex!].name ==
                                null
                        ? "N/A"
                        : '${Staticmembers.listofUsers[contactcardindex!].name?.toUpperCase()}',
                    style: const TextStyle(
                        fontFamily: 'Marck',
                        fontSize: 20,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: hp(0.5, context),
                ),
                Center(
                  child: Text(
                    Staticmembers.listofUsers[contactcardindex!].department ==
                                "" ||
                            Staticmembers.listofUsers[contactcardindex!]
                                    .department ==
                                null
                        ? "N/A"
                        : '${Staticmembers.listofUsers[contactcardindex!].department}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Marck',
                        fontSize: 18,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: hp(1, context),
                    horizontal: wp(4, context),
                  ),
                  child: const Divider(
                    color: WHITE_COLOR,
                    thickness: 1,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(10, context),
                    ),
                    child: Wrap(
                      runSpacing: 15.0,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Staticmembers.listofUsers[contactcardindex!].phone ==
                                    "" ||
                                Staticmembers
                                        .listofUsers[contactcardindex!].phone ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    UrlLauncher.launch(
                                        'tel:+${Staticmembers.listofUsers[contactcardindex!].phone.toString()}');
                                  },
                                  child: Image.asset(
                                    "assets/icon/telephone.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].whatsapp ==
                                    "" ||
                                Staticmembers.listofUsers[contactcardindex!]
                                        .whatsapp ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse(
                                            'https://wa.me/$Staticmembers.listofUsers[contactcardindex!].whatsapp?text=Hi'),
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Image.asset(
                                    "assets/icon/whatsapp.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].email ==
                                    "" ||
                                Staticmembers
                                        .listofUsers[contactcardindex!].email ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    UrlLauncher.launch(
                                        'mailto:${Staticmembers.listofUsers[contactcardindex!].email}');
                                  },
                                  child: Image.asset(
                                    "assets/icon/mail.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].facebook ==
                                    "" ||
                                Staticmembers.listofUsers[contactcardindex!]
                                        .facebook ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    UrlLauncher.launch(
                                        'https://www.facebook.com/{${Staticmembers.listofUsers[contactcardindex!].facebook}}');
                                  },
                                  child: Image.asset(
                                    "assets/icon/facebook.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].telegram ==
                                    "" ||
                                Staticmembers.listofUsers[contactcardindex!]
                                        .telegram ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    UrlLauncher.launch(
                                        "https://telegram.me/$Staticmembers.listofUsers[contactcardindex!].telegram");
                                  },
                                  child: Image.asset(
                                    "assets/icon/telegram.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].website ==
                                    "" ||
                                Staticmembers.listofUsers[contactcardindex!]
                                        .website ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        '${Staticmembers.listofUsers[contactcardindex!].website}';

                                    await launch(url);
                                  },
                                  child: Image.asset(
                                    "assets/icon/web.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].link ==
                                    "" ||
                                Staticmembers
                                        .listofUsers[contactcardindex!].link ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    final url =
                                        '${Staticmembers.listofUsers[contactcardindex!].link}';

                                    await launch(url);
                                  },
                                  child: Image.asset(
                                    "assets/icon/link.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                        Staticmembers.listofUsers[contactcardindex!].address ==
                                    "" ||
                                Staticmembers.listofUsers[contactcardindex!]
                                        .address ==
                                    null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: wp(3, context),
                                ),
                                child: InkWell(
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
                                    //         style: const TextStyle(
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
                                    "assets/icon/location.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(4, context),
                  ),
                  child: Text(
                    Staticmembers.listofUsers[contactcardindex!].headline ==
                                "" ||
                            Staticmembers
                                    .listofUsers[contactcardindex!].headline ==
                                null
                        ? "N/A"
                        : '${Staticmembers.listofUsers[contactcardindex!].headline}',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'Marck',
                        fontSize: 14,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: hp(1, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pushMap() async {
    if (Staticmembers.listofUsers[contactcardindex!].address == "") {
    } else {
      String googleUrl =
          "google.navigation:q=${Staticmembers.listofUsers[contactcardindex!].address}";
      Uri googleUri = Uri.parse(googleUrl);

      if (await canLaunchUrl(googleUri)) {
        await launchUrl(googleUri);
        log("googleUri:$googleUri");
      }
    }
  }
}
