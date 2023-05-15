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
                InkWell(
                  onTap: () async {
                    AppSettings.openAppSettings();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: WHITE_COLOR,
                          blurRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color(0xffc1c4be),
                          blurRadius: 10.0,
                        ),
                      ],
                      color: WHITE_COLOR,
                    ),
                    height: hp(9, context),
                    child: Row(
                      children: [
                        SizedBox(width: wp(3, context)),
                        const Text(
                          "Permissions",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right_sharp)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: hp(1, context)),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: WHITE_COLOR,
                        blurRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Color(0xffc1c4be),
                        blurRadius: 20.0,
                      ),
                    ],
                    color: WHITE_COLOR,
                  ),
                  height: hp(9, context),
                  child: Row(
                    children: [
                      SizedBox(width: wp(3, context)),
                      const Text(
                        "Version",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('1.0.0'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: hp(1, context)),
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
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: WHITE_COLOR,
                          blurRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color(0xffc1c4be),
                          blurRadius: 20.0,
                        ),
                      ],
                      color: WHITE_COLOR,
                    ),
                    height: hp(9, context),
                    child: Row(
                      children: [
                        SizedBox(width: wp(3, context)),
                        const Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right_sharp)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: hp(1, context)),
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
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: WHITE_COLOR,
                          blurRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color(0xffc1c4be),
                          blurRadius: 20.0,
                        ),
                      ],
                      color: WHITE_COLOR,
                    ),
                    height: hp(9, context),
                    child: Row(
                      children: [
                        SizedBox(width: wp(3, context)),
                        const Text(
                          "Delete Account",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right_sharp)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
