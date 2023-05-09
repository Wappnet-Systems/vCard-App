import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/validator.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import 'package:vcard/widget/custom_textformfield_widget.dart';
import 'package:vcard/widget/icon_widget.dart';
import 'package:vcard/widget/upload_image_dialog.dart';

class Createcardscreen extends StatefulWidget {
  const Createcardscreen({super.key});

  @override
  State<Createcardscreen> createState() => _CreatecardscreenState();
}

class _CreatecardscreenState extends State<Createcardscreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _whatsappcontroller = TextEditingController();
  final TextEditingController _telegramcontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _linkcontroller = TextEditingController();
  final TextEditingController _websitecontroller = TextEditingController();
  final TextEditingController _facebookcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _typecontroller = TextEditingController();
  FToast? fToast;
  final _formfield = GlobalKey<FormState>();
  int? _selectedIndex;
  bool isLoading = false;
  String? imgurl;
  File? imagepicker;
  String? card;
  dynamic result;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  getCardIndex() async {
    _selectedIndex = await result;
    log("card index:$_selectedIndex");
  }

  var receivedLoanDataRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("Carddata")
      .doc();

  Future<void> addUser() async {
    log(receivedLoanDataRef.id);
    if (imagepicker != null) {
      imgurl = await uploadImage(imagepicker!);
    }
    return receivedLoanDataRef.set({
      'Name': _nameController.text,
      'Department': _departmentController.text,
      'Company': _companyController.text,
      'HeadLine': _headlineController.text,
      'WhatsApp': _whatsappcontroller.text,
      'Telegram': _telegramcontroller.text,
      'Website': _websitecontroller.text,
      'Link': _linkcontroller.text,
      'Facebook': _facebookcontroller.text,
      'Email': _emailcontroller.text,
      'Phone': _numbercontroller.text,
      'Address': _addresscontroller.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? "",
      'type': _typecontroller.text,
      'user': FirebaseAuth.instance.currentUser?.uid,
      'card': _selectedIndex ?? 4,
    }).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Dashboardscreen(
              index: 0,
            ),
            transitionDuration: const Duration(seconds: 0),
          ),
          (route) => false);
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker().pickImage(source: imageType);
      setState(() {
        if (pick != null) {
          imagepicker = File(pick.path);
        }
      });
    } catch (e) {
      log("Error:$e");
    }
  }

  Future uploadImage(File imagepicker) async {
    String url;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(imagepicker);
    url = await reference.getDownloadURL();
    return url;
  }

  final imageList = [
    "assets/cards/card1.jpg",
    'assets/cards/card2.jpg',
    "assets/cards/card3.jpg",
    "assets/cards/card4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarWidget(
        title: "Create Card",
        centerTitle: true,
        leadinWidget: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: WHITE_COLOR,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("Save");
              if (_formfield.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                addUser();
              }
            },
            icon: const Icon(
              Icons.save,
              color: WHITE_COLOR,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: wp(6, context),
          vertical: hp(3, context),
        ),
        child: Form(
          key: _formfield,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: PRIMARY_COLOR.withOpacity(0.8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: imagepicker == null
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(35, context),
                                  height: hp(21, context),
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  imagepicker!,
                                  width: wp(35, context),
                                  height: hp(21, context),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: hp(0, context),
                        right: wp(0, context),
                        child: InkWell(
                          onTap: () {
                            imagePicker(
                              context,
                              cameraOnPressed: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera);
                              },
                              galleryOnPressed: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery);
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: PRIMARY_COLOR,
                              border: Border.all(
                                color: WHITE_COLOR,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_enhance_rounded,
                              size: 23,
                              color: WHITE_COLOR,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              CustomTextFormField(
                textInputType: TextInputType.emailAddress,
                textEditingController: _typecontroller,
                texteditinghinttext: 'Card Type',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _nameController,
                texteditinghinttext: 'Name',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _departmentController,
                texteditinghinttext: 'Department',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _companyController,
                texteditinghinttext: 'Company',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.multiline,
                textEditingController: _headlineController,
                maxLength: 250,
                maxLines: 7,
                texteditinghinttext: 'Headline',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              SizedBox(
                height: hp(3, context),
              ),
              InkWell(
                onTap: () {
                  result = showimagelist(context, _selectedIndex, imageList);
                  getCardIndex();
                },
                child: Text(
                  "Select Card Theme",
                  style: TextStyle(
                    fontSize: 14,
                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              Iconwidget(
                websitecontroller: _websitecontroller,
                telegramcontroller: _telegramcontroller,
                numbercontroller: _numbercontroller,
                emailcontroller: _emailcontroller,
                textEditingController: _addresscontroller,
                linkcontroller: _linkcontroller,
                facebookcontroller: _facebookcontroller,
                whatsappcontroller: _whatsappcontroller,
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: PRIMARY_COLOR,
      ),
      child: const Text(
        "Add Successfully",
        style: TextStyle(color: WHITE_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
