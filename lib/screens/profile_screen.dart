import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/utils/validator.dart';
import '../model/data_controllers.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_toast.dart';
import '../widget/upload_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Users> Profileuser = [];
  // Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  //from key
  final _formfield = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  String? imgeurl;
  File? imagePicker;
  String? images;
  String? currentUserId;
  List<Users> profileData = [];
  FToast? fToast;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    getSingleUserData();
    fToast = FToast();
    fToast?.init(context);
    super.initState();
  }

  // card data set database
  var receivedLoanDataRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("Profile")
      .doc();

  Future<void> addUser() async {
    String? imgurl;
    if (imagePicker != null) {
      imgurl = await uploadImage(imagePicker!);
    }

    return receivedLoanDataRef.set({
      'profilename': nameController.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? "",
      'dob': dobController.text,
      'profileemail': emailController.text,
      'user': FirebaseAuth.instance.currentUser?.uid,
    }).then((value) {
      imgurl = null;
      getSingleUserData();
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

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
            imagePicker = file;
            uploadImage(imagePicker);
          });
        }
      }
    } catch (e) {
      Error();
    }
  }

  // upload image database
  String url = "";
  Future uploadImage(imagepicker) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('users$imgId');
    await reference.putFile(imagepicker);
    url = await reference.getDownloadURL();

    setState(() {
      imgeurl = url;
    });

    return imgeurl;
  }

  Future<void> getSingleUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile")
        .get();

    for (var element in snapshot.docs) {
      profileData.add(
        Users(
            user: element.data()['user'] ?? "",
            name: element.data()['Name'] ?? "",
            department: element.data()['Department'] ?? "",
            compeny: element.data()['Company'] ?? "",
            whatsapp: element.data()['WhatsApp'] ?? "",
            telegram: element.data()['Telegram'] ?? "",
            website: element.data()['Website'] ?? "",
            linkdin: element.data()['Linkdin'] ?? "",
            facebook: element.data()['Facebook'] ?? "",
            email: element.data()['Email'] ?? "",
            phone: element.data()['Phone'] ?? "",
            country: element.data()['country'] ?? "",
            address: element.data()['Address'] ?? "",
            id: element.data()['id'] ?? "",
            type: element.data()['type'] ?? "",
            images: element.data()['images'] ?? "",
            image: element.data()['images'] ?? "",
            card: element.data()['card'] ?? 0,
            color: element.data()['color'] ?? 0,
            profilename: element.data()['profilename'] ?? "",
            dob: element.data()['dob'] ?? "",
            profileemail: element.data()['profileemail'] ?? ""),
      );
    }

    setState(() {
      images = profileData.first.images ?? "";
      nameController.text = profileData.first.profilename ?? "";
      dobController.text = profileData.first.dob ?? "";
      emailController.text = profileData.first.profileemail ?? "";
      currentUserId = profileData.first.id;
    });
  }

  Future<void> updateUser() async {
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile")
        .doc(currentUserId);

    try {
      return receivedLoanDataRef.update({
        'profilename': nameController.text,
        'id': receivedLoanDataRef.id,
        'images': imgeurl ?? images,
        'dob': dobController.text,
        'profileemail': emailController.text,
        'user': FirebaseAuth.instance.currentUser?.uid,
      }).then((value) {
        imgeurl == null;
        getSingleUserData();
      }).catchError((error) {});
    } catch (e) {
      log("ERROR:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user != null && user!.phoneNumber != null) {
      numberController.text = user!.phoneNumber ?? "";
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.3,
          title: const Text("Profile", style: TextStyle(color: blackColor)),
          backgroundColor: whiteColor,
        ),
        body: images != null
            ? SingleChildScrollView(
                child: Form(
                    key: _formfield,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(children: [
                          SizedBox(height: hp(10, context)),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: blueColor,
                                      width: wp(0.5, context)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                // profile image add
                                child: ClipOval(
                                    child: imagePicker == null
                                        ? CachedNetworkImage(
                                            width: wp(30, context),
                                            height: hp(14, context),
                                            fit: BoxFit.fill,
                                            imageUrl: "$images",
                                            placeholder: (context, url) {
                                              return Container();
                                            },
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                "assets/images/splash1.png",
                                                width: wp(30, context),
                                                height: hp(14, context),
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          )
                                        : Image.file(
                                            imagePicker!,
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
                                          builder: (ctx) =>
                                              Uploadimage(onTapCamera: () {
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
                                              color: blueColor,
                                              width: wp(0.5, context)),
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

                          //card Type
                          SizedBox(height: hp(3, context)),
                          TextFormField(
                            validator: textvalidator,
                            textCapitalization: TextCapitalization.words,
                            cursorColor: grayColor,
                            controller: nameController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blackColor)),
                              label: Text("Name"),
                              labelStyle:
                                  TextStyle(fontSize: 10, color: grayColor),
                              hintStyle:
                                  TextStyle(color: grayColor, fontSize: 10),
                              hintText: "Enter your name",
                            ),
                          ),
                          SizedBox(height: hp(2, context)),
                          TextFormField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            cursorColor: grayColor,
                            controller: numberController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: grayColor)),
                              label: Text("number"),
                              labelStyle:
                                  TextStyle(fontSize: 10, color: grayColor),
                              hintStyle:
                                  TextStyle(color: grayColor, fontSize: 10),
                              hintText: "Enter your Number",
                            ),
                          ),
                          TextFormField(
                            validator: emailValidator,
                            textCapitalization: TextCapitalization.words,
                            cursorColor: grayColor,
                            controller: emailController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blackColor)),
                              label: Text("Email"),
                              labelStyle:
                                  TextStyle(fontSize: 10, color: grayColor),
                              hintStyle:
                                  TextStyle(color: grayColor, fontSize: 10),
                              hintText: "Enter your Email",
                            ),
                          ),
                          SizedBox(height: hp(2, context)),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            cursorColor: grayColor,
                            controller: dobController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blackColor)),
                              label: Text("DOB"),
                              labelStyle:
                                  TextStyle(fontSize: 10, color: grayColor),
                              hintStyle:
                                  TextStyle(color: grayColor, fontSize: 10),
                              hintText: "xx/xx/xxxx",
                            ),
                          ),
                          SizedBox(height: hp(3, context)),
                          Container(
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                  onPressed: () async {
                                    if (_formfield.currentState!.validate()) {
                                      if (profileData.isEmpty ||
                                          profileData.length == 0) {
                                        addUser();
                                        displayAddprofileToast();
                                      } else {
                                        updateUser();
                                        displayUpdateprofileToast();
                                      }
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(color: whiteColor),
                                  )))
                        ]),
                      )
                    ])))
            : const Custonloading());
  }

  displayAddprofileToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Add Profle Data Successfully.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }

  displayUpdateprofileToast() {
    Widget toast = const CustomToast(
      child: Text(
        "Update Profle Data Successfully.",
        style: TextStyle(color: whiteColor),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
