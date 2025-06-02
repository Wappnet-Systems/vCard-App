import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';

class DefultCard extends StatefulWidget {
  final int? id;

  const DefultCard({super.key, required this.id});

  @override
  State<DefultCard> createState() => _DefultCardState();
}

class _DefultCardState extends State<DefultCard> {
  int? cardindex;
  int? contectcardindex;
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        wp(5, context),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: hp(2, context),
          horizontal: wp(4, context),
        ),
        decoration: BoxDecoration(
          color: COLOR_PRIMARY_DARK,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: COLOR_YELLOW,
            width: wp(0.5, context),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${Staticmenbers.listofUsers[cardindex!].compeny}',
              textAlign: TextAlign.center,
              style: smalltitleTextStyle.copyWith(color: COLOR_YELLOW),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(50)),
                border: Border.all(
                  color: COLOR_YELLOW,
                  width: wp(0.2, context),
                ),
                boxShadow: [
                  BoxShadow(
                    color: COLOR_YELLOW.withOpacity(0.1),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(50)),
                child: Image.network(
                  "${Staticmenbers.listofUsers[cardindex!].image}",
                  width: wp(40, context),
                  height: hp(20, context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Text(
              '${Staticmenbers.listofUsers[cardindex!].name}',
              textAlign: TextAlign.center,
              style: titleTextStyle.copyWith(color: COLOR_YELLOW),
            ),
            SizedBox(
              height: hp(1, context),
            ),
            Text(
              '${Staticmenbers.listofUsers[cardindex!].department}',
              textAlign: TextAlign.center,
              style: textMediumTextStyle.copyWith(color: COLOR_YELLOW),
            ),
            SizedBox(height: hp(1, context)),
            const Divider(
              color: COLOR_YELLOW,
              thickness: 1,
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: wp(10, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'tel:${Staticmenbers.listofUsers[cardindex!].phone.toString()}'));
                        },
                        child: Image.asset(
                          "assets/icon/call.png",
                          scale: 30,
                          color: COLOR_YELLOW,
                        ),
                      ),
                      SizedBox(
                        width: wp(2, context),
                      ),
                      Text(
                        '+${Staticmenbers.listofUsers[cardindex!].country} ${Staticmenbers.listofUsers[cardindex!].phone}',
                        textAlign: TextAlign.center,
                        style:
                            textMediumTextStyle.copyWith(color: COLOR_YELLOW),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'mailto:${Staticmenbers.listofUsers[cardindex!].email}'));
                        },
                        child: Image.asset(
                          "assets/icon/email.png",
                          scale: 30,
                          color: COLOR_YELLOW,
                        ),
                      ),
                      SizedBox(
                        width: wp(3, context),
                      ),
                      Text(
                        "${Staticmenbers.listofUsers[cardindex!].email}",
                        textAlign: TextAlign.center,
                        style:
                            textMediumTextStyle.copyWith(color: COLOR_YELLOW),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => CustomAlartDialog(
                                    title: Text(
                                      "Address",
                                      textAlign: TextAlign.center,
                                      style: smalltitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    content: Text(
                                      '${Staticmenbers.listofUsers[cardindex!].address}',
                                      selectionColor: COLOR_PRIMARY_LIGHT,
                                      textAlign: TextAlign.center,
                                      style: textMediumTextStyle.copyWith(
                                          color: COLOR_PRIMARY_LIGHT),
                                    ),
                                    onPressedNo: () {
                                      Navigator.pop(context);
                                    },
                                    onPressedYes: () {
                                      _pushMap();
                                    },
                                  ));
                        },
                        child: Image.asset(
                          "assets/icon/pin.png",
                          scale: 24,
                          color: COLOR_YELLOW,
                        ),
                      ),
                      SizedBox(
                        width: wp(3, context),
                      ),
                      SizedBox(
                        width: wp(60, context),
                        child: Text(
                          "${Staticmenbers.listofUsers[cardindex!].address}",
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          style: textMediumTextStyle.copyWith(
                              color: COLOR_YELLOW, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: COLOR_YELLOW, width: 1),
                ),
                child: QrImage(
                  dataModuleStyle: const QrDataModuleStyle(color: COLOR_YELLOW),
                  eyeStyle: const QrEyeStyle(color: COLOR_YELLOW),
                  data:
                      "${Staticmenbers.listofUsers[cardindex!].user} ${Staticmenbers.listofUsers[cardindex!].id}",
                  size: dp(70, context),
                ),
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wp(5, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (Staticmenbers.listofUsers[cardindex!].whatsapp == "")
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                    'https://wa.me/${Staticmenbers.listofUsers[cardindex!].whatsapp}?text=Hi'),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Image.asset(
                            "assets/icon/whats.png",
                            scale: 25,
                            color: COLOR_YELLOW,
                          ),
                        ),
                  (Staticmenbers.listofUsers[cardindex!].facebook == "")
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://www.facebook.com/{${Staticmenbers.listofUsers[cardindex!].facebook}}'));
                          },
                          child: Image.asset(
                            "assets/icon/Face.png",
                            scale: 25,
                            color: COLOR_YELLOW,
                          ),
                        ),
                  (Staticmenbers.listofUsers[cardindex!].telegram == "")
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://telegram.me/${Staticmenbers.listofUsers[cardindex!].telegram}"));
                          },
                          child: Image.asset(
                            "assets/icon/tele.png",
                            scale: 25,
                            color: COLOR_YELLOW,
                          ),
                        ),
                  (Staticmenbers.listofUsers[cardindex!].website == "")
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () async {
                            final url =
                                'https://${Staticmenbers.listofUsers[cardindex!].website}';

                            await launchUrl(Uri.parse(url));
                          },
                          child: Image.asset(
                            "assets/icon/website.png",
                            scale: 25,
                            color: COLOR_YELLOW,
                          ),
                        ),
                  (Staticmenbers.listofUsers[cardindex!].linkdin == "")
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () async {
                            final url =
                                'https://www.linkedin.com//${Staticmenbers.listofUsers[cardindex!].linkdin}';

                            await launchUrl(Uri.parse(url));
                          },
                          child: Image.asset(
                            "assets/icon/lin.png",
                            scale: 25,
                            color: COLOR_YELLOW,
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.listofUsers[cardindex!].address}";

    await launchUrl(Uri.parse(googleUrl));
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: COLOR_WHITE,
      ),
      child: const Text(
        "Value is empty",
        style: TextStyle(color: COLOR_PRIMARY_DARK),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
