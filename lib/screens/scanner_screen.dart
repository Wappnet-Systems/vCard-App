import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import '../controllers/data_controllers.dart';
import '../utils/style.dart';
import '../utils/responsive.dart';
import 'app_shere_screen.dart';

class Scannerscreen extends StatefulWidget {
  const Scannerscreen({super.key});

  @override
  State<Scannerscreen> createState() => _ScannerscreenState();
}

class _ScannerscreenState extends State<Scannerscreen> {
  FToast? fToast;
  bool value = false;
  int? contectcard;
  int? card;
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

  Future<void> getSingleUserData(String cid) async {
    List<Users> userData = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .where('id', isEqualTo: cid)
        .get();

    snapshot.docs.forEach((element) {
      userData.add(
        Users(
            user: element['user'],
            name: element['Name'],
            department: element['Department'],
            compeny: element['Company'],
            headline: element['HeadLine'],
            whatsapp: element['WhatsApp'],
            telegram: element['Telegram'],
            website: element['Website'],
            link: element['Link'],
            facebook: element['Facebook'],
            email: element['Email'],
            phone: element['Phone'],
            address: element['Address'],
            id: element['id'],
            type: element['type'],
            image: element['images'],
            card: element['card']),
      );
    });
    print("qqqqqqq:${userData.length}");
    setState(() {
      List.generate(userData.length, (index) {
        name = userData[index].name;
        card = userData[index].card;
        cid = cid;
        uid = uid;
        department = userData[index].department;
        compeny = userData[index].compeny;
        headline = userData[index].headline;
        whatsapp = userData[index].whatsapp;
        telegram = userData[index].telegram;
        website = userData[index].website;
        link = userData[index].link;
        facebook = userData[index].facebook;
        email = userData[index].email;
        phone = userData[index].phone;
        address = userData[index].address;
        image = userData[index].image;
        type = userData[index].type;
      });
    });
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
      'card': card,
    }).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboardscreen(
            index: 2,
          ),
        ),
      );
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
      appBar: const AppBarWidget(
        title: "Qr Scanner",
        centerTitle: true,
      ),
      body: value != false
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180),
                  Container(
                    height: hp(22.5, context),
                    width: wp(50, context),
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
                                width: wp(50, context),
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
                                errorBuilder: (context, error, stackTrace) {
                                  return Image(
                                    image:
                                        AssetImage("assets/images/splash1.png"),
                                    width: wp(50, context),
                                    height: hp(19, context),
                                  );
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
                      SizedBox(height: hp(0.5, context)),
                      Center(
                        child: Text(
                          '${name}',
                          style: TextStyle(color: WHITE_COLOR),
                        ),
                      ),
                      SizedBox(height: hp(0.5, context)),
                    ]),
                  ),
                  SizedBox(height: hp(1, context)),
                  Center(
                    child: Container(
                        width: wp(50, context),
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          child: Text(
                            'Connected',
                            style: TextStyle(color: WHITE_COLOR),
                          ),
                          onPressed: () {
                            addUser();
                            displayCustomToast();
                          },
                        )),
                  ),
                  SizedBox(height: hp(1, context)),
                  Container(
                      width: wp(50, context),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: Text(
                          'Disconnected',
                          style: TextStyle(color: WHITE_COLOR),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboardscreen(
                                        index: 1,
                                      )));
                        },
                      )),
                ],
              ),
            )
          : Center(
              child: FloatingActionButton.extended(
                backgroundColor: PRIMARY_COLOR,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.photo_camera,
                      size: 20,
                      color: WHITE_COLOR,
                    ),
                    SizedBox(
                      width: wp(2, context),
                    ),
                    const Text('Qr Scan',
                        style: TextStyle(
                            fontSize: 16,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                onPressed: () {
                  scanQRCode();
                },
              ),
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
      print("message: ${cid} ${uid}");
      getSingleUserData(cid!);
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
