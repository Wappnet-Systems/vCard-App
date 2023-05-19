import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/formatters.dart';
import 'package:vcard/utils/responsive.dart';
import '../widget/custom_loadingbar_widget.dart';
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
        final shouldPop = await AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            showCloseIcon: false,
            title: "Exit Application",
            desc: "Do you want to exit an Applicaton?",
            btnCancelOnPress: () async {},
            btnOkOnPress: () async {
              exit(0);
            }).show();
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: loginformGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: hp(10, context)),
                  Image.asset(
                    'assets/images/login.png',
                    width: wp(100, context),
                    height: hp(35, context),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  const Text(
                    "Login in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  const Text(
                    "Enter your phone number to continue",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: hp(4, context)),
                  IntlPhoneField(
                    inputFormatters: [maskFormatter],
                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: blueColor,
                    ),
                    disableLengthCheck: true,
                    cursorColor: blueColor,
                    controller: countryController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                      hintStyle: TextStyle(
                        color: grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      log(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      phone = country.dialCode;
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
                          if (countryController.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phone + countryController.text,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text("Phone number verification failed."),
                                ));
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              codeSent: (String verificationId,
                                  int? resendToken) async {
                                Numberverification.verify = verificationId;

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OTPscreen()));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          }
                        },
                        child: isLoading
                            ? const Custonloading()
                            : const Text(
                                "Send the code",
                                style: TextStyle(color: whiteColor),
                              )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
