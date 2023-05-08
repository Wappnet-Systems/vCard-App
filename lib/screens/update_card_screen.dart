import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/style.dart';
import '../controllers/data_controllers.dart';

import '../utils/responsive.dart';
import '../utils/validator.dart';
import '../widget/custom_loading_bar.dart';
import '../widget/custom_textformfield.dart';
import '../widget/icon.dart';

class Updatecardscreen extends StatefulWidget {
  String? id;
  Updatecardscreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<Updatecardscreen> createState() => _UpdatecardscreenState();
}

class _UpdatecardscreenState extends State<Updatecardscreen> {
  int? i = 0;
  String? imageurl;
  List<Users> singleuser = [];
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
  String? updateImageUrl;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
    getSingleUserData();
    super.initState();
  }

  Future<void> getSingleUserData() async {
    print("-----------------");
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .where('id', isEqualTo: widget.id)
        .get();

    final userData = snapshot.docs
        .map((e) => Users(
            name: e['Name'],
            department: e['Department'],
            compeny: e['Company'],
            headline: e['HeadLine'],
            whatsapp: e['WhatsApp'],
            telegram: e['Telegram'],
            website: e['Website'],
            link: e['Link'],
            facebook: e['Facebook'],
            email: e['Email'],
            phone: e['Phone'],
            address: e['Address'],
            id: e['id'],
            image: e['images'],
            type: e['type'],
            card: e['card']))
        .toList();

    setState(() {
      singleuser = userData;
      imageurl = singleuser.first.image!;
      _nameController.text = singleuser.first.name!;
      _typecontroller.text = singleuser.first.type!;
      _addresscontroller.text = singleuser.first.address!;
      _companyController.text = singleuser.first.compeny!;
      _departmentController.text = singleuser.first.department!;
      _emailcontroller.text = singleuser.first.email!;
      _facebookcontroller.text = singleuser.first.facebook!;
      _headlineController.text = singleuser.first.headline!;
      _linkcontroller.text = singleuser.first.link!;
      _numbercontroller.text = singleuser.first.phone!;
      _telegramcontroller.text = singleuser.first.telegram!;
      _websitecontroller.text = singleuser.first.website!;
      _whatsappcontroller.text = singleuser.first.whatsapp!;
      _selectedIndex = singleuser.first.card!;
    });
    updateImageUrl = singleuser.first.image;
    setState(() {});
    print("Image:${singleuser.first.image}");
  }

  Future<void> updateUser() async {
    print("Update - Image:$updateImageUrl");
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .doc(widget.id);
    String? imgurl;
    print(receivedLoanDataRef.id);
    if (Imagepicker != null) {
      imgurl = await uploadImage(Imagepicker!);
    }
    return receivedLoanDataRef.update({
      'Name': _nameController.text,
      'Department': _departmentController.text,
      'Company': _companyController.text,
      'HeadLine': _headlineController.text,
      'WhatsApp': _whatsappcontroller.text,
      'Telegram': _telegramcontroller.text,
      'Snapchat': _snapchatcontroller.text,
      'Website': _websitecontroller.text,
      'Link': _linkcontroller.text,
      'Facebook': _facebookcontroller.text,
      'Email': _emailcontroller.text,
      'Phone': _numbercontroller.text,
      'Address': _addresscontroller.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? updateImageUrl,
      'type': _typecontroller.text,
      'card': _selectedIndex
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Dashboardscreen(
                    index: 0,
                  ))));
    }).catchError((error) => print("Failed to update user: $error"));
  }

  File? Imagepicker;

  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker().pickImage(source: imageType);
      setState(() {
        if (pick != null) {
          Imagepicker = File(pick.path);
          log("Updatd Image:${Imagepicker?.path}");
          uploadImage(Imagepicker!);
        }
      });
    } catch (e) {}
  }

  String url = "";
  uploadImage(File Imagepicker) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(Imagepicker);
    url = await reference.getDownloadURL();
    log("url:$url");
    setState(() {
      imageurl = url;
    });

    log("imageurl:$imageurl");
    return imageurl;
  }

  final imageList = [
    "assets/cards/card1.jpg",
    'assets/cards/card2.jpg',
    "assets/cards/card3.jpg",
    "assets/cards/card4.jpg"
  ];

  int? _selectedIndex;
  bool isLoading = false;
  bool isphotoloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Card"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                if (_formfield.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  updateUser();
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
                  Text("Edit Card"),
                  Divider(),
                  SizedBox(height: 20),
                  Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: PRIMARY_COLOR, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: imageurl == null || imageurl == ""
                          ? ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Image(
                                image: AssetImage("assets/images/splash1.png"),
                                height: 170,
                                width: 170,
                              ),
                            )
                          : ClipOval(
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Custonloading(),
                                imageUrl: "$imageurl",

                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                                // frameBuilder: (context, child, frame,
                                //     wasSynchronouslyLoaded) {
                                //   return child;
                                // },
                                // errorBuilder: (context, error, stackTrace) {
                                //   return Image(
                                //     image:
                                //         AssetImage("assets/images/splash1.png"),
                                //     height: 170,
                                //     width: 170,
                                //   );
                                // },
                                // loadingBuilder:
                                //     (context, child, loadingProgress) {
                                //   if (loadingProgress == null) {
                                //     return child;
                                //   } else {
                                //     return Image(
                                //       image: AssetImage(
                                //           "assets/images/splash1.png"),
                                //       height: 170,
                                //       width: 170,
                                //     );
                                //   }
                                // },
                              ),
                            ),
                    ),
                    Positioned(
                        top: 120,
                        left: 150,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isphotoloading = true;
                            });
                            imagepicker();
                          },
                          child: Icon(
                            Icons.flip_camera_ios,
                            size: 30,
                            color: BLUE_COLOR,
                          ),
                        )),
                  ]),
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
                        child: Text("Select Card Theme")),
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
          title: Text("Card's"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: hp(30, context),
              child: ListView.builder(
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
                        height: hp(2, context),
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
                  }),
            );
          }),
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
