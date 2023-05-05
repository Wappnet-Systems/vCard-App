import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vcard/screens/auth_modual.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class OTPscreen extends StatefulWidget {
  final String? phoneNumber;
  const OTPscreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

  @override
  void initState() {
    super.initState();
    _listenOtp();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: PRIMARY_COLOR, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: PRIMARY_COLOR),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: WHITE_COLOR,
      ),
    );

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
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
        padding: EdgeInsets.symmetric(
            horizontal: wp(7, context), vertical: hp(3, context)),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: hp(8, context),
            ),
            Center(
              child: Image.asset(
                'assets/images/OTP_verification.jpg',
                width: wp(50, context),
                height: hp(25, context),
              ),
            ),
            SizedBox(height: hp(3, context)),
            const Text(
              "OTP Verification Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: COLOR_PRIMARY_DARK,
              ),
            ),
            SizedBox(height: hp(1, context)),
            Text(
              "We just sent you a 6-digit code via SMS to confirm your phone number ${widget.phoneNumber ?? ""}.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: COLOR_PRIMARY_LIGHT,
                fontWeight: FontWeight.w400,
              ),
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
            SizedBox(height: hp(6, context)),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  try {
                    log(Authmodual.verify);
                    log(code);
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: Authmodual.verify, smsCode: code);

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
                  "Verify ",
                  style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
}
