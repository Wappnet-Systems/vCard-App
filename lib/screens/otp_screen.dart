import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vcard/screens/number_verification_Screen.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: hp(10, context)),
              Image.asset(
                'assets/images/OTP_verification.png',
                width: wp(100, context),
                height: hp(30, context),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              const Text(
                "Enter the Verification Code",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: hp(3, context),
              ),
              PinFieldAutoFill(
                codeLength: 6,
                onCodeChanged: (value) {
                  code = value!;
                },
              ),
              SizedBox(
                height: hp(4, context),
              ),
              SizedBox(
                width: double.infinity,
                height: hp(7, context),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: BLUE_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        log(Numberverification.verify);
                        log(code);
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: Numberverification.verify,
                                smsCode: code);

                        await auth
                            .signInWithCredential(credential)
                            .then((value) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            showCloseIcon: true,
                            desc: "Login Successfully",
                          ).show();
                          Future.delayed(const Duration(seconds: 3));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboardscreen(
                                        index: 0,
                                      )));
                        });
                      } catch (e) {
                        log("Error:$e");
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          showCloseIcon: true,
                          desc: "OTP is invalid.",
                        ).show();
                        Future.delayed(const Duration(seconds: 2));
                      }
                    },
                    child: const Text(
                      "Verify Phone Number",
                      style: TextStyle(color: WHITE_COLOR),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
