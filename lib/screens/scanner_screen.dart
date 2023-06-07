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
import '../utils/constants.dart';
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
  Users? scancarddata;
  List<Users> contectData = [];
  bool value = false;
  List<String?> connectUserIdList = [];
  bool isScan = false;
  int? contectcard;
  String? cid;
  String? uid;
  FToast? fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    getContectUserData();
    super.initState();
  }

  Future<void> getContectUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's card")
        .get();
    contectData = snapshot.docs
        .map((e) => Users(
            user: e.data()['user'],
            name: e.data()['Name'],
            department: e.data()['Department'],
            compeny: e.data()['Company'],
            whatsapp: e.data()['WhatsApp'],
            telegram: e.data()['Telegram'],
            website: e.data()['Website'],
            linkdin: e.data()['Linkdin'],
            facebook: e.data()['Facebook'],
            email: e.data()['Email'],
            phone: e.data()['Phone'],
            country: e.data()['country'],
            address: e.data()['Address'],
            id: e.data()['id'],
            image: e.data()['images'],
            type: e.data()['type'],
            card: e.data()['card'],
            color: e.data()['color']))
        .toList();

    setState(() {
      value = true;
      for (var element in contectData) {
        setState(() {
          connectUserIdList.add(element.id);
        });
      }
      Staticmenbers.cardUsers = contectData;
    });
  }

  // another person card display
  Future<void> getSingleUserData(String cid, String uid) async {
    List<Users> scanData = [];
    setState(() {
      isScan = true;
    });
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Carddata")
        .where('id', isEqualTo: cid)
        .get();

    for (var element in snapshot.docs) {
      scanData.add(
        Users(
            user: element.data()['user'],
            name: element.data()['Name'],
            department: element.data()['Department'],
            compeny: element.data()['Company'],
            whatsapp: element.data()['WhatsApp'],
            telegram: element.data()['Telegram'],
            website: element.data()['Website'],
            linkdin: element.data()['Linkdin'],
            facebook: element.data()['Facebook'],
            email: element.data()['Email'],
            phone: element.data()['Phone'],
            country: element.data()['country'],
            address: element.data()['Address'],
            id: element.data()['id'],
            type: element.data()['type'],
            image: element.data()['images'],
            card: element.data()['card'],
            color: element.data()['color']),
      );
    }

    if (connectUserIdList.contains(scanData[0].id) == false) {
      for (int i = 0; i < scanData.length; i++) {
        setState(() {
          scancarddata = Users(
              user: scanData[i].user,
              color: scanData[i].color,
              country: scanData[i].country,
              name: scanData[i].name,
              department: scanData[i].department,
              compeny: scanData[i].compeny,
              whatsapp: scanData[i].whatsapp,
              telegram: scanData[i].telegram,
              website: scanData[i].website,
              linkdin: scanData[i].linkdin,
              facebook: scanData[i].facebook,
              email: scanData[i].email,
              phone: scanData[i].phone,
              address: scanData[i].address,
              id: scanData[i].id,
              type: scanData[i].type,
              image: scanData[i].image,
              card: scanData[i].card);

          isScan = false;
        });
      }
    } else {
      displayCustomToast2();
    }
  }

  // another person card save
  Future<void> addUser() async {
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's card")
        .doc(cid);
    return receivedLoanDataRef.set({
      'Name': scancarddata?.name,
      'Department': scancarddata?.department,
      'Company': scancarddata?.compeny,
      'WhatsApp': scancarddata?.whatsapp,
      'Telegram': scancarddata?.telegram,
      'Website': scancarddata?.website,
      'Linkdin': scancarddata?.linkdin,
      'Facebook': scancarddata?.facebook,
      'Email': scancarddata?.email,
      'Phone': scancarddata?.phone,
      'Address': scancarddata?.address,
      'id': cid,
      'images': scancarddata?.image,
      'type': scancarddata?.type,
      'user': FirebaseAuth.instance.currentUser?.uid,
      'card': scancarddata?.card,
      'color': scancarddata?.color,
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
      ),
      body: scancarddata != null
          ? Column(
              children: [
                SizedBox(height: hp(17, context)),
                scancarddata == null
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
                          leading: scancarddata?.image == ""
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
                                    "${scancarddata?.image}",
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
                                        text: '${scancarddata?.name}',
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
                                        text: '${scancarddata?.type}',
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
                                        text: '${scancarddata?.department}',
                                        fontSize: 14,
                                        selectionColor: grayColor,
                                      ))
                                ]),
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
                          } else if (cid == Users) {
                            displayCustomToast2();
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

  // scanner screen
  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        //user ID
        uid = qrCode.substring(0, 28);
        //card ID
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
      });
    } on PlatformException {
      return;
    }
  }

  displayCustomToast() {
    Widget toast = const CustomToast(
      child: Text(
        "You cannot save your own card.",
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
        "This QR Code is invalid.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }

  displayCustomToast2() {
    Widget toast = const CustomToast(
      child: Text(
        "This card is already added.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 5),
    );
  }
}
