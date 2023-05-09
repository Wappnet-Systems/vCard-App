import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/contect_visiting_card/card_1.dart';
import 'package:vcard/contect_visiting_card/card_2.dart';
import 'package:vcard/contect_visiting_card/card_3.dart';
import 'package:vcard/contect_visiting_card/card_4.dart';
import 'package:vcard/contect_visiting_card/defult_card.dart';

import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/app_bar_widget.dart';

class Digitalvisitingcard extends StatefulWidget {
  final int? id;
  const Digitalvisitingcard({super.key, required this.id});

  @override
  State<Digitalvisitingcard> createState() => _DigitalvisitingcardState();
}

class _DigitalvisitingcardState extends State<Digitalvisitingcard> {
  int? cardindex;
  FToast? fToast;
  final _containerKey = GlobalKey();

  @override
  void initState() {
    cardindex = widget.id;
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  Future<void> captureImage() async {
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
          text: '${Staticmembers.listofUsers[widget.id!].name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      Contectcardtheme1(id: cardindex),
      Contectcardtheme2(id: cardindex),
      Contectcardtheme3(id: cardindex),
      Contectcardtheme4(id: cardindex),
      Contectdefultcard(id: cardindex)
    ];
    log("card:${Staticmembers.listofUsers[widget.id!].card!}");
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarWidget(
        title: "${Staticmembers.listofUsers[widget.id!].type}",
        centerTitle: true,
        leadinWidget: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: WHITE_COLOR,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await captureImage();
            },
            icon: const Icon(
              Icons.ios_share_rounded,
              color: WHITE_COLOR,
            ),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: _containerKey,
        child: cardList[Staticmembers.listofUsers[widget.id!].card!],
      ),
    );
  }
}
