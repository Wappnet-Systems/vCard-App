import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/controllers/data_controllers.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import 'package:vcard/widget/text_button_widget.dart';

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
      appBar: AppBarWidget(
        title: "Qr Scanner",
        leadingWidth: wp(4, context),
      ),
      body: value != false
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: hp(22.5, context),
                    // width: wp(60, context),
                    margin: EdgeInsets.symmetric(
                      horizontal: wp(6, context),
                      vertical: hp(1, context),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(4, context),
                      vertical: hp(2, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: WHITE_COLOR,
                      boxShadow: [
                        BoxShadow(
                          color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(1, -1),
                        ),
                        BoxShadow(
                          color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(-1, 1),
                        )
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        image == "" || image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(20, context),
                                  height: hp(12, context),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "$image",
                                  width: wp(25, context),
                                  height: hp(15, context),
                                  fit: BoxFit.cover,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: PRIMARY_COLOR.withOpacity(0.3),
                                      child: const Icon(
                                        Icons.image_rounded,
                                        size: 90,
                                        color: PRIMARY_COLOR,
                                      ),
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Container(
                                        color: PRIMARY_COLOR.withOpacity(0.3),
                                        child: const Icon(
                                          Icons.image_rounded,
                                          size: 90,
                                          color: PRIMARY_COLOR,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                        SizedBox(
                          width: wp(3, context),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${name?.toUpperCase()}',
                              style: const TextStyle(
                                color: COLOR_PRIMARY_DARK,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: hp(0.5, context),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.work_outline_rounded,
                                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: wp(1, context),
                                ),
                                Text(
                                  '$department',
                                  style: const TextStyle(
                                    color: COLOR_PRIMARY_DARK,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: hp(0.5, context),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home_work_outlined,
                                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: wp(1, context),
                                ),
                                Text(
                                  '$compeny',
                                  style: const TextStyle(
                                    color: COLOR_PRIMARY_DARK,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: hp(0.5, context),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: wp(1, context),
                                ),
                                SizedBox(
                                  width: wp(48, context),
                                  child: Text(
                                    '$address',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: COLOR_PRIMARY_DARK,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(25, context),
                    ),
                    child: TextButtomWidget(
                      width: wp(30, context),
                      height: hp(7, context),
                      fontSize: 15,
                      onPressed: () {
                        addUser();
                        displayCustomToast();
                      },
                      title: "Connected",
                    ),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(25, context),
                    ),
                    child: TextButtomWidget(
                      width: wp(30, context),
                      height: hp(7, context),
                      fontSize: 15,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Dashboardscreen(
                                index: 0,
                              ),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                            (route) => false);
                      },
                      title: "Disconnected",
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: wp(70, context),
                    child: Text(
                      "Scan QR codes in seconds with just a click of a button. Try it out now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: COLOR_PRIMARY_DARK.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: COLOR_PRIMARY_DARK,
                    elevation: 1.0,
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
                        const Text(
                          'Qr Scan',
                          style: TextStyle(
                              fontSize: 16,
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    onPressed: () {
                      scanQRCode();
                    },
                  ),
                ],
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
