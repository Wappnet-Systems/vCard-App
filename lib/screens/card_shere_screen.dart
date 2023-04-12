import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants_color.dart';

class CardGenerateQR extends StatefulWidget {
  final String? uid;
  final String? cid;
  CardGenerateQR({super.key, required this.uid, required this.cid});
  @override
  _CardGenerateQRState createState() => _CardGenerateQRState();
}

class _CardGenerateQRState extends State<CardGenerateQR> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shere vCard"),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: QrImage(data: "${widget.uid}"),
          ),
        ),
      ),
    );
  }
}
