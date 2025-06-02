import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/phone_field_widget.dart';
import 'package:vcard/widget/text_button_widget.dart';
import 'otp_screen.dart';

class Numberverification extends StatefulWidget {
  const Numberverification({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<Numberverification> createState() => _NumberverificationState();
}

class _NumberverificationState extends State<Numberverification> {
  TextEditingController countryController = TextEditingController();
  GlobalKey<FormState> loginformGlobalKey = GlobalKey<FormState>();
  String phone = "+91";

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return CustomAlartDialog(
                title: Text(
                  "Exit Application",
                  textAlign: TextAlign.center,
                  style:
                      smalltitleTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                content: Text(
                  "Do you want to exit an Applicaton?",
                  textAlign: TextAlign.center,
                  style:
                      textMediumTextStyle.copyWith(color: COLOR_PRIMARY_LIGHT),
                ),
                onPressedNo: () {
                  Navigator.pop(context);
                },
                onPressedYes: () {
                  exit(0);
                },
              );
            });
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: wp(5, context),
            vertical: hp(10, context),
          ),
          child: Form(
            key: loginformGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/login.png',
                    scale: 6.5,
                  ),
                ),
                SizedBox(
                  height: hp(3, context),
                ),
                Text(
                  "Login",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Text(
                  "Enter your phone number to continue",
                  style: textMediumTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: hp(3, context)),
                PhoneFieldWidget(
                  controller: countryController,
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    log(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    phone = country.dialCode;
                  },
                ),
                SizedBox(
                  height: hp(5, context),
                ),
                TextButtomWidget(
                  isLoading: isLoading,
                  onPressed: () async {
                    log("phone:$phone");
                    if (countryController.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      // number verify
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: phone + countryController.text,
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        // verify fail
                        verificationFailed: (FirebaseAuthException e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Phone number verification failed."),
                          ));
                          setState(() {
                            isLoading = false;
                          });
                        },
                        // send OTP
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          Numberverification.verify = verificationId;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTPscreen()));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }
                  },
                  title: "Send the code",
                  color: COLOR_PRIMARY_DARK,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
