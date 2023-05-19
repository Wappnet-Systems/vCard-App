import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: whiteColor,
        ),
        height: hp(50, context),
        child: Column(
          children: [
            SizedBox(height: hp(2, context)),
            const Text(
              "Share vCard",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
            ),
            SizedBox(height: hp(2, context)),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: blueColor,
                    width: wp(1, context),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: QrImage(
                    data: qrData,
                    size: 150,
                    backgroundColor: whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: hp(2, context)),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                ),
                onPressed: _shareContent,
                icon: const Icon(Icons.ios_share_outlined),
                label: const Text('Share App')),
          ],
        ));
  }
}
