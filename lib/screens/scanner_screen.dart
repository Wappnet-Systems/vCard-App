import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import '../controllers/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import 'app_shere_screen.dart';

class Scannerscreen extends StatefulWidget {
  Scannerscreen({super.key});

  @override
  State<Scannerscreen> createState() => _ScannerscreenState();
}

class _ScannerscreenState extends State<Scannerscreen> {
  FToast? fToast;
  bool value = false;
  int? contectcard;
  String? cid;
  String? uid;
  String? name;
  String? department;
  String? compeny;
  String? headline;
  String? whatsapp;
  String? telegram;
  String? snapchat;
  String? website;
  String? link;
  String? facebook;
  String? email;
  String? phone;
  String? address;
  String? id;
  String? image;
  String? type;

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
      name = userData[0].name;
      cid = cid;
      uid = uid;
      department = userData[0].department;
      compeny = userData[0].compeny;
      headline = userData[0].headline;
      whatsapp = userData[0].whatsapp;
      telegram = userData[0].telegram;
      website = userData[0].website;
      link = userData[0].link;
      facebook = userData[0].facebook;
      email = userData[0].email;
      phone = userData[0].phone;
      address = userData[0].address;
      id = userData[0].id;
      image = userData[0].image;
      type = userData[0].type;
    });

    log("Staticmenbers.list.length : ${Staticmenbers.newUserCar.length}");
  }

  Future<void> addUser() async {
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's Card")
        .doc(cid);
    return receivedLoanDataRef.set({
      'Name': name,
      'Department': department,
      'Company': compeny,
      'HeadLine': headline,
      'WhatsApp': whatsapp,
      'Telegram': telegram,
      'Snapchat': snapchat,
      'Website': website,
      'Link': link,
      'Facebook': facebook,
      'Email': email,
      'Phone': phone,
      'Address': address,
      'id': cid,
      'images': image,
      'type': type,
      'user': FirebaseAuth.instance.currentUser?.uid,
    }).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboardscreen()));
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
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
      body: value != false
          ? Center(
              child: Column(
                children: [
                  SizedBox(height: 180),
                  Container(
                    height: 165,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PRIMARY_COLOR,
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: wp(3, context), vertical: hp(1, context)),
                    child: Column(children: [
                      image == ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/splash1.png",
                                width: wp(40, context),
                                height: hp(19, context),
                                fit: BoxFit.fill,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${image}",
                                width: wp(50, context),
                                height: hp(19, context),
                                fit: BoxFit.fill,
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  return child;
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                        child: Icon(
                                      Icons.image,
                                      size: 130,
                                      color: WHITE_COLOR,
                                    ));
                                  }
                                },
                              ),
                            ),
                      SizedBox(height: 3),
                      Center(
                        child: Text(
                          '${name}',
                          style: TextStyle(color: WHITE_COLOR),
                        ),
                      ),
                      SizedBox(height: 3),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Container(
                      child: FloatingActionButton.extended(
                    backgroundColor: PRIMARY_COLOR,
                    label: Row(
                      children: [
                        Icon(Icons.contact_page_rounded),
                        Text('Connected')
                      ],
                    ),
                    onPressed: () {
                      addUser();
                      displayCustomToast();
                    },
                  )),
                ],
              ),
            )
          : Center(
              child: Container(
                  child: FloatingActionButton.extended(
                backgroundColor: PRIMARY_COLOR,
                label: Row(
                  children: [Icon(Icons.photo_camera), Text('Qr Scan')],
                ),
                onPressed: () {
                  scanQRCode();
                },
              )),
            ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        uid = qrCode.substring(0, 28);
        cid = qrCode.substring(29);
        value = true;
      });
      log("message: ${cid} ${uid}");
      getSingleUserData();
    } on PlatformException {}
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: PRIMARY_COLOR,
      ),
      child: const Text(
        "Connected",
        style: TextStyle(color: WHITE_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
