import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class CardSherScreen extends StatefulWidget {
  final String? uid;
  final String? cid;
  const CardSherScreen({
    super.key,
    required this.uid,
    required this.cid,
  });
  @override
  State<CardSherScreen> createState() => _CardSherScreenState();
}

class _CardSherScreenState extends State<CardSherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          alignment: Alignment.center,
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
            children: [
              const Text(
                "Send Your Card",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: COLOR_PRIMARY_DARK,
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: WHITE_COLOR,
                  border: Border.all(
                    color: COLOR_PRIMARY_DARK,
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: QrImage(
                    data: "${widget.uid} ${widget.cid}",
                    backgroundColor: BACKGROUND_COLOR,
                    size: dp(200, context),
                  ),
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Text(
                "Point your camera at the QR code.",
                style: TextStyle(
                  color: COLOR_PRIMARY_DARK.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
