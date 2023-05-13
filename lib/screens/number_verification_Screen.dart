import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vcard/utils/constants_color.dart';
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
  var phone;

  var maskFormatter = MaskTextInputFormatter(
      mask: '##### #####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    countryController.text = "+91";
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
        backgroundColor: WHITE_COLOR,
        body: SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  SizedBox(height: hp(10, context)),
                  Image.asset(
                    'assets/images/Auth_modual.png',
                    width: wp(100, context),
                    height: hp(30, context),
                  ),
                  SizedBox(
                    height: hp(3, context),
                  ),
                  const Text(
                    "Add your Phone Number",
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
                  SizedBox(height: hp(4, context)),
                  Container(
                    height: hp(7, context),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: wp(0.5, context), color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: hp(2, context),
                        ),
                        SizedBox(
                          width: wp(9, context),
                          child: TextField(
                            cursorColor: PRIMARY_COLOR,
                            controller: countryController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: PRIMARY_COLOR),
                        ),
                        SizedBox(
                          width: wp(3, context),
                        ),
                        Expanded(
                            child: TextField(
                          cursorColor: PRIMARY_COLOR,
                          inputFormatters: [maskFormatter],
                          onChanged: (value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: hp(4, context),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: hp(7, context),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: countryController.text + phone,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              setState(() {
                                isLoading = false;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "Phone number verification failed. Error: ${e.message}"),
                              ));
                            },
                            codeSent: (String verificationId,
                                int? resendToken) async {
                              Numberverification.verify = verificationId;

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OTPscreen()));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                          setState(() {
                            isLoading = true;
                          });
                        },
                        child: const Text(
                          "Send the code",
                          style: TextStyle(color: WHITE_COLOR),
                        )),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 85,
              left: 155,
              child:
                  (isLoading) ? const Custonloading() : const SizedBox.shrink(),
            )
          ]),
        ),
      ),
    );
  }
}
