import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../controllers/data_controllers.dart';
import '../utils/constants_color.dart';
import 'app_shere_screen.dart';
import 'contacts_screen.dart';

class Scannerscreen extends StatefulWidget {
  Scannerscreen({super.key});

  @override
  State<Scannerscreen> createState() => _ScannerscreenState();
}

class _ScannerscreenState extends State<Scannerscreen> {
  int? contectcard;
  String? cid;
  String? uid;

  Future<void> getSingleUserData() async {
    log("xzc:${cid}");
    log("qwe:${uid}");
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Carddata")
        .where('id', isEqualTo: cid)
        .get();
    log('message:');
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

    log("userData ${userData.length}");
    setState(() {
      Staticmenbers.newUserCar = userData;
    });

    log("Staticmenbers.list.length : ${Staticmenbers.newUserCar.length}");
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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: .001,
              crossAxisSpacing: .001,
            ),
            itemCount: Staticmenbers.newUserCar.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(height: 2.8),
                  InkWell(
                    onTap: () {
                      contectcard = index;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ContactsScreen(contectid: contectcard)));
                    },
                    child: Card(
                      color: PRIMARY_COLOR,
                      child: Column(children: [
                        Staticmenbers.newUserCar[index].image == ""
                            ? Image.asset(
                                "assets/images/splash1.png",
                                width: 175,
                                height: 146,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${Staticmenbers.newUserCar[index].image}",
                                width: 175,
                                height: 146,
                                fit: BoxFit.cover,
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  return child;
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
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
                        SizedBox(height: 3),
                        Center(
                          child: Text(
                            '${Staticmenbers.newUserCar[index].type}',
                            style: TextStyle(color: WHITE_COLOR),
                          ),
                        ),
                        SizedBox(height: 3),
                      ]),
                    ),
                  ),
                ],
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: PRIMARY_COLOR,
          label: Row(
            children: [Icon(Icons.photo_camera), Text('Qr Scan')],
          ),
          onPressed: () {
            scanQRCode();
          },
        ));
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        uid = qrCode.substring(0, 28);
        cid = qrCode.substring(29);
      });
      log("message: ${cid} ${uid}");
      getSingleUserData();
    } on PlatformException {}
  }
}
