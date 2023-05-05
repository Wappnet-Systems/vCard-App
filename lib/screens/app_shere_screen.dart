import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

import '../widget/decoration_widget.dart';

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
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: WHITE_COLOR,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Decorationwidget(),
              SizedBox(
                height: hp(3, context),
              ),
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
                    size: 180,
                    backgroundColor: BACKGROUND_COLOR,
                  ),
                ),
              ),
              SizedBox(height: hp(3, context)),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: PRIMARY_COLOR,
                  ),
                  onPressed: _shareContent,
                  icon: const Icon(Icons.ios_share_outlined),
                  label: const Text('Share App')),
              SizedBox(height: hp(3, context)),
              const Text(
                "vCard 1.0.0 was just released!",
                style: TextStyle(color: PRIMARY_COLOR),
              ),
              SizedBox(
                height: hp(3, context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
