import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import '../widget/custom_loadingbar_widget.dart';
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
  void dispose() {
    otpController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: hp(10, context)),
              Image.asset(
                'assets/images/otp.png',
                width: wp(100, context),
                height: hp(35, context),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              const Text(
                "Verification Code",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              const Text(
                "Please enter the OTP sent to your device",
                style: TextStyle(
                  fontSize: 16,
                ),
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
                width: MediaQuery.of(context).size.width,
                style: const TextStyle(fontSize: 20, color: blueColor),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onChanged: (value) {
                  code = value;
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
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
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
                        });
                      } catch (e) {
                        log("Error:$e");
                      }
                    },
                    child: isLoading
                        ? const Custonloading()
                        : const Text(
                            "Verify Phone Number",
                            style: TextStyle(color: whiteColor),
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayCustomToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Login Successfully",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
