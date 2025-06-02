// ignore_for_file: camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'package:app_settings/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/screens/profile_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
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
    var Profile = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile");
    var Prof = await Profile.get();
    for (var doc in Prof.docs) {
      await doc.reference.delete();
    }
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: const Customappbarwidget(
        title: "Settings",
        centerTitle: false,
        leadingWidth: 0.0,
        leading: SizedBox.shrink(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: hp(1, context),
          horizontal: wp(4, context),
        ),
        children: [
          RowWidget(
            title: "Profile",
            icon: const Icon(
              Icons.person,
              color: COLOR_PRIMARY_DARK,
              size: 25,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
          RowWidget(
            title: "Permissions",
            onTap: () {
              AppSettings.openAppSettings();
            },
            icon: const Icon(
              Icons.chevron_right_sharp,
              size: 25,
              color: COLOR_PRIMARY_DARK,
            ),
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
          RowWidget(
            title: "App Share",
            icon: const Icon(
              Icons.share,
              color: COLOR_PRIMARY_DARK,
              size: 25,
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                builder: (BuildContext context) => const GenerateQR(),
              );
            },
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
          RowWidget(
            title: "Version",
            icon: Text(
              '1.0.0',
              style: textMediumTextStyle,
            ),
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
          RowWidget(
            title: "Log Out",
            icon: const Icon(
              Icons.chevron_right_sharp,
              size: 25,
              color: COLOR_PRIMARY_DARK,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => CustomAlartDialog(
                  title: Text(
                    "Log Out",
                    textAlign: TextAlign.center,
                    style: smalltitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  content: Text(
                    "Are you sure you want to logout?",
                    selectionColor: COLOR_PRIMARY_LIGHT,
                    textAlign: TextAlign.center,
                    style: textMediumTextStyle.copyWith(
                        color: COLOR_PRIMARY_LIGHT),
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
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Numberverification(),
                        reverseTransitionDuration: Duration.zero,
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
          RowWidget(
            title: "Delete Account",
            icon: const Icon(
              Icons.chevron_right_sharp,
              size: 25,
              color: COLOR_PRIMARY_DARK,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => CustomAlartDialog(
                  title: Text(
                    "Delete Account",
                    textAlign: TextAlign.center,
                    style: smalltitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  content: Text(
                    "Are you sure you want to Delete Account?",
                    selectionColor: COLOR_PRIMARY_LIGHT,
                    textAlign: TextAlign.center,
                    style: textMediumTextStyle.copyWith(
                        color: COLOR_PRIMARY_LIGHT),
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
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Numberverification(),
                        reverseTransitionDuration: Duration.zero,
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Divider(
            thickness: 1,
            color: COLOR_PRIMARY_LIGHT.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;
  final String? title;
  const RowWidget({
    super.key,
    this.title,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: hp(2, context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title",
              style: smalltitleTextStyle,
            ),
            icon ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
