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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(3, context),
        ),
        actionsPadding: EdgeInsets.zero,
        backgroundColor: COLOR_WHITE,
        content: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Send Your card",
                  style: titleTextStyle,
                ),

                SizedBox(
                  height: hp(3, context),
                ),
                // Card Share QR Code
                Container(
                  height: hp(15, context),
                  width: wp(30, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: COLOR_PRIMARY, width: 1.5),
                  ),
                  child: QrImage(
                    // user ID and card ID
                    data: "${widget.uid} ${widget.cid}",
                    size: dp(150, context),
                  ),
                ),
                SizedBox(
                  height: hp(3, context),
                ),
                Text("Point your camera at the QR code.", style: smallTextStyle)
              ],
            ),
          ],
        ));
  }
}
