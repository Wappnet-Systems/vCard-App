import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import '../utils/constants_color.dart';
import '../utils/validator.dart';
import '../widget/custom_textformfield.dart';
import '../widget/icon.dart';
import 'package:image_picker/image_picker.dart';

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
  FToast? fToast;
  final _formfield = GlobalKey<FormState>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    _numbercontroller.text = "+91";
    _whatsappcontroller.text = "+91";
    _facebookcontroller.text = "https://www.facebook.com/";
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  var receivedLoanDataRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("Carddata")
      .doc();

  Future<void> addUser() {
    print(receivedLoanDataRef.id);
    // Call the user's CollectionReference to add a new user
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
          'id': receivedLoanDataRef.id
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  File? pickedImage;
  // var _userImageFile;
  // void _pickedImage(File image) {
  //   _userImageFile = image;
  //   print("Image got $_userImageFile");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Card"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                if (_formfield.currentState!.validate()) {
                  print("text:${_whatsappcontroller.text}");
                  print("text:${_telegramcontroller.text}");
                  print("text:${_addresscontroller.text}");
                  print("text:${_linkcontroller.text}");
                  print("text:${_snapchatcontroller.text}");
                  print("text:${_facebookcontroller.text}");
                  print("text:${_emailcontroller.text}");
                  print("text:${_numbercontroller.text}");
                  print("text:${_websitecontroller.text}");
                  print(_companyController.text);
                  addUser();
                  displayCustomToast();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboardscreen()));
                }
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
                        imagePickerOption();
                      },
                      child: ClipOval(
                        child: pickedImage != null
                            ? Image.file(
                                pickedImage!,
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/splash.png",
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 230),
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PRIMARY_COLOR,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.add),
                            Text("Logo"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _nameController,
                    texteditinghinttext: 'Name',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _departmentController,
                    texteditinghinttext: 'Department',
                    customobscuretext: true,
                    custominkwell: null,
                    customprefixicon: null,
                    validationfunction: textvalidator,
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
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

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
        // widget.getImageValue(pickedImage!);
      });

      // Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
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
                          exit(0);
                        },
                        child: Text("CANCEL",
                            style: TextStyle(color: WHITE_COLOR))),
                  ),
                ],
              ),
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

  void bottomSheet(SingleChildScrollView singleChildScrollView) {}
}
