import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants_color.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData =
      "https://drive.google.com/drive/u/2/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzBhttps://drive.google.com/drive/u/2/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzBhttps://drive.google.com/drive/u/2/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzB";

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
            child: QrImage(data: qrData),
          ),
        ),
      ),
    );
  }
}
