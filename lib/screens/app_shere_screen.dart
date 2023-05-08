import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final String content =
      'https://drive.google.com/drive/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzB?usp=share_link';
  String qrData =
      "https://drive.google.com/drive/folders/1PWfNNLTFS7rNyYBJ2lBjJNF1KQF-omzB?usp=share_link";
  void shareContent() {
    Share.share(content);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: hp(2, context),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: WHITE_COLOR,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Share VCard",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: PRIMARY_COLOR),
          ),
          SizedBox(
            height: hp(3, context),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: BACKGROUND_COLOR,
                border: Border.all(
                  color: PRIMARY_COLOR,
                  width: 3,
                ),
              ),
              padding: const EdgeInsets.all(5),
              child: QrImage(
                data: qrData,
                size: dp(140, context),
                backgroundColor: BACKGROUND_COLOR,
              ),
            ),
          ),
          SizedBox(height: hp(3, context)),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
            ),
            onPressed: shareContent,
            icon: const Icon(Icons.ios_share_outlined),
            label: const Text('Share App'),
          ),
          SizedBox(
            height: hp(3, context),
          ),
          const Text(
            "vCard 1.0.0 was just released!",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ],
      ),
    );
  }
}
