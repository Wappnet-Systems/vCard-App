// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/update_card_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/digital_card/card_1.dart';
import 'package:vcard/widget/digital_card/card_4.dart';
import 'package:vcard/widget/digital_card/defult_card.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../widget/digital_card/card_2.dart';
import '../widget/digital_card/card_3.dart';

class Digitalvisitingcard extends StatefulWidget {
  final int? id;
  const Digitalvisitingcard({super.key, required this.id});

  @override
  State<Digitalvisitingcard> createState() => _DigitalvisitingcardState();
}

class _DigitalvisitingcardState extends State<Digitalvisitingcard> {
  int? cardindex;
  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    cardindex = widget.id;
  }

  // card to convert and share image
  Future<void> _captureImage() async {
    RenderRepaintBoundary boundary = _containerKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();

    if (imageBytes != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/Card_image.png').create();
      await imagePath.writeAsBytes(imageBytes);
      Share.shareFiles([imagePath.path],
          text: '${Staticmenbers.listofUsers[widget.id!].name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // card list
    List<Widget> cardList = [
      Cardtheme1(id: cardindex),
      Cardtheme2(id: cardindex),
      Cardtheme3(id: cardindex),
      Cardtheme4(id: cardindex),
      DefultCard(id: cardindex)
    ];
    return Scaffold(
      appBar: Customappbarwidget(
        centerTitle: false,
        leadingWidth: wp(10, context),
        title: "${Staticmenbers.listofUsers[widget.id!].type}",
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Updatecardscreen(
                    id: Staticmenbers.listofUsers[widget.id!].id,
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                right: wp(1, context),
              ),
              padding: EdgeInsets.all(wp(2, context)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Icons.mode_edit_outline,
                size: 22,
                color: COLOR_WHITE,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await _captureImage();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: wp(2, context),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(wp(2, context)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Icons.ios_share_rounded,
                size: 22,
                color: COLOR_WHITE,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => CustomAlartDialog(
                  title: Text(
                    "Delete",
                    textAlign: TextAlign.center,
                    style: smalltitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  content: Text(
                    "Are you sure you want to delete this card?",
                    selectionColor: COLOR_PRIMARY_LIGHT,
                    textAlign: TextAlign.center,
                    style: textMediumTextStyle.copyWith(
                        color: COLOR_PRIMARY_LIGHT),
                  ),
                  onPressedNo: () {
                    Navigator.pop(ctx);
                  },
                  onPressedYes: () {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection("Carddata")
                        .doc(Staticmenbers.listofUsers[widget.id!].id)
                        .delete()
                        .then(
                      (value) {
                        Navigator.push(
                          ctx,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Dashboardscreen(index: 0),
                            reverseTransitionDuration: Duration.zero,
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                right: wp(2, context),
              ),
              padding: EdgeInsets.all(wp(2, context)),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(
                Icons.delete_outline_outlined,
                size: 22,
                color: COLOR_WHITE,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: COLOR_WHITE,
      body: RepaintBoundary(
        key: _containerKey,
        child: cardList[Staticmenbers.listofUsers[widget.id!].card!],
      ),
    );
  }
}
