// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/preview_card_screen.dart';
import 'package:vcard/utils/helper.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import 'package:vcard/widget/phone_field_widget.dart';
import 'package:vcard/widget/upload_image.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validator.dart';
import '../widget/address_textfield.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/custom_toast.dart';
import 'more_textfield_screen.dart';
import '../widget/text_button_widget.dart';
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
            padding:
                const EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
            child: IconButton(
                onPressed: () async {
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
                icon: const Icon(
                  Icons.save,
                  color: COLOR_PRIMARY_DARK,
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
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: COLOR_WHITE, width: wp(0.5, context)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    // profile image add
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: Imagepicker == null
                          ? Image.asset(
                              "assets/images/splash1.png",
                              width: wp(31, context),
                              height: hp(15, context),
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              Imagepicker!,
                              width: wp(32, context),
                              height: hp(15, context),
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  Positioned(
                    top: hp(11, context),
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
                          border: Border.all(
                            color: COLOR_WHITE,
                            width: wp(0.5, context),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
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
              SizedBox(
                height: hp(0.5, context),
              ),
              isprofile
                  ? Text(
                      "Profile Image cant't be Empty",
                      style: smallTextStyle.copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
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
              SizedBox(height: hp(2, context)),
              websitecontroller.text != ""
                  ? CustomTextFormField(
                      textCapitalization: TextCapitalization.none,
                      labelText: "Website",
                      inputFormatters: null,
                      textInputType: TextInputType.text,
                      textEditingController: websitecontroller,
                      texteditinghinttext: 'Website',
                      customobscuretext: true,
                      customsuffixIcon: null,
                      customprefixicon: const Icon(
                        Icons.web,
                        color: COLOR_PRIMARY_LIGHT,
                      ),
                    )
                  : const SizedBox.shrink(),
              websitecontroller.text != ""
                  ? SizedBox(
                      height: hp(2, context),
                    )
                  : const SizedBox.shrink(),
              whatsappcontroller.text != ""
                  ? CustomTextFormField(
                      textCapitalization: TextCapitalization.none,
                      labelText: "WhatsApp",
                      inputFormatters: [maskFormatter],
                      textInputType: TextInputType.number,
                      textEditingController: whatsappcontroller,
                      texteditinghinttext: 'WhatsApp',
                      customobscuretext: true,
                      customprefixicon: const Icon(
                        FontAwesomeIcons.whatsapp,
                        color: COLOR_PRIMARY_LIGHT,
                      ),
                    )
                  : const SizedBox.shrink(),
              whatsappcontroller.text != ""
                  ? SizedBox(height: hp(2, context))
                  : const SizedBox.shrink(),
              linkdinController.text != ""
                  ? CustomTextFormField(
                      textCapitalization: TextCapitalization.none,
                      labelText: "Linkdin",
                      textInputType: TextInputType.text,
                      textEditingController: linkdinController,
                      texteditinghinttext: 'Linkdin',
                      customobscuretext: true,
                      customprefixicon: const Icon(
                        Icons.link,
                        color: COLOR_PRIMARY_LIGHT,
                      ),
                    )
                  : const SizedBox.shrink(),
              linkdinController.text != ""
                  ? SizedBox(height: hp(2, context))
                  : const SizedBox.shrink(),
              facebookcontroller.text != ""
                  ? CustomTextFormField(
                      textCapitalization: TextCapitalization.none,
                      labelText: "Facebook",
                      textInputType: TextInputType.text,
                      textEditingController: facebookcontroller,
                      texteditinghinttext: 'Facebook',
                      customobscuretext: true,
                      customprefixicon: const Icon(
                        Icons.facebook,
                        color: COLOR_PRIMARY_LIGHT,
                      ),
                    )
                  : const SizedBox.shrink(),
              facebookcontroller.text != ""
                  ? SizedBox(height: hp(2, context))
                  : const SizedBox.shrink(),
              telegramcontroller.text != ""
                  ? CustomTextFormField(
                      textCapitalization: TextCapitalization.none,
                      labelText: "Telegram",
                      inputFormatters: [maskFormatter],
                      textInputType: TextInputType.number,
                      textEditingController: telegramcontroller,
                      texteditinghinttext: 'Telegram',
                      customobscuretext: true,
                      customprefixicon: const Icon(
                        Icons.telegram,
                        color: COLOR_PRIMARY_LIGHT,
                      ),
                    )
                  : const SizedBox.shrink(),
              telegramcontroller.text != ""
                  ? SizedBox(height: hp(2, context))
                  : const SizedBox.shrink(),

              Addresstextfield(
                textEditingController: addresscontroller,
                itmClick: (Prediction prediction) {
                  addresscontroller.text = prediction.description!;
                  addresscontroller.selection = TextSelection.fromPosition(
                      TextPosition(offset: prediction.description!.length));
                },
              ),
              SizedBox(height: hp(1, context)),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: wp(8, context),
                  ),
                  child: _selectedIndex != null
                      ? SizedBox(
                          height: hp(10, context),
                          width: wp(30, context),
                          child: Image.asset(imageList[_selectedIndex ?? 0]))
                      : const SizedBox.shrink(),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: wp(15, context),
                  ),
                  child: _selectcolor != null
                      ? CircleAvatar(
                          radius: 35,
                          backgroundColor: colorList[_selectcolor ?? 0],
                        )
                      : const SizedBox.shrink(),
                ),
              ]),
              SizedBox(height: hp(1, context)),
              // card theme set
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        showimagelist();
                      });
                    },
                    child: Container(
                      width: wp(40, context),
                      height: hp(7, context),
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(3, context),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: COLOR_PRIMARY_LIGHT),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Theme", style: textSmallTextStyle),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showcolorlist();
                      });
                    },
                    child: Container(
                      width: wp(40, context),
                      height: hp(7, context),
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(3, context),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: COLOR_PRIMARY_LIGHT),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Color",
                            style: textSmallTextStyle,
                          ),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: hp(2, context)),
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
              SizedBox(height: hp(4, context)),
              (ismoreadddata)
                  ? MoreTextfieldscreen(
                      websitecontroller: websitecontroller,
                      telegramcontroller: telegramcontroller,
                      facebookcontroller: facebookcontroller,
                      linkdinController: linkdinController,
                      whatsappcontroller: whatsappcontroller,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  //select card
  showimagelist() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomAlartDialog(
            title: Text(
              "Card's",
              style: smalltitleTextStyle,
              textAlign: TextAlign.left,
            ),
            onPressedNo: () {},
            onPressedYes: () {},
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: hp(35, context),
                width: wp(80, context),
                child: GridView.builder(
                  itemCount: imageList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
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
                          height: hp(15, context),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: hp(1, context),
                    crossAxisSpacing: wp(2, context),
                  ),
                ),
              );
            }),
            actions: [
              TextButtomWidget(
                width: wp(30, context),
                color: COLOR_PRIMARY_DARK,
                height: hp(6, context),
                fontSize: 16,
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                title: 'OK',
              )
            ],
          );
        });
  }

  // select coler
  showcolorlist() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlartDialog(
            title: Text(
              "Colors",
              style: smalltitleTextStyle,
              textAlign: TextAlign.left,
            ),
            onPressedNo: () {},
            onPressedYes: () {},
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: hp(35, context),
                width: wp(80, context),
                child: GridView.builder(
                  itemCount: colorList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectcolor == index
                                ? COLOR_PRIMARY_DARK
                                : COLOR_PRIMARY,
                            width: 3,
                          ),
                          color: colorList[index],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: hp(1, context),
                    crossAxisSpacing: wp(2, context),
                  ),
                ),
              );
            }),
            actions: [
              TextButtomWidget(
                width: wp(30, context),
                color: COLOR_PRIMARY_DARK,
                height: hp(6, context),
                fontSize: 16,
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                title: 'OK',
              )
            ],
          );
        });
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
