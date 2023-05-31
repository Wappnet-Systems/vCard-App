// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/preview_card_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import 'package:vcard/widget/text_widget.dart';
import 'package:vcard/widget/upload_image.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validator.dart';
import '../widget/address_textfield.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/custom_toast.dart';
import 'more_textfield_screen.dart';
import '../widget/text_button_widget.dart';

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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => const Dashboardscreen(index: 0))));
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  File? Imagepicker;
  // Immage get
  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker().pickImage(source: imageType);
      setState(() {
        if (pick != null) {
          Imagepicker = File(pick.path);
          setState(() {
            isprofile = false;
          });
        }
      });
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
      backgroundColor: whiteColor,
      appBar: Customappbarwidget(
          title: "Create Card",
          actions: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
              child: IconButton(
                  onPressed: () async {
                    if (_formfield.currentState!.validate() &&
                        addresscontroller.text != "") {
                      setState(() {
                        isLoading = true;
                      });
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
                    color: blackColor,
                  )),
            ),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: blackColor,
                ),
              ))),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Stack(children: [
            Column(
              children: [
                SizedBox(height: hp(2, context)),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: blueColor, width: wp(0.5, context)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      // profile image add
                      child: ClipOval(
                          child: Imagepicker == null
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(30, context),
                                  height: hp(14, context),
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  Imagepicker!,
                                  width: wp(30, context),
                                  height: hp(14, context),
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Positioned(
                        top: 80,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => Uploadimage(onTapCamera: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    }, onTapGallery: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: blueColor, width: wp(0.5, context)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: whiteColor),
                            child: const Icon(
                              Icons.camera,
                              size: 20,
                              color: blueColor,
                            ),
                          ),
                        )),
                  ],
                ),
                isprofile
                    ? Textwidget(
                        textAlign: TextAlign.center,
                        text: "Profile Image cant't be Empty",
                        selectionColor: Colors.red.shade800,
                        fontSize: 12,
                      )
                    : const SizedBox.shrink(),
                //card Type
                SizedBox(height: hp(3, context)),
                CustomTextFormField(
                  textCapitalization: TextCapitalization.words,
                  labelText: "Type",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: typecontroller,
                  texteditinghinttext: 'Card type',
                  customobscuretext: true,
                  customprefixicon: const Icon(
                    Icons.badge_outlined,
                    color: grayColor,
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
                    color: grayColor,
                  ),
                  validationfunction: textvalidator,
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
                    color: grayColor,
                  ),
                  validationfunction: textvalidator,
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
                    color: grayColor,
                  ),
                  validationfunction: textvalidator,
                ),
                SizedBox(height: hp(2, context)),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: IntlPhoneField(
                    invalidNumberMessage: "This field can't be empty",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: blueColor,
                    ),
                    disableLengthCheck: false,
                    cursorColor: blueColor,
                    controller: numbercontroller,
                    decoration: const InputDecoration(
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      hintStyle: TextStyle(
                        color: grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: Countryshortcode,
                    onChanged: (phone) {
                      log(phone.completeNumber);
                    },
                    onCountryChanged: (phone) {
                      countryCode = phone.dialCode;
                    },
                  ),
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
                    color: grayColor,
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
                          color: grayColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                websitecontroller.text != ""
                    ? SizedBox(height: hp(2, context))
                    : const SizedBox.shrink(),
                whatsappcontroller.text != ""
                    ? CustomTextFormField(
                        textCapitalization: TextCapitalization.none,
                        labelText: "WhatsApp",
                        inputFormatters: [maskFormatter],
                        textInputType: TextInputType.phone,
                        textEditingController: whatsappcontroller,
                        texteditinghinttext: 'WhatsApp',
                        customobscuretext: true,
                        customprefixicon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: grayColor,
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
                          color: grayColor,
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
                          color: grayColor,
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
                        textInputType: TextInputType.phone,
                        textEditingController: telegramcontroller,
                        texteditinghinttext: 'Telegram',
                        customobscuretext: true,
                        customprefixicon: const Icon(
                          Icons.telegram,
                          color: grayColor,
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
                    }),
                SizedBox(height: hp(1, context)),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: _selectedIndex != null
                        ? SizedBox(
                            height: hp(10, context),
                            width: wp(30, context),
                            child: Image.asset(imageList[_selectedIndex ?? 0]))
                        : const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: _selectcolor != null
                        ? Container(
                            width: wp(16, context),
                            height: hp(8, context),
                            decoration: BoxDecoration(
                                color: colorList[_selectcolor ?? 0],
                                borderRadius: BorderRadius.circular(100)),
                          )
                        : const SizedBox.shrink(),
                  ),
                ]),
                SizedBox(height: hp(1, context)),
                // card theme set
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            showimagelist();
                          });
                        },
                        child: Container(
                          width: wp(40, context),
                          height: hp(7, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: grayColor)),
                          child: const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Select Theme",
                                  style: TextStyle(color: blueColor)),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp)
                          ]),
                        )),
                    const Spacer(),
                    // card color set
                    InkWell(
                        onTap: () {
                          setState(() {
                            showcolorlist();
                          });
                        },
                        child: Container(
                          width: wp(40, context),
                          height: hp(7, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: grayColor)),
                          child: const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Select Color",
                                style: TextStyle(color: blueColor),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp)
                          ]),
                        ))
                  ]),
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
                                    builder: (BuildContext context) =>
                                        PreviewCard(
                                            cardid: previewcard,
                                            colorid: previewcolor));
                              },
                              child: const Text(
                                "Preview Card ?",
                                style: TextStyle(
                                    color: bottomColor,
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
                                    color: bottomColor,
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
            Positioned(
              top: 220,
              left: 160,
              child:
                  (isLoading) ? const Custonloading() : const SizedBox.shrink(),
            )
          ]),
        ),
      ),
    );
  }

  //select card
  showimagelist() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            title: const Text("Card's"),
            content: SizedBox(
              height: hp(35, context),
              width: wp(50, context),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return GridView.builder(
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedIndex == index
                                  ? blueColor
                                  : whiteColor,
                              width: 4,
                            ),
                          ),
                          child: Image(
                            image: AssetImage(imageList[index]),
                            height: hp(15, context),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20));
              }),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButtomWidget(
                    color: blueColor,
                    fontSize: 20,
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                    title: 'ok',
                  ),
                ]),
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
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          title: const Text('Colors'),
          content: SizedBox(
            height: hp(35, context),
            width: wp(55, context),
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: colorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectcolor = index;
                          selectcolor = true;
                        });
                      },
                      child: Container(
                        width: wp(5, context),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectcolor == index
                                  ? blueColor
                                  : bluegrayColor,
                              width: 4,
                            ),
                            color: colorList[index],
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10),
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButtomWidget(
                  color: blueColor,
                  fontSize: 20,
                  onPressed: () {
                    setState(() {});
                    Navigator.pop(context);
                  },
                  title: 'ok',
                ),
              ]),
            )
          ],
        );
      },
    );
  }

  // address toast
  displayCustomToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Address field can't be Empty",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
