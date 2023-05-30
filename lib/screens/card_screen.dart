import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import '../model/data_controllers.dart';
import '../widget/custom_alartdialog.dart';
import '../widget/custom_no_data_widget.dart';
import '../widget/text_widget.dart';
import 'menu_screen.dart';

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

  // Database data get
  Future<void> getSingleUserData() async {
    List<Users> userData = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .get();
    for (var element in snapshot.docs) {
      userData.add(
        Users(
            user: element['user'],
            name: element['Name'],
            department: element['Department'],
            compeny: element['Company'],
            whatsapp: element['WhatsApp'],
            telegram: element['Telegram'],
            website: element['Website'],
            linkdin: element['Linkdin'],
            facebook: element['Facebook'],
            email: element['Email'],
            phone: element['Phone'],
            country: element['country'],
            address: element['Address'],
            id: element['id'],
            type: element['type'],
            image: element['images'],
            card: element['card'],
            color: element['color']),
      );
    }

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
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return CustomAlartDialog(
                  title: const Text("Exit Application"),
                  content: const Text("Do you want to exit an Applicaton?"),
                  onPressedNo: () {
                    Navigator.pop(context);
                  },
                  onPressedYes: () {
                    exit(0);
                  });
            });
        return shouldPop!;
      },
      child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            elevation: 0.3,
            automaticallyImplyLeading: false,
            title: const Text("Cards", style: TextStyle(color: blackColor)),
            backgroundColor: whiteColor,
          ),
          body: Staticmenbers.listofUsers.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: Staticmenbers.listofUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          cardindex = index;
                        });
                        showModalBottomSheet(
                            backgroundColor: whiteColor,
                            elevation: 0.0,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            builder: (BuildContext context) =>
                                Menuscreen(id: cardindex));
                      },
                      // user card
                      child: Container(
                          height: hp(13, context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: whiteColor,
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                color: Color(0xffc1c4be),
                                blurRadius: 10.0,
                              ),
                            ],
                            color: whiteColor,
                          ),
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          child: ListTile(
                            leading: Staticmenbers.listofUsers[index].image ==
                                    ""
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/splash1.png",
                                      width: wp(18, context),
                                      height: hp(10, context),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.network(
                                      "${Staticmenbers.listofUsers[index].image}",
                                      width: wp(18, context),
                                      height: hp(10, context),
                                      fit: BoxFit.fill,
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
                                            color: whiteColor,
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
                                            top: 9, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text:
                                              '${Staticmenbers.listofUsers[index].name}',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          selectionColor: blackColor,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text:
                                              '${Staticmenbers.listofUsers[index].type}',
                                          fontSize: 14,
                                          selectionColor: grayColor,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Textwidget(
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          width: wp(50, context),
                                          text:
                                              '${Staticmenbers.listofUsers[index].department}',
                                          fontSize: 14,
                                          selectionColor: grayColor,
                                        ))
                                  ]),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(Icons.more_horiz),
                              ),
                            ]),
                          )),
                    );
                  })
              // no data screen
              : SizedBox(
                  height: hp(100, context),
                  width: wp(100, context),
                  child: const CustomNoData(
                    iconaddress: card,
                  ),
                )),
    );
  }
}
