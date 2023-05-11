import 'dart:developer';
import 'package:app_settings/app_settings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_page.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/app_bar_widget.dart';

import 'app_shere_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _darkMode = false;

  Future<void> checkAndRequestLocationPermissions() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> toggleThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = !_darkMode;
    });
    await prefs.setBool('darkMode', _darkMode);
  }

  Future<void> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var collection = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata");
    log("doc:${collection.id}");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      log("doc:$doc");
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
    prefs.remove('isLoggedIn');
    log('delete user:${FirebaseAuth.instance.currentUser?.uid}');
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarWidget(
        title: 'Settings',
        leadingWidth: wp(4, context),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: wp(6, context),
          vertical: hp(2, context),
        ),
        children: [
          SizedBox(
            height: hp(4, context),
          ),
          SettingRow(
            onTap: () {
              AppSettings.openAppSettings();
            },
            color: COLOR_PRIMARY_DARK,
            leadingIcon: const SizedBox.shrink(),
            title: "Permissions",
            trilingIcon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: COLOR_PRIMARY_LIGHT,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
          SettingRow(
            color: COLOR_PRIMARY_DARK,
            leadingIcon: const SizedBox.shrink(),
            title: "Version",
            trilingIcon: Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
          SettingRow(
            color: COLOR_PRIMARY_DARK,
            title: "Share App",
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) => const ShareApp(),
              );
            },
            icon: const Icon(
              Icons.share_rounded,
              size: 20,
              color: COLOR_PRIMARY_DARK,
            ),
            trilingIcon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: COLOR_PRIMARY_DARK,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
          SettingRow(
            color: COLOR_PRIMARY_DARK,
            title: "Total Contacts",
            icon: const Icon(
              Icons.account_box_rounded,
              size: 20,
              color: COLOR_PRIMARY_DARK,
            ),
            trilingIcon: Text(
              '0',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
          SettingRow(
            color: Colors.red,
            title: "Log Out",
            icon: const Icon(
              Icons.logout_rounded,
              size: 20,
              color: Colors.red,
            ),
            onTap: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  showCloseIcon: true,
                  desc: "Logout",
                  btnCancelOnPress: () async {},
                  btnOkOnPress: () async {
                    logOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }).show();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
          SettingRow(
            color: Colors.red,
            title: "Delete Account",
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 20,
              color: Colors.red,
            ),
            onTap: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  showCloseIcon: true,
                  desc: "Delete Account",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    deleteUser();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }).show();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
            ),
            child: Divider(
              color: COLOR_PRIMARY_LIGHT.withOpacity(0.15),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Widget? icon;
  final Widget? trilingIcon;
  final Widget? leadingIcon;
  final Color color;
  const SettingRow({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
    this.trilingIcon,
    this.leadingIcon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          leadingIcon ??
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: icon,
              ),
          leadingIcon != null
              ? const SizedBox.shrink()
              : SizedBox(
                  width: wp(3, context),
                ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          const Spacer(),
          trilingIcon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
