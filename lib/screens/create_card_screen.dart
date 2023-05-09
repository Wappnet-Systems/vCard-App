import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../utils/constants_color.dart';
import '../utils/validator.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/icon_widget.dart';
import '../widget/text_button_widget.dart';

class Createcardscreen extends StatefulWidget {
  @override
  State<Createcardscreen> createState() => _CreatecardscreenState();
}

class _CreatecardscreenState extends State<Createcardscreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _headlineController = TextEditingController();
  TextEditingController _whatsappcontroller = TextEditingController();
  TextEditingController _telegramcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _linkcontroller = TextEditingController();
  TextEditingController _websitecontroller = TextEditingController();
  TextEditingController _facebookcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();
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
    String? card;
    print(receivedLoanDataRef.id);
    if (Imagepicker != null) {
      imgurl = await uploadImage(Imagepicker!);
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
      'color': _selectcolor
    }).then((value) {
      Navigator.pop(context, true);
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
    } catch (e) {}
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: Customappbarwidget(
          title: "Create Card",
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  if (_formfield.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    addUser();
                  }
                },
                icon: Icon(Icons.save)),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_sharp))),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formfield,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("New Card"),
                  Divider(),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: ClipOval(
                            child: Imagepicker == null
                                ? Image.asset(
                                    "assets/images/splash1.png",
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    Imagepicker!,
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Positioned(
                          top: 140,
                          left: 133,
                          child: InkWell(
                            onTap: () {
                              imagepicker();
                            },
                            child: Icon(
                              Icons.flip_camera_ios,
                              size: 30,
                              color: BLUE_COLOR,
                            ),
                          )),
                    ],
                  ),
                  (isLoading) ? Custonloading() : SizedBox(height: 25),
                  CustomTextFormField(
                    inputFormatters: null,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _typecontroller,
                    texteditinghinttext: 'type',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  CustomTextFormField(
                    inputFormatters: null,
                    textInputType: TextInputType.text,
                    textEditingController: _nameController,
                    texteditinghinttext: 'Name',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  CustomTextFormField(
                    inputFormatters: null,
                    textInputType: TextInputType.text,
                    textEditingController: _departmentController,
                    texteditinghinttext: 'Department',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  CustomTextFormField(
                    inputFormatters: null,
                    textInputType: TextInputType.text,
                    textEditingController: _companyController,
                    texteditinghinttext: 'Company',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: Color(0xff000000)),
                    cursorColor: PRIMARY_COLOR,
                    controller: _headlineController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                      hintText: 'Headline',
                      hintStyle: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    InkWell(
                        onTap: () {
                          showimagelist();
                        },
                        child: Text("Select Card Theme ?",
                            style: TextStyle(color: PRIMARY_COLOR))),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          showcolorlist();
                        },
                        child: Text(
                          "Select Card Color ?",
                          style: TextStyle(color: PRIMARY_COLOR),
                        ))
                  ]),
                  SizedBox(height: 20),
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
        ),
      ),
    );
  }

  void imagepicker() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Container(
          color: WHITE_COLOR,
          height: 250,
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
                      color: PRIMARY_COLOR),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CAMERA",
                        style: TextStyle(color: WHITE_COLOR),
                      )),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Text("GALLERY",
                          style: TextStyle(color: WHITE_COLOR))),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text("CANCEL", style: TextStyle(color: WHITE_COLOR))),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              content: Container(
                height: hp(30, context),
                width: wp(50, context),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return ListView.builder(
                      itemCount: imageList.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
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
                                    ? PRIMARY_COLOR
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          title: Text('Pick a color'),
          content: Container(
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
                                  ? PRIMARY_COLOR
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
                color: PRIMARY_COLOR,
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
