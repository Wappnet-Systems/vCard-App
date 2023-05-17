import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../utils/constants_color.dart';
import '../utils/formatters.dart';
import '../utils/validator.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_textformfield_widget.dart';
import 'more_textfield_screen.dart';
import '../widget/text_button_widget.dart';

class Createcardscreen extends StatefulWidget {
  const Createcardscreen({super.key});

  @override
  State<Createcardscreen> createState() => _CreatecardscreenState();
}

class _CreatecardscreenState extends State<Createcardscreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _whatsappcontroller = TextEditingController();
  final TextEditingController _telegramcontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _websitecontroller = TextEditingController();
  final TextEditingController _facebookcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _typecontroller = TextEditingController();

  FToast? fToast;
  final _formfield = GlobalKey<FormState>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

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
      'Name': _nameController.text,
      'Department': _departmentController.text,
      'Company': _companyController.text,
      'WhatsApp': _whatsappcontroller.text,
      'Telegram': _telegramcontroller.text,
      'Website': _websitecontroller.text,
      'Link': _linkController.text,
      'Facebook': _facebookcontroller.text,
      'Email': _emailcontroller.text,
      'Phone': _numbercontroller.text,
      'Address': _addresscontroller.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? "",
      'type': _typecontroller.text,
      'user': FirebaseAuth.instance.currentUser?.uid,
      'card': _selectedIndex ?? 4,
      'color': _selectcolor
    }).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => Dashboardscreen(index: 0))));
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  File? Imagepicker;

  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker().pickImage(source: imageType);
      setState(() {
        if (pick != null) {
          Imagepicker = File(pick.path);
        }
      });
    } catch (e) {
      Error();
    }
  }

  Future uploadImage(File Imagepicker) async {
    String url;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(Imagepicker);
    url = await reference.getDownloadURL();
    return url;
  }

  final imageList = [
    "assets/cards/card1.jpg",
    'assets/cards/card2.jpg',
    "assets/cards/card3.jpg",
    "assets/cards/card4.jpg"
  ];

  int? _selectcolor;
  int? _selectedIndex;
  bool isLoading = false;
  bool ismoreadddata = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: Customappbarwidget(
          title: "Create Card",
          actions: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
              child: IconButton(
                  onPressed: () async {
                    if (_formfield.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      addUser();
                    }
                  },
                  icon: const Icon(
                    Icons.save,
                    color: BLACK_COLOR,
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
                  color: BLACK_COLOR,
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
                            color: BLUE_COLOR, width: wp(0.5, context)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                          child: Imagepicker == null
                              ? Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(35, context),
                                  height: hp(18, context),
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  Imagepicker!,
                                  width: wp(35, context),
                                  height: hp(18, context),
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Positioned(
                        top: 90,
                        left: 100,
                        child: InkWell(
                          onTap: () {
                            imagepicker();
                          },
                          child: const Icon(
                            Icons.flip_camera_ios,
                            size: 30,
                            color: BLUE_COLOR,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: hp(3, context)),
                CustomTextFormField(
                  labelText: "Type",
                  inputFormatters: null,
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _typecontroller,
                  texteditinghinttext: 'Card type',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: null,
                  validationfunction: textvalidator,
                ),
                SizedBox(height: hp(2, context)),
                CustomTextFormField(
                  labelText: "Name",
                  inputFormatters: null,
                  textInputType: TextInputType.text,
                  textEditingController: _nameController,
                  texteditinghinttext: 'Name',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: null,
                  validationfunction: textvalidator,
                ),
                SizedBox(height: hp(2, context)),
                CustomTextFormField(
                  labelText: "Profession",
                  inputFormatters: null,
                  textInputType: TextInputType.text,
                  textEditingController: _departmentController,
                  texteditinghinttext: 'Profession',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: null,
                  validationfunction: textvalidator,
                ),
                SizedBox(height: hp(2, context)),
                CustomTextFormField(
                  labelText: "Company",
                  inputFormatters: null,
                  textInputType: TextInputType.text,
                  textEditingController: _companyController,
                  texteditinghinttext: 'Company',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: null,
                  validationfunction: textvalidator,
                ),
                SizedBox(height: hp(3, context)),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          showimagelist();
                        },
                        child: Container(
                          width: wp(40, context),
                          height: hp(7, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: GRAY)),
                          child: const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Select Theme",
                                  style: TextStyle(color: BLUE_COLOR)),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp)
                          ]),
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showcolorlist();
                        },
                        child: Container(
                          width: wp(40, context),
                          height: hp(7, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: GRAY)),
                          child: const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Select Color",
                                style: TextStyle(color: BLUE_COLOR),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp)
                          ]),
                        ))
                  ]),
                ),
                SizedBox(height: hp(3, context)),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GooglePlaceAutoCompleteTextField(
                      textEditingController: _addresscontroller,
                      googleAPIKey: YOUR_GOOGLE_API_KEY,
                      inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Address",
                        labelStyle: TextStyle(color: BLACK_COLOR, fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: BLACK_COLOR)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                        hintText: "Address",
                        hintStyle: TextStyle(
                          color: GRAY,
                          fontSize: 10,
                        ),
                        prefixIcon: Icon(Icons.location_on, color: GRAY),
                        suffixIcon: null,
                      ),
                      debounceTime: 800,
                      countries: const ["in", "fr"],
                      isLatLngRequired: true,
                      getPlaceDetailWithLatLng: (Prediction prediction) {},
                      itmClick: (Prediction prediction) {
                        _addresscontroller.text = prediction.description!;

                        _addresscontroller.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: prediction.description!.length));
                      }),
                ),
                SizedBox(height: hp(2, context)),
                CustomTextFormField(
                  labelText: "Phone",
                  inputFormatters: [maskFormatter],
                  textInputType: TextInputType.phone,
                  textEditingController: _numbercontroller,
                  texteditinghinttext: 'Phone',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: const Icon(
                    Icons.phone,
                    color: GRAY,
                  ),
                  validationfunction: numbervalidator,
                ),
                SizedBox(height: hp(2, context)),
                CustomTextFormField(
                  labelText: "Email",
                  inputFormatters: null,
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailcontroller,
                  texteditinghinttext: 'Email',
                  customobscuretext: true,
                  customsuffixIcon: null,
                  customprefixicon: const Icon(
                    Icons.email,
                    color: GRAY,
                  ),
                  validationfunction: emailValidator,
                ),
                SizedBox(height: hp(3, context)),
                (ismoreadddata)
                    ? MoreTextfieldscreen(
                        websitecontroller: _websitecontroller,
                        telegramcontroller: _telegramcontroller,
                        facebookcontroller: _facebookcontroller,
                        linkController: _linkController,
                        whatsappcontroller: _whatsappcontroller,
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            ismoreadddata = true;
                          });
                        },
                        child: const Text(
                          "Add more item ?",
                          style: TextStyle(
                              color: BOTTOM, fontWeight: FontWeight.bold),
                        )),
                SizedBox(height: hp(4, context)),
              ],
            ),
            Positioned(
              top: 220,
              left: 140,
              child:
                  (isLoading) ? const Custonloading() : const SizedBox.shrink(),
            )
          ]),
        ),
      ),
    );
  }

  void imagepicker() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        content: Container(
          color: WHITE_COLOR,
          height: hp(33, context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Pic Image From",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: BLUE_COLOR),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: hp(2, context),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: BLUE_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "CAMERA",
                        style: TextStyle(color: WHITE_COLOR),
                      )),
                ),
                SizedBox(height: hp(2, context)),
                Container(
                  decoration: BoxDecoration(
                    color: BLUE_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: const Text("GALLERY",
                          style: TextStyle(color: WHITE_COLOR))),
                ),
                SizedBox(height: hp(2, context)),
                Container(
                  decoration: BoxDecoration(
                    color: BLUE_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("CANCEL",
                          style: TextStyle(color: WHITE_COLOR))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              content: SizedBox(
                height: hp(30, context),
                width: wp(50, context),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return ListView.builder(
                      itemCount: imageList.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: hp(10, context),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedIndex == index
                                    ? BLUE_COLOR
                                    : WHITE_COLOR,
                                width: 4,
                              ),
                            ),
                            margin: EdgeInsets.only(
                              right: wp(4, context),
                            ),
                            child: Image(
                              image: AssetImage(imageList[index]),
                              height: hp(20, context),
                            ),
                          ),
                        );
                      });
                }),
              ));
        });
  }

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
          title: const Text('Pick a color'),
          content: SizedBox(
            height: hp(30, context),
            width: wp(50, context),
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
                        });
                      },
                      child: Container(
                        width: wp(5, context),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectcolor == index
                                  ? BLUE_COLOR
                                  : WHITE_COLOR,
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
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButtomWidget(
                color: BLUE_COLOR,
                fontSize: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'ok',
              ),
            ])
          ],
        );
      },
    );
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: BLUE_COLOR,
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
