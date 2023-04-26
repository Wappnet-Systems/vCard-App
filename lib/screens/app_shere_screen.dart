import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/constants_color.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final String _content =
      'https://drive.google.com/drive/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzB?usp=share_link';
  String qrData =
      "https://drive.google.com/drive/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzB?usp=share_link";
  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: BACKGROUND_COLOR,
        ),
        height: 500.0,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Share vCard",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_COLOR),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: QrImage(
                    data: qrData,
                    size: 180,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR,
                ),
                onPressed: _shareContent,
                icon: const Icon(Icons.ios_share_outlined),
                label: const Text('Share App')),
            SizedBox(height: 20),
            Text(
              "vCard 1.0.0 was just released!",
              style: TextStyle(color: PRIMARY_COLOR),
            )
          ],
        ));
  }
}
