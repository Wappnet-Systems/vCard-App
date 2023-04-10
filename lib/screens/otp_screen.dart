import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vcard/screens/auth_modual.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/constants_color.dart';

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
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/OTP_verification.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Enter the Verification Code",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              PinFieldAutoFill(
                codeLength: 6,
                onCodeChanged: (value) {
                  code = value!;
                },
                // showCursor: true,
                // onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
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
                                verificationId: Authmodual.verify,
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
                          await Future.delayed(const Duration(seconds: 1));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboardscreen()));
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
}
