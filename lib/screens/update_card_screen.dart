import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../utils/validator.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_textformfield_widget.dart';
import '../widget/icon_widget.dart';
import '../widget/text_button_widget.dart';

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
            card: e['card'],
            color: e['color']))
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
      'card': _selectedIndex,
      'color': _selectcolor
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Dashboardscreen(
                    index: 0,
                  ))));
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

  final imageList = [
    "assets/cards/card1.jpg",
    'assets/cards/card2.jpg',
    "assets/cards/card3.jpg",
    "assets/cards/card4.jpg"
  ];
  int? _selectcolor;
  int? _selectedIndex;
  bool isLoading = false;
  bool isphotoloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: Customappbarwidget(
          title: "Card",
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
                  icon: const Icon(Icons.save)),
            ),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
                child: Icon(Icons.arrow_back_sharp),
              ))),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Stack(children: [
            Column(
              children: [
                SizedBox(height: hp(0.5, context)),
                const Text("Edit Card"),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Divider(),
                ),
                SizedBox(height: hp(2, context)),
                Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: PRIMARY_COLOR, width: 3),
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
                              image:
                                  const AssetImage("assets/images/splash1.png"),
                              width: wp(40, context),
                              height: hp(19, context),
                            ),
                          )
                        : ClipOval(
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const Custonloading(),
                              imageUrl: "$imageurl",
                              width: wp(40, context),
                              height: hp(19, context),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Positioned(
                      top: 130,
                      left: 115,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isphotoloading = true;
                          });
                          imagepicker();
                        },
                        child: const Icon(
                          Icons.flip_camera_ios,
                          size: 30,
                          color: BLUE_COLOR,
                        ),
                      )),
                ]),
                SizedBox(height: hp(3, context)),
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
                  validationfunction: null,
                ),
                CustomTextFormField(
                  inputFormatters: null,
                  textInputType: TextInputType.text,
                  textEditingController: _companyController,
                  texteditinghinttext: 'Company',
                  customobscuretext: true,
                  custominkwell: null,
                  customprefixicon: null,
                  validationfunction: null,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Color(0xff000000)),
                    cursorColor: PRIMARY_COLOR,
                    controller: _headlineController,
                    decoration: const InputDecoration(
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
                ),
                SizedBox(height: hp(3, context)),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          showimagelist();
                        },
                        child: const Text("Select Card Theme ?",
                            style: TextStyle(color: PRIMARY_COLOR))),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showcolorlist();
                        },
                        child: const Text("Select Card Color ?",
                            style: TextStyle(color: PRIMARY_COLOR)))
                  ]),
                ),
                SizedBox(height: hp(3, context)),
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
          height: hp(30, context),
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
                SizedBox(
                  height: hp(2, context),
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
                      child: const Text(
                        "CAMERA",
                        style: TextStyle(color: WHITE_COLOR),
                      )),
                ),
                SizedBox(height: hp(2, context)),
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
                      child: const Text("GALLERY",
                          style: TextStyle(color: WHITE_COLOR))),
                ),
                SizedBox(height: hp(2, context)),
                Container(
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
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
          title: const Text("Card's"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: hp(30, context),
              width: wp(50, context),
              child: ListView.builder(
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
