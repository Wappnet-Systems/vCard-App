import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/digital_card/card_1.dart';
import 'package:vcard/digital_card/card_4.dart';
import 'package:vcard/digital_card/defult_card.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../digital_card/card_2.dart';
import '../digital_card/card_3.dart';

class Digitalvisitingcard extends StatefulWidget {
  final int? id;
  const Digitalvisitingcard({super.key, required this.id});

  @override
  State<Digitalvisitingcard> createState() => _DigitalvisitingcardState();
}

class _DigitalvisitingcardState extends State<Digitalvisitingcard> {
  int? cardindex;
  FToast? fToast;
  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    cardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
  }

  Future<void> _captureImage() async {
    RenderRepaintBoundary boundary = _containerKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
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
    List<Widget> cardList = [
      Cardtheme1(id: cardindex),
      Cardtheme2(id: cardindex),
      Cardtheme3(id: cardindex),
      Cardtheme4(id: cardindex),
      DefultCard(id: cardindex)
    ];
    return Scaffold(
      appBar: Customappbarwidget(
          title: "${Staticmenbers.listofUsers[widget.id!].type}",
          actions: [
            InkWell(
                onTap: () async {
                  await _captureImage();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.ios_share_rounded,
                    color: BLACK_COLOR,
                  ),
                )),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: BLACK_COLOR,
                ),
              ))),
      backgroundColor: WHITE_COLOR,
      body: RepaintBoundary(
          key: _containerKey,
          child: cardList[Staticmenbers.listofUsers[widget.id!].card!]),
    );
  }
}
