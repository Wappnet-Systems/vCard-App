import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vcard/screens/login_page.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class OtpScreen extends StatefulWidget {
  final String? phoneNumber;
  const OtpScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final otpController = OtpFieldController();
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
              height: hp(1, context),
            ),
            Center(
              child: Image.asset(
                'assets/images/otp.png',
                width: wp(60, context),
                height: hp(40, context),
              ),
            ),
            const Text(
              "OTP Verification Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: COLOR_PRIMARY_DARK,
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Text(
              "We just sent you a 6-digit code via SMS to confirm your phone number ${widget.phoneNumber ?? ""}.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: hp(3, context),
            ),
            OTPTextField(
              length: 6,
              fieldWidth: 40,
              controller: otpController,
              width: MediaQuery.of(context).size.width,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20, color: COLOR_PRIMARY_DARK),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onChanged: (otp) {
                log("OTP:$otp");
              },
              onCompleted: (pin) {
                setState(() {
                  code = pin;
                });
                log("Completed:$pin");
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
                  log(LoginPage.verify);
                  log(code!);
                  setState(() {
                    isLoading = true;
                  });
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: LoginPage.verify, smsCode: "$code");

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
                    Future.delayed(const Duration(seconds: 1), () {
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
