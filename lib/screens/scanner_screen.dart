import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../controllers/data_controllers.dart';
import '../utils/constants_color.dart';

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
          actions: [
            InkWell(
                onTap: () {
                  scanQRCode();
                },
                child: Icon(Icons.abc))
          ],
          centerTitle: true,
          title: const Text("QR Scanner"),
          backgroundColor: PRIMARY_COLOR,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: .001,
              crossAxisSpacing: .001,
            ),
            itemCount: Staticmenbers.newUserCar.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                TextButton(
                    onPressed: () {
                      print('${Staticmenbers.newUserCar[index].type}');
                    },
                    child: Text("data")),
                SizedBox(height: 2.8),
                Card(
                    color: PRIMARY_COLOR,
                    child: Column(
                      children: [
                        Image.network(
                          "${Staticmenbers.newUserCar[index].image}",
                          width: 175,
                          height: 147,
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: WHITE_COLOR,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ))
              ]);
            }));
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        // cid = qrCode;
        uid = qrCode;
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
