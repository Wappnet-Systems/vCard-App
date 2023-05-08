import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vcard/screens/auth_modual.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class OTPscreen extends StatefulWidget {
  final String? phoneNumber;
  const OTPscreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final otpController = TextEditingController();
  String? code;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    listenOtp();
  }

  void listenOtp() {
    SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      extendBodyBehindAppBar: true,
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
              currentCode: code,
              controller: otpController,
              onCodeChanged: (value) {
                code = value!;
              },
              onCodeSubmitted: (value) {
                code = value;
                otpController.text = value;
                log("code:${otpController.text}");
              },
            ),
            SizedBox(
              height: hp(6, context),
            ),
            TextButtomWidget(
              isLoading: isLoading,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                try {
                  log(Authmodual.verify);
                  log(code!);
                  setState(() {
                    isLoading = true;
                  });
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: Authmodual.verify, smsCode: "$code");

                  await auth
                      .signInWithCredential(credential)
                      .then((value) async {
                    setState(() {
                      isLoading = false;
                    });
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      showCloseIcon: true,
                      desc: "Login Successfully",
                    ).show();
                    await prefs.setBool('isLoggedIn', true);
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboardscreen(
                            index: 0,
                          ),
                        ),
                      );
                    });
                  });
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
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
              title: "Verify ",
            ),
          ],
        ),
      ),
    );
  }
}
