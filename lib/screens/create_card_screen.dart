import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import '../utils/constants_color.dart';
import '../utils/validator.dart';
import '../widget/custom_textformfield.dart';
import '../widget/icon.dart';

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
  TextEditingController _snapchatcontroller = TextEditingController();
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
    print(receivedLoanDataRef.id);
    final imgurl = await uploadImage(Imagepicker!);
    return receivedLoanDataRef
        .set({
          'Name': _nameController.text,
          'Department': _departmentController.text,
          'Company': _companyController.text,
          'HeadLine': _headlineController.text,
          'WhatsApp': _whatsappcontroller.text,
          'Telegram': _telegramcontroller.text,
          'Snapchat': _snapchatcontroller.text,
          'Website': _snapchatcontroller.text,
          'Link': _linkcontroller.text,
          'Facebook': _facebookcontroller.text,
          'Email': _emailcontroller.text,
          'Phone': _numbercontroller.text,
          'Address': _addresscontroller.text,
          'id': receivedLoanDataRef.id,
          'images': imgurl,
          'type': _typecontroller.text,
          'user': FirebaseAuth.instance.currentUser?.uid,
        })
        .then((value) => log("User Added"))
        .catchError((error) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Card"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                setState(() {
                  if (_formfield.currentState!.validate()) {
                    addUser().then((value) {
                      // Future.delayed(Duration(seconds: 5), () {
                      Navigator.pop(context, true);
                      // });
                    });
                    displayCustomToast();
                  }
                });
              },
              icon: Icon(Icons.save)),
        ],
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: PRIMARY_COLOR, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        imagepicker();
                      },
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
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 50),
                  Iconwidget(
                    snapchatcontroller: _snapchatcontroller,
                    websitecontroller: _websitecontroller,
                    telegramcontroller: _telegramcontroller,
                    numbercontroller: _numbercontroller,
                    emailcontroller: _emailcontroller,
                    addresscontroller: _addresscontroller,
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
