import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vcard/screens/otp_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController countryController = TextEditingController();
  String phone = "91";
  var maskFormatter = MaskTextInputFormatter(
      mask: '##### #####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            showCloseIcon: true,
            desc: "Exit",
            btnCancelOnPress: () async {},
            btnOkOnPress: () async {
              exit(0);
            }).show();
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: wp(7, context),
            vertical: hp(3, context),
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: hp(1, context),
              ),
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  width: wp(60, context),
                  height: hp(40, context),
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: COLOR_PRIMARY_DARK,
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              Text(
                "Please sign in to continue.",
                style: TextStyle(
                    fontSize: 16,
                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: hp(5, context),
              ),
              IntlPhoneField(
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonMargin:
                    EdgeInsets.symmetric(horizontal: wp(2, context)),
                initialCountryCode: 'IN',
                controller: countryController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (phone) {
                  log(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  phone = country.dialCode;
                  log("phone:$phone");
                },
                style: const TextStyle(fontSize: 18, color: COLOR_PRIMARY_DARK),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: hp(2, context),
                  ),
                  labelText: '',
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hp(5, context),
              ),
              TextButtomWidget(
                isLoading: isLoading,
                onPressed: () async {
                  log("number:+${phone + countryController.text}");
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: "+${phone + countryController.text}",
                    verificationCompleted: (PhoneAuthCredential credential) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      log("Error:::::$e");
                      setState(() {
                        isLoading = false;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Phone number verification failed.Try again!.",
                            style: TextStyle(
                              color: COLOR_PRIMARY_DARK,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: PRIMARY_COLOR,
                          padding: EdgeInsets.symmetric(
                            horizontal: wp(4, context),
                            vertical: hp(2, context),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: wp(4, context),
                            vertical: hp(2, context),
                          ),
                        ),
                      );
                    },
                    codeSent: (String verificationId, int? resendToken) async {
                      LoginPage.verify = verificationId;
                      log("VerificationId::::::${LoginPage.verify}");
                      setState(() {
                        isLoading = true;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phoneNumber: "+${phone + countryController.text}",
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      isLoading = false;
                    },
                  );
                  setState(() {
                    isLoading = true;
                  });
                },
                title: "Send the Code",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
