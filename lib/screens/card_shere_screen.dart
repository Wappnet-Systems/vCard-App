import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';

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
        backgroundColor: whiteColor,
        title: null,
        content: SizedBox(
          height: hp(35, context),
          width: wp(40, context),
          child: Column(
            children: [
              const Text(
                "Send Your cardJson",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: blueColor),
              ),
              SizedBox(height: hp(2, context)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: blueColor, width: 2)),
                child: QrImage(
                  data: "${widget.uid} ${widget.cid}",
                  size: 150,
                ),
              ),
              SizedBox(height: hp(3, context)),
              const Text(
                "Point your camera at the qrJson code.",
                style: TextStyle(fontSize: 13, color: blueColor),
              )
            ],
          ),
        ));
  }
}
