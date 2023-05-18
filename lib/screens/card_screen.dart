import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import '../model/data_controllers.dart';
import '../widget/custom_no_data_widget.dart';
import '../widget/text_widget.dart';
import 'detail_screen.dart';

class Cardscreen extends StatefulWidget {
  const Cardscreen({super.key});

  @override
  State<Cardscreen> createState() => _CardscreenState();
}

class _CardscreenState extends State<Cardscreen> {
  int? cardindex;
  bool value = false;
  @override
  void initState() {
    getSingleUserData();
    log('Rfresh');
    setState(() {});
    super.initState();
  }

  void changeData() {
    setState(() {
      getSingleUserData();
      value = true;
    });
  }

  Future<void> getSingleUserData() async {
    List<Users> userData = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .get();
    snapshot.docs.forEach((element) {
      userData.add(
        Users(
            user: element['user'],
            name: element['Name'],
            department: element['Department'],
            compeny: element['Company'],
            whatsapp: element['WhatsApp'],
            telegram: element['Telegram'],
            website: element['Website'],
            link: element['Link'],
            facebook: element['Facebook'],
            email: element['Email'],
            phone: element['Phone'],
            address: element['Address'],
            id: element['id'],
            type: element['type'],
            image: element['images'],
            card: element['card'],
            color: element['color']),
      );
    });

    setState(() {
      value = true;
      Staticmenbers.listofUsers = userData;
      log('message:$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            showCloseIcon: false,
            title: "Exit Application",
            desc: "Do you want to exit an Applicaton?",
            btnCancelOnPress: () async {},
            btnOkOnPress: () async {
              exit(0);
            }).show();
        return shouldPop;
      },
      child: Scaffold(
          backgroundColor: WHITE_COLOR,
          appBar: AppBar(
            elevation: 0.3,
            automaticallyImplyLeading: false,
            title: const Text("Cards", style: TextStyle(color: BLACK_COLOR)),
            backgroundColor: WHITE_COLOR,
          ),
          body: Staticmenbers.listofUsers.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: Staticmenbers.listofUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: hp(13, context),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: WHITE_COLOR,
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                              color: Color(0xffc1c4be),
                              blurRadius: 10.0,
                            ),
                          ],
                          color: WHITE_COLOR,
                        ),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: ListTile(
                          leading: Staticmenbers.listofUsers[index].image == ""
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/images/splash1.png",
                                    width: wp(18, context),
                                    height: hp(10, context),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.network(
                                    "${Staticmenbers.listofUsers[index].image}",
                                    width: wp(18, context),
                                    height: hp(10, context),
                                    fit: BoxFit.cover,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      return child;
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const Center(
                                            child: Icon(
                                          Icons.image,
                                          size: 130,
                                          color: WHITE_COLOR,
                                        ));
                                      }
                                    },
                                  ),
                                ),
                          title: Row(children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 9, left: 20),
                                      child: Textwidget(
                                        width: wp(40, context),
                                        text:
                                            '${Staticmenbers.listofUsers[index].name}',
                                        fontSize: 20,
                                        selectionColor: BLACK_COLOR,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 20),
                                      child: Textwidget(
                                        width: wp(40, context),
                                        text:
                                            '${Staticmenbers.listofUsers[index].type}',
                                        fontSize: 14,
                                        selectionColor: BLACK_COLOR,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3, left: 20),
                                      child: Textwidget(
                                        width: wp(40, context),
                                        text:
                                            '${Staticmenbers.listofUsers[index].department}',
                                        fontSize: 14,
                                        selectionColor: BLACK_COLOR,
                                      ))
                                ]),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      cardindex = index;
                                    });
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0,
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0)),
                                        ),
                                        builder: (BuildContext context) =>
                                            Detailscreen(
                                              id: cardindex,
                                            ));
                                  },
                                  child: const Icon(Icons.more_horiz)),
                            ),
                          ]),
                        ));
                  })
              : SizedBox(
                  height: hp(100, context),
                  width: wp(100, context),
                  child: CustomNoData(
                    iconaddress: CARD,
                  ),
                )),
    );
  }
}
