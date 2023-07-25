import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/utils/validator.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import 'package:vcard/widget/custom_textformfield_widget.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../model/data_controllers.dart';
import '../utils/responsive.dart';
import '../widget/custom_toast.dart';
import '../widget/upload_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  //from key
  final _formfield = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  String? imgeurl;
  File? imagePicker;
  String? images;
  String? currentUserId;
  Users? profileData;
  FToast? fToast;
  bool isLoading = false;
  bool isUpdate = false;
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
    setState(() {
      isUpdate = true;
    });
    String? imgurl;
    if (imagePicker != null) {
      imgurl = await uploadImage(imagePicker!);
    }

    return receivedLoanDataRef.set({
      'profilename': nameController.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? "",
      'dob': professionController.text,
      'profileemail': emailController.text,
      'user': FirebaseAuth.instance.currentUser?.uid,
    }).then((value) {
      displayToast(isUpdate: false);
      setState(() {
        isUpdate = false;
      });
      imgurl = null;
      getSingleUserData();
    }).catchError((error) {
      setState(() {
        isUpdate = false;
      });
      debugPrint("Failed to add user: $error");
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
    setState(() {
      isLoading = true;
    });
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile")
        .get();

    for (var element in snapshot.docs) {
      profileData = Users(
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
        profileemail: element.data()['profileemail'] ?? "",
      );
    }

    setState(() {
      images = profileData?.images ?? "";
      nameController.text = profileData?.profilename ?? "";
      professionController.text = profileData?.dob ?? "";
      emailController.text = profileData?.profileemail ?? "";
      currentUserId = profileData?.id;
      if (user != null && user!.phoneNumber != null) {
        numberController.text = user!.phoneNumber ?? "";
      }
      isLoading = false;
    });
  }

  Future<void> updateUser() async {
    setState(() {
      isUpdate = true;
    });
    String? imgurl;
    if (imagePicker != null) {
      imgurl = await uploadImage(imagePicker!);
    }
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile")
        .doc(currentUserId);

    try {
      return receivedLoanDataRef.update({
        'profilename': nameController.text,
        'id': receivedLoanDataRef.id,
        'images': imgurl ?? images,
        'dob': professionController.text,
        'profileemail': emailController.text,
        'user': FirebaseAuth.instance.currentUser?.uid,
      }).then((value) {
        setState(() {
          isUpdate = false;
        });
        displayToast(isUpdate: true);
        getSingleUserData();
        imgurl == null;
      }).catchError((error) {
        setState(() {
          isUpdate = false;
        });
      });
    } catch (e) {
      debugPrint("ERROR:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbarwidget(
        centerTitle: false,
        title: "Profile",
      ),
      body: isLoading == true
          ? const Center(
              child: SpinKitCircle(color: COLOR_PRIMARY),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: hp(4, context),
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
                            child: ClipOval(
                              child: imagePicker == null
                                  ? CachedNetworkImage(
                                      width: wp(31, context),
                                      height: hp(15, context),
                                      fit: BoxFit.fill,
                                      imageUrl: "$images",
                                      placeholder: (context, url) {
                                        return Container(
                                          color: Theme.of(context).primaryColor,
                                          child: const Icon(
                                            Icons.person,
                                            size: 70,
                                            color: COLOR_WHITE,
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          "assets/images/splash1.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  : Image.file(
                                      imagePicker!,
                                      fit: BoxFit.fill,
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
                                  padding: const EdgeInsets.all(2),
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
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: hp(4, context),
                    ),
                    Text(
                      "Basic Information",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT,
                          fontWeight: FontWeight.w600),
                    ),
                    //card Type
                    SizedBox(
                      height: hp(4, context),
                    ),
                    Text(
                      "Full Name",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT),
                    ),

                    CustomTextFormField(
                      texteditinghinttext: "Name",
                      customprefixicon: SizedBox(
                        height: hp(1, context),
                        width: wp(1, context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: COLOR_PRIMARY_LIGHT,
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            VerticalDivider(
                              indent: hp(1, context),
                              endIndent: hp(1, context),
                              thickness: 1,
                              color: COLOR_PRIMARY_LIGHT.withOpacity(0.25),
                            )
                          ],
                        ),
                      ),
                      style: textMediumTextStyle,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: hp(2, context)),
                      textEditingController: nameController,
                      validationfunction: (value) =>
                          namevalidator(value, message: "Name is required."),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: hp(3, context),
                    ),
                    Text(
                      "Contact Number",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT),
                    ),

                    CustomTextFormField(
                      texteditinghinttext: "Contact Number",
                      customprefixicon: SizedBox(
                        height: hp(1, context),
                        width: wp(1, context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: COLOR_PRIMARY_LIGHT,
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            VerticalDivider(
                              indent: hp(1, context),
                              endIndent: hp(1, context),
                              thickness: 1,
                              color: COLOR_PRIMARY_LIGHT.withOpacity(0.25),
                            )
                          ],
                        ),
                      ),
                      readOnly: true,
                      textInputType: TextInputType.number,
                      style: textMediumTextStyle,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: hp(2, context)),
                      textEditingController: numberController,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: hp(3, context),
                    ),
                    Text(
                      "Email Address",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT),
                    ),
                    CustomTextFormField(
                      texteditinghinttext: "Email",
                      customprefixicon: SizedBox(
                        height: hp(1, context),
                        width: wp(1, context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.email_rounded,
                              color: COLOR_PRIMARY_LIGHT,
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            VerticalDivider(
                              indent: hp(1, context),
                              endIndent: hp(1, context),
                              thickness: 1,
                              color: COLOR_PRIMARY_LIGHT.withOpacity(0.25),
                            )
                          ],
                        ),
                      ),
                      style: textMediumTextStyle,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: hp(2, context)),
                      textEditingController: emailController,
                      validationfunction: emailValidator,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: hp(3, context),
                    ),
                    Text(
                      "Profession",
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT),
                    ),
                    CustomTextFormField(
                      texteditinghinttext: "Profession",
                      customprefixicon: SizedBox(
                        height: hp(1, context),
                        width: wp(1, context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.comment,
                              color: COLOR_PRIMARY_LIGHT,
                            ),
                            SizedBox(
                              width: wp(1, context),
                            ),
                            VerticalDivider(
                              indent: hp(1, context),
                              endIndent: hp(1, context),
                              thickness: 1,
                              color: COLOR_PRIMARY_LIGHT.withOpacity(0.25),
                            )
                          ],
                        ),
                      ),
                      style: textMediumTextStyle,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: hp(2, context)),
                      textEditingController: professionController,
                      validationfunction: (value) => textvalidator(value,
                          message: "Profession is required."),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY_LIGHT),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),

                    SizedBox(height: hp(5, context)),
                    Center(
                      child: TextButtomWidget(
                          onPressed: () async {
                            if (_formfield.currentState!.validate()) {
                              if (profileData == null) {
                                addUser();
                              } else {
                                updateUser();
                              }
                            }
                          },
                          height: hp(6.5, context),
                          width: wp(80, context),
                          title: "Save",
                          isLoading: isUpdate,
                          color: COLOR_PRIMARY_DARK),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  displayToast({bool isUpdate = false}) {
    Widget toast = CustomToast(
      child: Text(
        isUpdate == true
            ? "Update Profle Data Successfully."
            : "Add Profle Data Successfully.",
        style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
      ),
    );
    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
