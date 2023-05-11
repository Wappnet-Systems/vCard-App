import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/controllers/data_controllers.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/validator.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import 'package:vcard/widget/custom_textformfield_widget.dart';
import 'package:vcard/widget/icon_widget.dart';
import 'package:vcard/widget/upload_image_dialog.dart';

class Updatecardscreen extends StatefulWidget {
  final String? id;
  const Updatecardscreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<Updatecardscreen> createState() => _UpdatecardscreenState();
}

class _UpdatecardscreenState extends State<Updatecardscreen> {
  //text editing controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _whatsappcontroller = TextEditingController();
  final TextEditingController _telegramcontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _linkcontroller = TextEditingController();
  final TextEditingController _snapchatcontroller = TextEditingController();
  final TextEditingController _websitecontroller = TextEditingController();
  final TextEditingController _facebookcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _typecontroller = TextEditingController();

  FToast? fToast;
  int? i = 0;
  String? imageurl;
  List<Users> singleuser = [];
  File? imagepicker;
  final _formfield = GlobalKey<FormState>();
  String? updateImageUrl;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  dynamic result;
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
            user: e['user'],
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

  getCardIndex() async {
    _selectedIndex = await result;
    log("card index:$_selectedIndex");
  }

  Future<void> updateUser() async {
    log("Update - Image:$updateImageUrl");
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .doc(widget.id);
    String? imgurl;
    print(receivedLoanDataRef.id);
    if (imagepicker != null) {
      imgurl = await uploadImage(imagepicker!);
    }
    log("yess:$_selectedIndex");
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
      log("Failed to update user: $error");
    });
  }

  Future pickImage(ImageSource imageType) async {
    try {
      final pick = await ImagePicker().pickImage(source: imageType);
      setState(() {
        if (pick != null) {
          imagepicker = File(pick.path);
          log("Updatd Image:${imagepicker?.path}");
          uploadImage(imagepicker!);
        }
      });
    } catch (e) {}
  }

  String url = "";
  uploadImage(imagepicker) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(imagepicker);
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
      appBar: AppBarWidget(
        title: "Update Card",
        centerTitle: true,
        leadinWidget: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: COLOR_PRIMARY_DARK,
            size: 25,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              if (_formfield.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                await updateUser();
              }
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(wp(2, context)),
              margin: EdgeInsets.symmetric(
                horizontal: wp(2, context),
                vertical: hp(1, context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PRIMARY_COLOR,
              ),
              child: const Icon(
                Icons.save,
                color: COLOR_PRIMARY_DARK,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: wp(6, context),
          vertical: hp(3, context),
        ),
        physics: const BouncingScrollPhysics(),
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
                        border: Border.all(color: COLOR_PRIMARY_DARK, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(70),
                        ),
                        child: imageurl == null || imageurl == ""
                            ? Image.asset(
                                "assets/images/splash1.png",
                                width: wp(35, context),
                                height: hp(21, context),
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: "$imageurl",
                                width: wp(33, context),
                                height: hp(20, context),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: PRIMARY_COLOR,
                                  child: const Icon(
                                    Icons.image_rounded,
                                    color: WHITE_COLOR,
                                    size: 80,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: PRIMARY_COLOR,
                                  child: const Icon(
                                    Icons.image_rounded,
                                    color: WHITE_COLOR,
                                    size: 80,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: hp(0, context),
                      right: wp(0, context),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isphotoloading = true;
                          });
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
                            color: COLOR_PRIMARY_DARK,
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(3, context),
              ),
              CustomTextFormField(
                textInputType: TextInputType.emailAddress,
                textEditingController: _typecontroller,
                textInputAction: TextInputAction.next,
                texteditinghinttext: 'Card Type',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _nameController,
                textInputAction: TextInputAction.next,
                texteditinghinttext: 'Name',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _departmentController,
                textInputAction: TextInputAction.next,
                texteditinghinttext: 'Department',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.text,
                textEditingController: _companyController,
                textInputAction: TextInputAction.next,
                texteditinghinttext: 'Company',
                customobscuretext: true,
                validationfunction: textvalidator,
              ),
              CustomTextFormField(
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
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
