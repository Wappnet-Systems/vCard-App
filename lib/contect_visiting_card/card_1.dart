import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class ContectCardTheme1 extends StatefulWidget {
  final int? id;
  const ContectCardTheme1({
    super.key,
    required this.id,
  });

  @override
  State<ContectCardTheme1> createState() => _ContectCardTheme1State();
}

class _ContectCardTheme1State extends State<ContectCardTheme1> {
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
          height: hp(35, context),
          padding: EdgeInsets.symmetric(
            horizontal: wp(6, context),
            vertical: hp(2, context),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: wp(4, context),
            vertical: hp(3, context),
          ),
          decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: COLOR_PRIMARY_DARK.withOpacity(0.3),
                blurRadius: 8.0,
                offset: const Offset(1, -1),
              ),
              BoxShadow(
                color: COLOR_PRIMARY_DARK.withOpacity(0.3),
                blurRadius: 8.0,
                offset: const Offset(-1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    color: COLOR_PRIMARY_DARK.withOpacity(0.9),
                    size: 28,
                  ),
                  SizedBox(
                    width: wp(2, context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: COLOR_PRIMARY_DARK),
                      ),
                      SizedBox(
                        height: hp(0.5, context),
                      ),
                      const Text(
                        "Profession",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: COLOR_PRIMARY_DARK),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                color: COLOR_PRIMARY_DARK,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/call.png",
                            scale: 35,
                            color: COLOR_PRIMARY_DARK,
                          ),
                          SizedBox(
                            width: wp(3, context),
                          ),
                          Text(
                            "XXXXXXXXXX",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: COLOR_PRIMARY_LIGHT),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/email.png",
                            scale: 35,
                            color: COLOR_PRIMARY_DARK,
                          ),
                          SizedBox(
                            width: wp(3, context),
                          ),
                          Text(
                            "abc@gmail.com",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: COLOR_PRIMARY_LIGHT),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/whats.png",
                            scale: 35,
                            color: COLOR_PRIMARY_DARK,
                          ),
                          SizedBox(
                            width: wp(3, context),
                          ),
                          Text(
                            "XXXXXXXXXX",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: COLOR_PRIMARY_LIGHT),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(2, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icon/pin.png",
                            scale: 35,
                            color: COLOR_PRIMARY_DARK,
                          ),
                          SizedBox(
                            width: wp(3, context),
                          ),
                          SizedBox(
                            width: wp(40, context),
                            child: Text(
                              "Sciencity road,Sola, Ahmedabad",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: COLOR_PRIMARY_LIGHT),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: hp(10, context),
                        width: wp(17, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: WHITE_COLOR,
                          border: Border.all(
                            color: COLOR_PRIMARY_DARK,
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: QrImage(
                            data:
                                "${FirebaseAuth.instance.currentUser?.uid}${Staticmembers.listofUsers[contactcardindex!].id}",
                            backgroundColor: BACKGROUND_COLOR,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: hp(0.5, context),
                      ),
                      const Text(
                        "Company Name",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_PRIMARY_DARK,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
          // Stack(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           width: wp(100, context),
          //           height: hp(25, context),
          //           padding: EdgeInsets.symmetric(
          //             horizontal: wp(4, context),
          //             vertical: hp(2, context),
          //           ),
          //           decoration: BoxDecoration(
          //             color: WHITE_COLOR,
          //             borderRadius: BorderRadius.circular(16),
          //           ),
          //           child: Text(
          //             "${Staticmembers.listofUsers[contactcardindex!].compeny}",
          //             textAlign: TextAlign.center,
          //             style: const TextStyle(
          //                 fontSize: 24,
          //                 fontWeight: FontWeight.w500,
          //                 color: COLOR_PRIMARY_DARK),
          //           ),
          //         ),
          //         SizedBox(
          //           height: hp(4, context),
          //         ),
          //         Container(
          //           width: wp(100, context),
          //           height: hp(25, context),
          //           padding: EdgeInsets.symmetric(
          //             horizontal: wp(4, context),
          //             vertical: hp(1, context),
          //           ),
          //           decoration: BoxDecoration(
          //             color: WHITE_COLOR,
          //             borderRadius: BorderRadius.circular(16),
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SizedBox(
          //                 height: hp(6, context),
          //               ),
          //               Text(
          //                 "${Staticmembers.listofUsers[contactcardindex!].name}",
          //                 textAlign: TextAlign.center,
          //                 style: const TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w500,
          //                     color: COLOR_PRIMARY_DARK),
          //               ),
          //               SizedBox(
          //                 height: hp(1, context),
          //               ),
          //               Text(
          //                 "${Staticmembers.listofUsers[contactcardindex!].department}",
          //                 textAlign: TextAlign.center,
          //                 style: const TextStyle(
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.w500,
          //                     color: COLOR_PRIMARY_DARK),
          //               ),
          //               SizedBox(
          //                 height: hp(1, context),
          //               ),
          //               Text(
          //                 "${Staticmembers.listofUsers[contactcardindex!].headline}",
          //                 textAlign: TextAlign.center,
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: const TextStyle(
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w500,
          //                     color: COLOR_PRIMARY_DARK),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: hp(3, context),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           padding: EdgeInsets.symmetric(
          //             horizontal: wp(4, context),
          //             vertical: hp(2, context),
          //           ),
          //           decoration: BoxDecoration(
          //             color: WHITE_COLOR,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               InkWell(
          //                 onTap: () {
          //                   UrlLauncher.launchUrl(Uri.parse(
          //                       'tel:+${Staticmembers.listofUsers[contactcardindex!].phone.toString()}'));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/call.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   launchUrl(
          //                       Uri.parse(
          //                           'https://wa.me/${Staticmembers.listofUsers[contactcardindex!].whatsapp}?text=Hi'),
          //                       mode: LaunchMode.externalApplication);
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/whats.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   UrlLauncher.launchUrl(Uri.parse(
          //                       'mailto:${Staticmembers.listofUsers[contactcardindex!].email}'));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/email.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   UrlLauncher.launchUrl(Uri.parse(
          //                       'https://www.facebook.com/{${Staticmembers.listofUsers[contactcardindex!].facebook}}'));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/Face.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: hp(2, context),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           padding: EdgeInsets.symmetric(
          //             horizontal: wp(4, context),
          //             vertical: hp(2, context),
          //           ),
          //           decoration: BoxDecoration(
          //             color: WHITE_COLOR,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               InkWell(
          //                 onTap: () {
          //                   UrlLauncher.launchUrl(Uri.parse(
          //                       "https://telegram.me/${Staticmembers.listofUsers[contactcardindex!].telegram}"));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/tele.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () async {
          //                   final url =
          //                       'https://${Staticmembers.listofUsers[contactcardindex!].website}';

          //                   await launchUrl(Uri.parse(url));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/website.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () async {
          //                   final url =
          //                       'https://${Staticmembers.listofUsers[contactcardindex!].link}';

          //                   await launchUrl(Uri.parse(url));
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/lin.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   // showDialog(
          //                   //   context: context,
          //                   //   builder: (ctx) => AlertDialog(
          //                   //     backgroundColor: BLUE_COLOR,
          //                   //     title: const Text("Address",
          //                   //         style: TextStyle(
          //                   //             fontFamily: 'Marck',
          //                   //             fontSize: 25,
          //                   //             color: WHITE_COLOR,
          //                   //             fontWeight: FontWeight.bold)),
          //                   //     content: Text('',
          //                   //         style: TextStyle(
          //                   //             fontFamily: 'Marck',
          //                   //             fontSize: 25,
          //                   //             color: WHITE_COLOR,
          //                   //             fontWeight: FontWeight.bold)),
          //                   //     actions: <Widget>[
          //                   //       Row(
          //                   //         mainAxisAlignment: MainAxisAlignment.end,
          //                   //         children: [
          //                   //           TextButtomWidget(
          //                   //             onPressed: () {
          //                   //               pushMap();
          //                   //             },
          //                   //             title: 'Use Map',
          //                   //             fontSize: null,
          //                   //             color: PRIMARY_COLOR,
          //                   //           ),
          //                   //           TextButtomWidget(
          //                   //             onPressed: () {
          //                   //               Navigator.pop(context);
          //                   //             },
          //                   //             title: 'Cancle',
          //                   //             fontSize: 15,
          //                   //             color: Colors.redAccent,
          //                   //           )
          //                   //         ],
          //                   //       ),
          //                   //     ],
          //                   //   ),
          //                   // );
          //                 },
          //                 child: Image.asset(
          //                   "assets/icon/pin.png",
          //                   scale: 20,
          //                   color: BLUE_COLOR,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //     Positioned(
          //       top: hp(15, context),
          //       left: wp(5, context),
          //       right: wp(5, context),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(color: BLUE_COLOR, width: 2.5),
          //         ),
          //         child: CircleAvatar(
          //           radius: 65,
          //           backgroundColor: PRIMARY_COLOR,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(80),
          //             child:
          //                 Staticmembers.listofUsers[contactcardindex!].image == ""
          //                     ? Image.asset(
          //                         "assets/images/splash1.png",
          //                         width: wp(36, context),
          //                         height: hp(20, context),
          //                         fit: BoxFit.fill,
          //                       )
          //                     : Image.network(
          //                         "${Staticmembers.listofUsers[contactcardindex!].image}",
          //                         width: wp(36.5, context),
          //                         height: hp(22, context),
          //                         fit: BoxFit.fill,
          //                       ),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
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
