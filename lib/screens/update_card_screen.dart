// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/preview_card_screen.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/formatters.dart';
import '../utils/responsive.dart';
import '../utils/validator.dart';
import '../widget/address_textfield.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/upload_image.dart';
import 'more_textfield_screen.dart';
import '../widget/text_button_widget.dart';

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
  int? i = 0;
  String? imageurl;
  List<Users> singleuser = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController headlineController = TextEditingController();
  final TextEditingController whatsappcontroller = TextEditingController();
  final TextEditingController telegramcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController snapchatcontroller = TextEditingController();
  final TextEditingController websitecontroller = TextEditingController();
  final TextEditingController facebookcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
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
            card: e['card'],
            color: e['color']))
        .toList();

    setState(() {
      singleuser = userData;
      imageurl = singleuser.first.image!;
      nameController.text = singleuser.first.name!;
      typecontroller.text = singleuser.first.type!;
      addresscontroller.text = singleuser.first.address!;
      companyController.text = singleuser.first.compeny!;
      departmentController.text = singleuser.first.department!;
      emailcontroller.text = singleuser.first.email!;
      facebookcontroller.text = singleuser.first.facebook!;
      linkController.text = singleuser.first.link!;
      numbercontroller.text = singleuser.first.phone!;
      telegramcontroller.text = singleuser.first.telegram!;
      websitecontroller.text = singleuser.first.website!;
      whatsappcontroller.text = singleuser.first.whatsapp!;
      _selectedIndex = singleuser.first.card;
      _selectcolor = singleuser.first.color;
    });
    updateImageUrl = singleuser.first.image;
    setState(() {});
  }

  Future<void> updateUser() async {
    var receivedLoanDataRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .doc(widget.id);
    String? imgurl;
    if (Imagepicker != null) {
      imgurl = await uploadImage(Imagepicker!);
    }
    return receivedLoanDataRef.update({
      'Name': nameController.text,
      'Department': departmentController.text,
      'Company': companyController.text,
      'WhatsApp': whatsappcontroller.text,
      'Telegram': telegramcontroller.text,
      'Snapchat': snapchatcontroller.text,
      'Website': websitecontroller.text,
      'Link': linkController.text,
      'Facebook': facebookcontroller.text,
      'Email': emailcontroller.text,
      'Phone': numbercontroller.text,
      'Address': addresscontroller.text,
      'id': receivedLoanDataRef.id,
      'images': imgurl ?? updateImageUrl,
      'type': typecontroller.text,
      'card': _selectedIndex,
      'color': _selectcolor
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const Dashboardscreen(index: 0))));
    }).catchError((error) => (error));
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
    } catch (e) {
      Error;
    }
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

  int? _selectcolor;
  int? _selectedIndex;
  bool isLoading = false;
  bool isphotoloading = false;
  bool ismoreadddata = false;
  int? previewcard;
  int? previewcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: Customappbarwidget(
          title: "Edit card",
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
                      updateUser();
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
      body: emailcontroller.text == "" &&
              nameController.text == "" &&
              departmentController.text == "" &&
              companyController.text == ""
          ? const Center(child: Custonloading())
          : SingleChildScrollView(
              child: Form(
                key: _formfield,
                child: Stack(children: [
                  Column(
                    children: [
                      SizedBox(height: hp(2, context)),
                      Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: blueColor, width: wp(0.5, context)),
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
                                    image: const AssetImage(
                                        "assets/images/splash1.png"),
                                    width: wp(30, context),
                                    height: hp(15, context),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: Center(
                                          child: Icon(
                                        Icons.image,
                                        size: 50,
                                        color: whiteColor,
                                      )),
                                    ),
                                    imageUrl: "$imageurl",
                                    width: wp(30, context),
                                    height: hp(15, context),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                        Positioned(
                            top: 80,
                            left: 85,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isphotoloading = true;
                                });
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
                                        color: blackColor,
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
                      ]),
                      SizedBox(height: hp(3, context)),
                      SizedBox(height: hp(3, context)),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.words,
                        labelText: "Type",
                        inputFormatters: null,
                        textInputType: TextInputType.emailAddress,
                        textEditingController: typecontroller,
                        texteditinghinttext: 'card type',
                        customobscuretext: true,
                        customsuffixIcon: null,
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
                        inputFormatters: null,
                        textInputType: TextInputType.text,
                        textEditingController: nameController,
                        texteditinghinttext: 'Name',
                        customobscuretext: true,
                        customsuffixIcon: null,
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
                        inputFormatters: null,
                        textInputType: TextInputType.text,
                        textEditingController: departmentController,
                        texteditinghinttext: 'Profession',
                        customobscuretext: true,
                        customsuffixIcon: null,
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
                        inputFormatters: null,
                        textInputType: TextInputType.text,
                        textEditingController: companyController,
                        texteditinghinttext: 'Company',
                        customobscuretext: true,
                        customsuffixIcon: null,
                        customprefixicon: const Icon(
                          Icons.apartment_sharp,
                          color: grayColor,
                        ),
                        validationfunction: textvalidator,
                      ),
                      SizedBox(height: hp(2, context)),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.none,
                        labelText: "Phone",
                        inputFormatters: [maskFormatter],
                        textInputType: TextInputType.phone,
                        textEditingController: numbercontroller,
                        texteditinghinttext: 'Phone',
                        customobscuretext: true,
                        customsuffixIcon: null,
                        customprefixicon: const Icon(
                          Icons.phone,
                          color: grayColor,
                        ),
                        validationfunction: numbervalidator,
                      ),
                      SizedBox(height: hp(2, context)),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.none,
                        labelText: "Email",
                        inputFormatters: null,
                        textInputType: TextInputType.emailAddress,
                        textEditingController: emailcontroller,
                        texteditinghinttext: 'Email',
                        customobscuretext: true,
                        customsuffixIcon: null,
                        customprefixicon: const Icon(
                          Icons.email,
                          color: grayColor,
                        ),
                        validationfunction: emailValidator,
                      ),
                      SizedBox(height: hp(2, context)),
                      Addresstextfield(
                          textEditingController: addresscontroller,
                          itmClick: (Prediction prediction) {
                            addresscontroller.text = prediction.description!;

                            addresscontroller.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: prediction.description!.length));
                          }),
                      SizedBox(height: hp(1, context)),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: _selectedIndex != null
                              ? SizedBox(
                                  height: hp(10, context),
                                  width: wp(30, context),
                                  child: Image.asset(
                                      cardList[_selectedIndex ?? 0]))
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  previewcard = _selectedIndex;
                                  previewcolor = _selectcolor;
                                });
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0)),
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
                          ),
                          const Spacer(),
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
                              linkController: linkController,
                              whatsappcontroller: whatsappcontroller,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  Positioned(
                    top: 220,
                    left: 160,
                    child: (isLoading)
                        ? const Custonloading()
                        : const SizedBox.shrink(),
                  )
                ]),
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
          title: const Text("Update Card's"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
                height: hp(35, context),
                width: wp(50, context),
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
                            image: AssetImage(cardList[index]),
                            height: hp(15, context),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20)));
          }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButtomWidget(
                  color: blueColor,
                  fontSize: 20,
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
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
          title: const Text('Update color'),
          content: SizedBox(
            height: hp(35, context),
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
                                  ? blueColor
                                  : whiteColor,
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
                    setState(() {
                      Navigator.pop(context);
                    });
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

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: blueColor,
      ),
      child: const Text(
        "Add Successfully",
        style: TextStyle(color: whiteColor),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
