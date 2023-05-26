// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/text_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../utils/validator.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_no_data_widget.dart';
import '../widget/custom_toast.dart';

class Scannerscreen extends StatefulWidget {
  const Scannerscreen({super.key});

  @override
  State<Scannerscreen> createState() => _ScannerscreenState();
}

class _ScannerscreenState extends State<Scannerscreen> {
  List<Users> userData = [];
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
  FToast? fToast;

  Future<void> getSingleUserData(String cid, String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Carddata")
        .where('id', isEqualTo: cid)
        .get();

    for (var element in snapshot.docs) {
      userData.add(
        Users(
            user: element['user'],
            name: element['Name'],
            department: element['Department'],
            compeny: element['Company'],
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
    }

    setState(() {
      List.generate(userData.length, (index) {
        name = userData[index].name;
        card = userData[index].card;
        color = userData[index].color;
        cid = cid;
        uid = uid;
        department = userData[index].department;
        compeny = userData[index].compeny;
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
        .collection("Frind's card")
        .doc(cid);
    return receivedLoanDataRef.set({
      'Name': name,
      'Department': department,
      'Company': compeny,
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
              builder: (context) => const Dashboardscreen(
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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.3,
        title: const Text(
          "QR Scanner",
          style: TextStyle(color: blueColor),
        ),
        backgroundColor: whiteColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
      ),
      body: value != false
          ? Center(
              child: Column(
                children: [
                  SizedBox(height: hp(17, context)),
                  userData.isEmpty
                      ? const Custonloading()
                      : Container(
                          height: hp(13, context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: whiteColor,
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                color: Color(0xffc1c4be),
                                blurRadius: 10.0,
                              ),
                            ],
                            color: whiteColor,
                          ),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 5, bottom: 5),
                          child: ListTile(
                            leading: image == ""
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/splash1.png",
                                      width: wp(18, context),
                                      height: hp(10, context),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.network(
                                      "$image",
                                      width: wp(18, context),
                                      height: hp(10, context),
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
                                          return const Center(
                                              child: Icon(
                                            Icons.image,
                                            size: 130,
                                            color: whiteColor,
                                          ));
                                        }
                                      },
                                    ),
                                  ),
                            title: Row(children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text: '$name',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          selectionColor: blackColor,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text: '$type',
                                          fontSize: 14,
                                          selectionColor: grayColor,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text: '$department',
                                          fontSize: 14,
                                          selectionColor: grayColor,
                                        ))
                                  ]),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(Icons.more_horiz),
                              ),
                            ]),
                          )),
                  SizedBox(height: hp(5, context)),
                  Center(
                    child: Container(
                        width: wp(90, context),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          child: isLoading
                              ? const Custonloading()
                              : const Text(
                                  'Connected',
                                  style: TextStyle(color: whiteColor),
                                ),
                          onPressed: () async {
                            if (FirebaseAuth.instance.currentUser?.uid == uid) {
                              setState(() {
                                isLoading = false;
                              });
                              displayCustomToast();
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              addUser();
                            }
                          },
                        )),
                  ),
                  SizedBox(height: hp(3, context)),
                  Container(
                      width: wp(90, context),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Disconnected',
                          style: TextStyle(color: whiteColor),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboardscreen(
                                        index: 1,
                                      )));
                        },
                      )),
                ],
              ),
            )
          : Column(children: [
              SizedBox(height: hp(15, context)),
              const Center(
                  child: Text(
                "Scan QR Code",
                style: TextStyle(fontSize: 20),
              )),
              SizedBox(height: hp(0.5, context)),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Get Started by scanning the QR code and get the card.",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              SizedBox(height: hp(5, context)),
              const CustomNoData(
                iconaddress: qrJson,
              ),
              SizedBox(height: hp(2, context)),
              InkWell(
                onTap: () {
                  scanQRCode();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: blueColor,
                      boxShadow: const [
                        BoxShadow(color: blackColor, blurRadius: 0.5)
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  width: wp(50, context),
                  height: hp(6, context),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: whiteColor,
                      ),
                      SizedBox(width: wp(5, context)),
                      const Text(
                        'QR Scan',
                        style: TextStyle(fontSize: 17, color: whiteColor),
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
        bool isValid1 = qrvalidateString(uid!);
        bool isValid2 = qrvalidateString(cid!);

        if (isValid1 == true && isValid2 == true) {
          getSingleUserData(cid!, uid!);
          value = true;
        } else {
          displayCustomToast1();
          value = false;
        }
        print("22222222:${qrCode}");
      });
    } on PlatformException {
      return;
    }
  }

  displayCustomToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Do not save this card.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }

  displayCustomToast1() {
    Widget toast = const CustomToast(
      child: Text(
        "Do not Scan this Code.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
