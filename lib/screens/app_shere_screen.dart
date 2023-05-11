import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class ShareApp extends StatefulWidget {
  const ShareApp({super.key});

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
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
              color: COLOR_PRIMARY_DARK,
            ),
          ),
          SizedBox(
            height: hp(3, context),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: BACKGROUND_COLOR,
                border: Border.all(
                  color: COLOR_PRIMARY_DARK,
                  width: 3,
                ),
              ),
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: QrImage(
                  data: qrData,
                  size: dp(140, context),
                  backgroundColor: BACKGROUND_COLOR,
                ),
              ),
            ),
          ),
          SizedBox(
            height: hp(3, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: wp(35, context),
            ),
            child: TextButtomWidget(
              onPressed: () {
                Navigator.pop(context);
                shareContent();
              },
              width: wp(30, context),
              height: hp(6, context),
              icon: Padding(
                padding: EdgeInsets.only(
                  right: wp(1, context),
                ),
                child: const Icon(
                  Icons.ios_share_outlined,
                  color: WHITE_COLOR,
                  size: 20,
                ),
              ),
              fontSize: 14,
              title: "Share App",
            ),
          ),
          SizedBox(
            height: hp(2, context),
          ),
          const Text(
            "vCard 1.0.0 was just released!",
            style: TextStyle(
                color: COLOR_PRIMARY_DARK,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
