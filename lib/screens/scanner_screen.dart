import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/custom_no_data_widget.dart';

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
  int? color;
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

  Future<void> getSingleUserData(String cid, String uid) async {
    List<Users> userData = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
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
            card: element['card'],
            color: element['color']),
      );
    });

    setState(() {
      List.generate(userData.length, (index) {
        name = userData[index].name;
        card = userData[index].card;
        color = userData[index].color;
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
      'color': color,
    }).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Dashboardscreen(
                    index: 2,
                  )));
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
      backgroundColor: WHITE_COLOR,
      appBar: Customappbarwidget(
          title: "QR Scanner",
          actions: null,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp))),
      body: value != false
          ? Center(
              child: Column(
                children: [
                  SizedBox(height: hp(25, context)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              color == "" ? colorList[color!] : PRIMARY_COLOR,
                          blurRadius: 1.0,
                        ),
                        const BoxShadow(
                          color: Color(0xffc1c4be),
                          blurRadius: 20.0,
                        ),
                      ],
                      color: color == "" ? colorList[color!] : PRIMARY_COLOR,
                    ),
                    margin: const EdgeInsets.only(
                        left: 95, right: 95, top: 10, bottom: 10),
                    child: Column(children: [
                      image == ""
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(45),
                                  topRight: Radius.circular(50)),
                              child: Image.asset(
                                "assets/images/splash1.png",
                                width: wp(55, context),
                                height: hp(17, context),
                                fit: BoxFit.fill,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(45),
                                  topRight: Radius.circular(50)),
                              child: Image.network(
                                "$image",
                                width: wp(52, context),
                                height: hp(17, context),
                                fit: BoxFit.fill,
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  return child;
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Image(
                                    image: const AssetImage(
                                        "assets/images/splash1.png"),
                                    width: wp(55, context),
                                    height: hp(17, context),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: Icon(
                                      Icons.image,
                                      size: 130,
                                      color: WHITE_COLOR,
                                    ));
                                  }
                                },
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Center(
                          child: Text(
                            '$name',
                            style: const TextStyle(
                                color: WHITE_COLOR, fontSize: 20),
                          ),
                        ),
                      ),
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
                          child: const Text(
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
                        child: const Text(
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
          : Column(children: [
              SizedBox(height: hp(15, context)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: BLACK_COLOR, blurRadius: 0.1)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  width: wp(50, context),
                  height: hp(8, context),
                  child: Center(
                      child: Text(
                    "Scan Your QR Code",
                    style: TextStyle(fontSize: 20),
                  ))),
              SizedBox(height: hp(5, context)),
              CustomNoData(
                iconaddress: QR,
              ),
              SizedBox(height: hp(5, context)),
              InkWell(
                onTap: () {
                  scanQRCode();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      boxShadow: [
                        BoxShadow(color: BLACK_COLOR, blurRadius: 0.5)
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  width: wp(50, context),
                  height: hp(6, context),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        size: 35,
                      ),
                      SizedBox(width: wp(5, context)),
                      Text(
                        'Qr Scan',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )),
                ),
              ),
            ]),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        uid = qrCode.substring(0, 28);
        log("$uid");
        cid = qrCode.substring(29);
        print("Cid is $cid & $uid");
        value = true;
        getSingleUserData(cid!, uid!);
      });
    } on PlatformException {
      return;
    }
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
