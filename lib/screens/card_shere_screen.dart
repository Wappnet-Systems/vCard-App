import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants_color.dart';

import '../widget/decoration_widget.dart';

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
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: BLUE_COLOR,
        ),
        child: Column(
          children: [
            Decorationwidget(),
            SizedBox(height: 20),
            Text(
              "Send Your Card",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_COLOR),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.green,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: BACKGROUND_COLOR,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: QrImage(
                data: "${widget.uid} ${widget.cid}",
                size: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Point yoour camera at the QR code.",
              style: TextStyle(color: PRIMARY_COLOR),
            ),
          ],
        ));
  }
}
