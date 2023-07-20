import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/button_with_icon.dart';

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
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: hp(3, context),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: COLOR_WHITE,
          ),
          child: Column(
            children: [
              Text(
                "Share VCard",
                style: titleTextStyle,
              ),
              SizedBox(
                height: hp(2, context),
              ),
              //App Share QR Code
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: COLOR_PRIMARY_DARK,
                    width: wp(0.5, context),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: QrImage(
                  data: qrData,
                  size: dp(150, context),
                  backgroundColor: COLOR_WHITE,
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              //App share Button
              ButtonWithIcon(
                onTap: _shareContent,
                text: "Share App",
                width: wp(45, context),
                icon: const Icon(
                  Icons.ios_share_outlined,
                  color: COLOR_WHITE,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
