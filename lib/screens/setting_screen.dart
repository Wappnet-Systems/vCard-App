import 'dart:developer';
import 'package:app_settings/app_settings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/number_verification_Screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../utils/constants_color.dart';
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
        .collection("Frind's Card");
    var sanap = await snapshot.get();
    for (var doc in sanap.docs) {
      await doc.reference.delete();
    }
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: Customappbarwidget(
          title: "Settings",
          actions: null,
          leading: Padding(
            padding:
                const EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (BuildContext context) => const GenerateQR());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: WHITE_COLOR,
                    width: 1,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/splash1.png"),
                ),
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "V Card",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            color: WHITE_COLOR,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                InkWell(
                  onTap: () async {
                    AppSettings.openAppSettings();
                  },
                  child: SizedBox(
                    height: hp(4, context),
                    child: const Row(
                      children: [
                        Text(
                          "Permissions",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: hp(4, context),
                  child: const Row(
                    children: [
                      Text(
                        "Version",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Text('1.0.0+1'),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        showCloseIcon: true,
                        desc: "Logout",
                        btnCancelOnPress: () async {},
                        btnOkOnPress: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('isLoggedIn');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Numberverification()));
                        }).show();
                  },
                  child: SizedBox(
                    height: hp(4, context),
                    child: const Row(
                      children: [
                        Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    try {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          showCloseIcon: true,
                          desc: "Delete Account",
                          btnCancelOnPress: () async {},
                          btnOkOnPress: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            _delete_user();
                            prefs.remove('isLoggedIn');

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Numberverification()));
                          }).show();
                    } catch (e) {
                      Error;
                    }
                  },
                  child: SizedBox(
                    height: hp(4, context),
                    child: const Row(
                      children: [
                        Text(
                          "Delete Account",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
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
