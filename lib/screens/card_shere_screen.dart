import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class CardGenerateQR extends StatefulWidget {
  final String? uid;
  final String? cid;
  const CardGenerateQR({super.key, required this.uid, required this.cid});
  @override
  State<CardGenerateQR> createState() => _CardGenerateQRState();
}

class _CardGenerateQRState extends State<CardGenerateQR> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: hp(3, context),
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
                color: PRIMARY_COLOR),
          ),
          SizedBox(
            height: hp(4, context),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: WHITE_COLOR,
              border: Border.all(
                color: PRIMARY_COLOR,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: COLOR_PRIMARY_DARK.withOpacity(0.5),
                  offset: const Offset(1, -1),
                  blurRadius: 2.0,
                ),
                BoxShadow(
                  color: COLOR_PRIMARY_DARK.withOpacity(0.5),
                  offset: const Offset(-1, 1),
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: QrImage(
              data: "${widget.uid} ${widget.cid}",
              size: 200,
            ),
          ),
          SizedBox(
            height: hp(3, context),
          ),
          const Text(
            "Point your camera at the QR code.",
            style: TextStyle(color: PRIMARY_COLOR, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
