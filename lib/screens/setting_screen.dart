import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/auth_modual.dart';

import '../utils/constants_color.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({super.key});

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  bool _darkMode = false;

  Future<void> checkAndRequestLocationPermissions() async {
    // var status = await Permission.location.status;
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _toggleThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = !_darkMode;
    });
    await prefs.setBool('darkMode', _darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "vCard",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            color: WHITE_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      checkAndRequestLocationPermissions();
                    },
                    child: Text(
                      "Permissions",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(
                      // color: LINE_COLOR,
                      ),
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          "Dark Mode",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Switch(
                          value: _darkMode,
                          onChanged: (value) {
                            _toggleThemeMode();
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                      // color: LINE_COLOR,
                      ),
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          "Version",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        // Text('${version}'),
                      ],
                    ),
                  ),
                  Divider(
                      //color: LINE_COLOR,
                      ),
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
                            final success = await prefs
                                .remove('Staticmenbers.listofUsers[index].id');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Authmodual()));
                          }).show();
                    },
                    child: Container(
                      height: 30,
                      child: Text(
                        "Log out",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Divider(
                      // color: LINE_COLOR,
                      ),
                  InkWell(
                    onTap: () {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          showCloseIcon: true,
                          desc: "Delete Account",
                          btnCancelOnPress: () async {},
                          btnOkOnPress: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser?.uid);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Authmodual()));
                          }).show();
                    },
                    child: Text(
                      "Delete Account",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Text(
          //     "Follow US",
          //     style: TextStyle(fontSize: 23),
          //   ),
          // ),
          // Container(
          //   color: WHITE_COLOR,
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Twitter",
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         Divider(
          //             // color: LINE_COLOR,
          //             ),
          //         Text(
          //           "Face Book",
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         Divider(
          //             // color: LINE_COLOR,
          //             ),
          //         Text(
          //           "Telegram",
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         Divider(
          //             // color: LINE_COLOR,
          //             ),
          //         Text(
          //           "Instgram",
          //           style: TextStyle(fontSize: 18),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
