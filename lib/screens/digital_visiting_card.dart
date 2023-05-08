import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard/digital_card/card_1.dart';
import 'package:vcard/digital_card/card_4.dart';
import 'package:vcard/digital_card/defult_card.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:vcard/utils/style.dart';
import '../digital_card/card_2.dart';
import '../digital_card/card_3.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';

class Digitalvisitingcard extends StatefulWidget {
  final int? id;
  Digitalvisitingcard({super.key, required this.id});

  @override
  State<Digitalvisitingcard> createState() => _DigitalvisitingcardState();
}

class _DigitalvisitingcardState extends State<Digitalvisitingcard> {
  int? cardindex;
  FToast? fToast;
  GlobalKey _containerKey = GlobalKey();

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
      final image = imagePath.writeAsBytes(imageBytes);
      print("image:$image");
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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${Staticmenbers.listofUsers[widget.id!].type}"),
        backgroundColor: BLUE_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          InkWell(
              onTap: () async {
                await _captureImage();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.ios_share_rounded),
              )),
        ],
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: RepaintBoundary(
          key: _containerKey,
          child: cardList[Staticmenbers.listofUsers[widget.id!].card!]),
    ));
  }
}
