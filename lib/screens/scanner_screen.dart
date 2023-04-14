import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../controllers/data_controllers.dart';
import '../utils/constants_color.dart';
import 'app_shere_screen.dart';

class Scannerscreen extends StatefulWidget {
  Scannerscreen({super.key});

  @override
  State<Scannerscreen> createState() => _ScannerscreenState();
}

class _ScannerscreenState extends State<Scannerscreen> {
  var getResult = 'QR Code Result';
  int? value;
  // String? cid;
  String? uid;

  Future<void> getSingleUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Carddata")
        .get();

    final userData = snapshot.docs
        .map((e) => Users(
            name: e['Name'],
            department: e['Department'],
            compeny: e['Company'],
            headline: e['HeadLine'],
            whatsapp: e['WhatsApp'],
            telegram: e['Telegram'],
            snapchat: e['Snapchat'],
            website: e['Website'],
            link: e['Link'],
            facebook: e['Facebook'],
            email: e['Email'],
            phone: e['Phone'],
            address: e['Address'],
            id: e['id'],
            image: e['images'],
            type: e['type']))
        .toList();

    print("userData ${userData.length}");
    setState(() {
      Staticmenbers.newUserCar = userData;
    });

    print("Staticmenbers.list.length : ${Staticmenbers.newUserCar.length}");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (BuildContext context) => GenerateQR());
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/splash1.png"),
              ),
            ),
          ),
          centerTitle: true,
          title: const Text("Qr Scanner"),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 300),
              Text(getResult),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PRIMARY_COLOR,
                ),
                child: TextButton(
                    onPressed: (() {
                      scanQRCode();
                    }),
                    child: Text(
                      "Scan QR",
                      style: TextStyle(color: WHITE_COLOR),
                    )),
              )
            ],
          ),
        ));
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        // cid = qrCode;
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(getSingleUserData());
      getSingleUserData();
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
