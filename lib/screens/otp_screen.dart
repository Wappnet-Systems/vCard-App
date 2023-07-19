import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../widget/custom_toast.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final otpController = OtpFieldController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  FToast? fToast;
  bool isLoading = false;

  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: wp(5, context), vertical: hp(10, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/otp.png',
                scale: 6.5,
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Text(
              "Verification Code",
              style: titleTextStyle,
            ),
            SizedBox(
              height: hp(2, context),
            ),
            Text(
              "Please enter the OTP sent to your device",
              style: textMediumTextStyle.copyWith(color: COLOR_PRIMARY_LIGHT),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: hp(3, context),
            ),
            OTPTextField(
              keyboardType: TextInputType.number,
              length: 6,
              fieldWidth: 40,
              controller: otpController,
              width: wp(100, context),
              style: titleTextStyle,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onChanged: (value) {
                code = value;
              },
            ),
            SizedBox(
              height: hp(5, context),
            ),
            TextButtomWidget(
                isLoading: isLoading,
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  try {
                    // otp verify
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: Numberverification.verify,
                            smsCode: code);
                    setState(() {
                      isLoading = true;
                    });
                    //check for user login or not
                    await auth
                        .signInWithCredential(credential)
                        .then((value) async {
                      await prefs.setBool('isLoggedIn', true);
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Dashboardscreen(index: 0)));
                        displayCustomToast();
                      });
                      otpController.clear();
                    });
                  } catch (e) {
                    log("Error:$e");
                  }
                },
                title: "Verify Phone Number",
                color: COLOR_PRIMARY_DARK),
          ],
        ),
      ),
    );
  }

  displayCustomToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Login Successfully",
        style: TextStyle(color: COLOR_WHITE),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
