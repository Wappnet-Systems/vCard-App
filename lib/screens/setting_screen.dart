// ignore_for_file: camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';
import 'package:app_settings/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import '../utils/constants.dart';
import '../widget/text_widget.dart';
import 'app_shere_screen.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({super.key});

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  Future<void> checkAndRequestLocationPermissions() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _delete_user() async {
    var collection = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata");
    log("doc:${collection.id}");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    var snapshot = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's card");
    var sanap = await snapshot.get();
    for (var doc in sanap.docs) {
      await doc.reference.delete();
    }
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.3,
        title: const Text("Settings", style: TextStyle(color: blackColor)),
        backgroundColor: whiteColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: hp(3, context)),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App permissiom
                InkWell(
                  onTap: () async {
                    AppSettings.openAppSettings();
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Permissions",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right_sharp)
                    ],
                  ),
                ),
                const Divider(),
                //App Share Button
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        builder: (BuildContext context) => const GenerateQR());
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "App Share",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // App version Display
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        "Version",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text('1.0.0'),
                    ),
                  ],
                ),
                const Divider(),
                // log out button
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => CustomAlartDialog(
                            title: const Textwidget(
                                textAlign: TextAlign.start, text: "Log Out"),
                            content: const Textwidget(
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              text: "Are you sure you want to logout?",
                              selectionColor: grayColor,
                            ),
                            onPressedNo: () {
                              Navigator.pop(context);
                            },
                            onPressedYes: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('isLoggedIn');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Numberverification()));
                            }));
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right_sharp)
                    ],
                  ),
                ),
                const Divider(),
                //Account Delete
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => CustomAlartDialog(
                            title: const Textwidget(
                                textAlign: TextAlign.start,
                                text: "Delete Account"),
                            content: const Textwidget(
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              text: "Are you sure you want to Delete Account?",
                              selectionColor: grayColor,
                            ),
                            onPressedNo: () {
                              Navigator.pop(context);
                            },
                            onPressedYes: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              _delete_user();
                              prefs.remove('isLoggedIn');
                              _delete_user();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Numberverification()));
                            }));
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Delete Account",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right_sharp)
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
