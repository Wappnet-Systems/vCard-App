// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/preview_card_screen.dart';
import 'package:vcard/utils/helper.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import 'package:vcard/widget/phone_field_widget.dart';
import 'package:vcard/widget/upload_image.dart';
import '../utils/constants.dart';
import '../utils/validator.dart';
import '../widget/address_textfield.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/custom_toast.dart';
import 'more_textfield_screen.dart';
import 'package:image_cropper/image_cropper.dart';

class Createcardscreen extends StatefulWidget {
  const Createcardscreen({super.key});

  @override
  State<Createcardscreen> createState() => _CreatecardscreenState();
}

class _CreatecardscreenState extends State<Createcardscreen> {
  // Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController whatsappcontroller = TextEditingController();
  final TextEditingController telegramcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController linkdinController = TextEditingController();
  final TextEditingController websitecontroller = TextEditingController();
  final TextEditingController facebookcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
  //from key
  final _formfield = GlobalKey<FormState>();
  FToast? fToast;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  // card data set database
  var receivedLoanDataRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("Carddata")
      .doc();

  Future<void> addUser() async {
    showCustomLoadingDialog(context);
    String? imgurl;
    if (Imagepicker != null) {
      imgurl = await uploadImage(Imagepicker!);
    }

    return receivedLoanDataRef.set({
      'Name': nameController.text,
      'Department': departmentController.text,
      'Company': companyController.text,
      'WhatsApp': whatsappcontroller.text,
      'Telegram': telegramcontroller.text,
      'Website': websitecontroller.text,
      'Linkdin': linkdinController.text,
      'Facebook': facebookcontroller.text,
      'Email': emailcontroller.text,
      'Phone': numbercontroller.text,
      'country': countryCode,
      'Address': addresscontroller.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? "",
      'type': typecontroller.text,
      'user': FirebaseAuth.instance.currentUser?.uid,
      'card': _selectedIndex ?? 4,
      'color': _selectcolor
    }).then((value) {
      closeCustomLoadingDialog(context);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Dashboardscreen(index: 0),
          reverseTransitionDuration: Duration.zero,
          transitionDuration: Duration.zero,
        ),
      );
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }

  File? Imagepicker;
  // Immage get
  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker()
          .pickImage(source: imageType, maxHeight: 1280, maxWidth: 720);

      if (pick != null) {
        final croppedFile = await ImageCropper().cropImage(
          maxHeight: 300,
          maxWidth: 300,
          sourcePath: pick.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        );
        if (croppedFile != null) {
          setState(() {
            File file = File(croppedFile.path.toString());
            Imagepicker = file;
            isprofile = false;
          });
        }
      }
    } catch (e) {
      Error();
    }
  }

  // upload image database
  Future uploadImage(File Imagepicker) async {
    String url;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(Imagepicker);
    url = await reference.getDownloadURL();
    return url;
  }

  int? _selectcolor;
  int? _selectedIndex;
  bool isLoading = false;
  bool isprofile = false;
  bool ismoreadddata = false;
  int? previewcard;
  int? previewcolor;
  bool selectcolor = false;
  bool selectedIndex = false;
  String? countryCode = '91';
  String? Countryshortcode = "IN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: Customappbarwidget(
        title: "Create Card",
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: hp(1, context),
              horizontal: wp(3, context),
            ),
            child: InkWell(
                onTap: () async {
                  if (_formfield.currentState!.validate() &&
                      addresscontroller.text != "" &&
                      Imagepicker != null) {
                    // save data
                    addUser();
                  } else if (Imagepicker == null) {
                    setState(() {
                      isprofile = true;
                    });
                  } else {
                    displayCustomToast();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(wp(2, context)),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor),
                  child: const Icon(
                    Icons.save,
                    color: COLOR_WHITE,
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: hp(3, context),
          horizontal: wp(5, context),
        ),
        child: Form(
          key: _formfield,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Imagepicker == null
                            ? Image.asset(
                                "assets/images/splash1.png",
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                Imagepicker!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      top: hp(10, context),
                      right: wp(0, context),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => Uploadimage(
                              onTapCamera: () {
                                pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              onTapGallery: () {
                                pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: COLOR_WHITE,
                              width: wp(0.5, context),
                            ),
                            color: COLOR_PRIMARY,
                          ),
                          child: const Icon(
                            Icons.camera,
                            size: 25,
                            color: COLOR_WHITE,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(1, context),
              ),
              isprofile
                  ? Center(
                      child: Text(
                        "Profile Image cant't be Empty",
                        style: smallTextStyle.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const SizedBox.shrink(),
              //card Type
              SizedBox(
                height: hp(3, context),
              ),
              CustomTextFormField(
                textCapitalization: TextCapitalization.words,
                labelText: "Type of card",
                textInputType: TextInputType.emailAddress,
                textEditingController: typecontroller,
                texteditinghinttext: 'Type of card',
                customobscuretext: true,
                customprefixicon: const Icon(
                  Icons.badge_outlined,
                  color: COLOR_PRIMARY_LIGHT,
                ),
                validationfunction: textvalidator,
              ),
              SizedBox(height: hp(2, context)),
              CustomTextFormField(
                textCapitalization: TextCapitalization.words,
                labelText: "Name",
                textInputType: TextInputType.text,
                textEditingController: nameController,
                texteditinghinttext: 'Name',
                customobscuretext: true,
                customprefixicon: const Icon(
                  Icons.person,
                  color: COLOR_PRIMARY_LIGHT,
                ),
                validationfunction: (value) =>
                    namevalidator(value, message: "Name is required."),
              ),
              SizedBox(height: hp(2, context)),
              CustomTextFormField(
                textCapitalization: TextCapitalization.words,
                labelText: "Profession",
                textInputType: TextInputType.text,
                textEditingController: departmentController,
                texteditinghinttext: 'Profession',
                customobscuretext: true,
                customprefixicon: const Icon(
                  Icons.work_rounded,
                  color: COLOR_PRIMARY_LIGHT,
                ),
                validationfunction: (value) =>
                    textvalidator(value, message: "Profession is required."),
              ),
              SizedBox(height: hp(2, context)),
              CustomTextFormField(
                textCapitalization: TextCapitalization.words,
                labelText: "Company",
                textInputType: TextInputType.text,
                textEditingController: companyController,
                texteditinghinttext: 'Company',
                customobscuretext: true,
                customprefixicon: const Icon(
                  Icons.apartment_sharp,
                  color: COLOR_PRIMARY_LIGHT,
                ),
                validationfunction: (value) =>
                    textvalidator(value, message: "Company name is required."),
              ),
              SizedBox(height: hp(2, context)),
              PhoneFieldWidget(
                invalidNumberMessage: "Phone Number is required.",
                controller: numbercontroller,
                initialCountryCode: Countryshortcode,
                onChanged: (phone) {
                  log(phone.completeNumber);
                },
                onCountryChanged: (phone) {
                  countryCode = phone.dialCode;
                },
              ),
              SizedBox(height: hp(2, context)),
              CustomTextFormField(
                textCapitalization: TextCapitalization.none,
                labelText: "Email",
                textInputType: TextInputType.emailAddress,
                textEditingController: emailcontroller,
                texteditinghinttext: 'Email',
                customprefixicon: const Icon(
                  Icons.email,
                  color: COLOR_PRIMARY_LIGHT,
                ),
                validationfunction: emailValidator,
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Addresstextfield(
                textEditingController: addresscontroller,
                itmClick: (Prediction prediction) {
                  addresscontroller.text = prediction.description!;
                  addresscontroller.selection = TextSelection.fromPosition(
                      TextPosition(offset: prediction.description!.length));
                },
              ),
              SizedBox(
                height: hp(2, context),
              ),
              (ismoreadddata)
                  ? MoreTextfieldscreen(
                      isUpdate: false,
                      websitecontroller: websitecontroller,
                      telegramcontroller: telegramcontroller,
                      facebookcontroller: facebookcontroller,
                      linkdinController: linkdinController,
                      whatsappcontroller: whatsappcontroller,
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: hp(2, context)),
              Text(
                "Select Theme",
                style: textMediumTextStyle.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(
                height: hp(1.5, context),
              ),
              // card theme set
              SizedBox(
                height: hp(10, context),
                width: wp(90, context),
                child: GridView.builder(
                  itemCount: imageList.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          selectedIndex = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: hp(1, context),
                        ),
                        padding: EdgeInsets.all(
                          wp(2, context),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedIndex == index
                                ? COLOR_PRIMARY_DARK
                                : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage(imageList[index]),
                          width: wp(50, context),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: hp(0, context),
                    crossAxisSpacing: wp(0, context),
                  ),
                ),
              ),
              SizedBox(
                height: hp(2, context),
              ),
              Text(
                "Select Color",
                style: textMediumTextStyle.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(
                height: hp(1.5, context),
              ),
              SizedBox(
                height: hp(25, context),
                width: wp(90, context),
                child: GridView.builder(
                  itemCount: colorList.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectcolor = true;
                          _selectcolor = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(wp(2, context)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectcolor == index
                                ? COLOR_PRIMARY_DARK
                                : COLOR_PRIMARY_LIGHT,
                            width: _selectcolor == index ? 3 : 2,
                          ),
                          color: colorList[index],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: hp(0, context),
                    crossAxisSpacing: wp(0, context),
                  ),
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectedIndex == true && selectcolor == true
                      ? Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                previewcard = _selectedIndex;
                                previewcolor = _selectcolor;
                              });
                              //preview card
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0)),
                                ),
                                builder: (BuildContext context) => PreviewCard(
                                    cardid: previewcard, colorid: previewcolor),
                              );
                            },
                            child: const Text(
                              "Preview Card ?",
                              style: TextStyle(
                                  color: COLOR_PRIMARY,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  selectedIndex == true && selectcolor == true
                      ? const Spacer()
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: (ismoreadddata)
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              setState(() {
                                ismoreadddata = true;
                              });
                            },
                            child: const Text(
                              "Add more item ?",
                              style: TextStyle(
                                  color: COLOR_PRIMARY,
                                  fontWeight: FontWeight.bold),
                            )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // address toast
  displayCustomToast() {
    Widget toast = CustomToast(
      color: Colors.red[800],
      child: const Text(
        "Address field can't be Empty",
        style: TextStyle(color: COLOR_WHITE),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
