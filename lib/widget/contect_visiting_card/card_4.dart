import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/utils/style.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../custom_alartdialog.dart';
import '../text_widget.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
              width: wp(95, context),
              height: hp(37, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: COLOR_WHITE,
                border: Border.all(
                    color: Staticmenbers.cardUsers[contactcardindex!].color !=
                            null
                        ? colorList[
                            Staticmenbers.cardUsers[contactcardindex!].color!]
                        : COLOR_PRIMARY_DARK,
                    width: wp(0.5, context)),
                boxShadow: [
                  BoxShadow(
                    color: Staticmenbers.cardUsers[contactcardindex!].color !=
                            null
                        ? colorList[
                            Staticmenbers.cardUsers[contactcardindex!].color!]
                        : COLOR_PRIMARY_DARK,
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: hp(1, context)),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 12),
                            child: Center(
                                child: Textwidget(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              width: wp(180, context),
                              text:
                                  "${Staticmenbers.cardUsers[contactcardindex!].compeny}",
                              fontSize: 16,
                              selectionColor: COLOR_PRIMARY_DARK,
                            )),
                          ),
                          SizedBox(
                            height: hp(6, context),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Textwidget(
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                width: wp(50, context),
                                text:
                                    "${Staticmenbers.cardUsers[contactcardindex!].phone}",
                                fontSize: 11,
                                selectionColor: COLOR_PRIMARY_DARK,
                              )),
                          SizedBox(
                            height: hp(3, context),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Textwidget(
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                width: wp(100, context),
                                text:
                                    "${Staticmenbers.cardUsers[contactcardindex!].email}",
                                fontSize: 11,
                                selectionColor: COLOR_PRIMARY_DARK,
                              )),
                          SizedBox(
                            height: hp(2.8, context),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Textwidget(
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                width: wp(50, context),
                                text:
                                    "${Staticmenbers.cardUsers[contactcardindex!].address}",
                                fontSize: 9,
                                selectionColor: COLOR_PRIMARY_DARK,
                              )),
                          SizedBox(height: hp(2, context)),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: COLOR_PRIMARY_DARK, width: 1)),
                              child: QrImage(
                                data:
                                    "${Staticmenbers.cardUsers[contactcardindex!].user} ${Staticmenbers.cardUsers[contactcardindex!].id}",
                                size: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: hp(5, context),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Textwidget(
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                width: wp(45, context),
                                text:
                                    "${Staticmenbers.cardUsers[contactcardindex!].name}",
                                fontSize: 16,
                                selectionColor: COLOR_PRIMARY_DARK,
                              )),
                          SizedBox(
                            height: hp(1, context),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Textwidget(
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  width: wp(45, context),
                                  text:
                                      "${Staticmenbers.cardUsers[contactcardindex!].department}",
                                  fontSize: 14,
                                  selectionColor: COLOR_PRIMARY_DARK)),
                          SizedBox(height: hp(3, context)),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Staticmenbers
                                                .cardUsers[contactcardindex!]
                                                .color !=
                                            null
                                        ? colorList[Staticmenbers
                                            .cardUsers[contactcardindex!]
                                            .color!]
                                        : COLOR_PRIMARY_DARK,
                                    width: wp(0.2, context)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(90),
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  "${Staticmenbers.cardUsers[contactcardindex!].image}",
                                  width: wp(23, context),
                                  height: hp(11, context),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: hp(6, context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Staticmenbers.cardUsers[contactcardindex!]
                                          .website ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: InkWell(
                                        onTap: () async {
                                          final url =
                                              'https://${Staticmenbers.cardUsers[contactcardindex!].website}';

                                          await launchUrl(Uri.parse(url));
                                        },
                                        child: Image.asset(
                                          "assets/icon/website.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .cardUsers[
                                                          contactcardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .cardUsers[contactcardindex!]
                                                  .color!]
                                              : COLOR_PRIMARY_DARK,
                                        ),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[contactcardindex!]
                                          .telegram ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "https://telegram.me/$Staticmenbers.cardUsers[contactcardindex!].telegram"));
                                        },
                                        child: Image.asset(
                                          "assets/icon/tele.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .cardUsers[
                                                          contactcardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .cardUsers[contactcardindex!]
                                                  .color!]
                                              : COLOR_PRIMARY_DARK,
                                        ),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[contactcardindex!]
                                          .linkdin ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: InkWell(
                                        onTap: () async {
                                          final url =
                                              'https://www.linkedin.com//${Staticmenbers.cardUsers[contactcardindex!].linkdin}';

                                          await launchUrl(Uri.parse(url));
                                        },
                                        child: Image.asset(
                                          "assets/icon/lin.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .cardUsers[
                                                          contactcardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .cardUsers[contactcardindex!]
                                                  .color!]
                                              : COLOR_PRIMARY_DARK,
                                        ),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[contactcardindex!]
                                          .whatsapp ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: InkWell(
                                        onTap: () {
                                          launchUrl(
                                              Uri.parse(
                                                  'https://wa.me/$Staticmenbers.cardUsers[contactcardindex!].whatsapp?text=Hi'),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        child: Image.asset(
                                          "assets/icon/whats.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .cardUsers[
                                                          contactcardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .cardUsers[contactcardindex!]
                                                  .color!]
                                              : COLOR_PRIMARY_DARK,
                                        ),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[contactcardindex!]
                                          .facebook ==
                                      ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              'https://www.facebook.com/{${Staticmenbers.cardUsers[contactcardindex!].facebook}}'));
                                        },
                                        child: Image.asset(
                                          "assets/icon/Face.png",
                                          scale: 30,
                                          color: Staticmenbers
                                                      .cardUsers[
                                                          contactcardindex!]
                                                      .color !=
                                                  null
                                              ? colorList[Staticmenbers
                                                  .cardUsers[contactcardindex!]
                                                  .color!]
                                              : COLOR_PRIMARY_DARK,
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 65,
            left: 0,
            child: Container(
              width: wp(10, context),
              height: hp(18, context),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Staticmenbers.cardUsers[contactcardindex!].color != null
                    ? colorList[
                        Staticmenbers.cardUsers[contactcardindex!].color!]
                    : COLOR_PRIMARY_DARK,
                boxShadow: [
                  BoxShadow(
                    color: Staticmenbers.cardUsers[contactcardindex!].color !=
                            null
                        ? colorList[
                            Staticmenbers.cardUsers[contactcardindex!].color!]
                        : COLOR_PRIMARY_DARK,
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'tel:${Staticmenbers.cardUsers[contactcardindex!].phone.toString()}'));
                      },
                      child: Image.asset(
                        "assets/icon/call.png",
                        scale: 30,
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Staticmenbers.cardUsers[contactcardindex!].email == ""
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'mailto:${Staticmenbers.cardUsers[contactcardindex!].email}'));
                            },
                            child: Image.asset(
                              "assets/icon/email.png",
                              scale: 30,
                              color: COLOR_WHITE,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => CustomAlartDialog(
                                  title: const Textwidget(
                                      text: "Address",
                                      textAlign: TextAlign.center),
                                  content: Textwidget(
                                    text:
                                        '${Staticmenbers.cardUsers[contactcardindex!].address}',
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    selectionColor: COLOR_PRIMARY_LIGHT,
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
                        scale: 30,
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _pushMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${Staticmenbers.cardUsers[contactcardindex!].address}";

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
