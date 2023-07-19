import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class Cardsherescreen extends StatefulWidget {
  final String? uid;
  final String? cid;
  const Cardsherescreen({super.key, required this.uid, required this.cid});
  @override
  // ignore: library_private_types_in_public_api
  _CardsherescreenState createState() => _CardsherescreenState();
}

class _CardsherescreenState extends State<Cardsherescreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        backgroundColor: COLOR_WHITE,
        title: null,
        content: SizedBox(
          height: hp(35, context),
          width: wp(40, context),
          child: Column(
            children: [
              Text(
                "Send Your card",
                style: titleTextStyle,
              ),
              SizedBox(height: hp(2, context)),
              // Card Share QR Code
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: COLOR_PRIMARY_DARK, width: 2)),
                child: QrImage(
                  // user ID and card ID
                  data: "${widget.uid} ${widget.cid}",
                  size: 150,
                ),
              ),
              SizedBox(height: hp(3, context)),
              const Text(
                "Point your camera at the QR code.",
                style: TextStyle(fontSize: 13, color: COLOR_PRIMARY_DARK),
              )
            ],
          ),
        ));
  }
}
