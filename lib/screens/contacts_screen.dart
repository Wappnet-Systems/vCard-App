import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/custom_no_data_widget.dart';
import '../widget/text_button_widget.dart';
import 'contect_visiting_card.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's Card")
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
      value = true;
      Staticmenbers.cardUsers = userData;
      log('message:$value');
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: const Customappbarwidget(
            title: "Contacts", actions: null, leading: Text("")),
        body: Staticmenbers.cardUsers.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                itemCount: Staticmenbers.cardUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      height: hp(13, context),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffc1c4be),
                              blurRadius: 20.0,
                            ),
                          ],
                          color: WHITE_COLOR),
                      margin: const EdgeInsets.only(
                          left: 12, right: 12, top: 5, bottom: 5),
                      child: Row(children: [
                        SizedBox(width: wp(2.5, context)),
                        Staticmenbers.cardUsers[index].image == null
                            ? ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(18, context),
                                  height: hp(10, context),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Image.network(
                                  "${Staticmenbers.cardUsers[index].image}",
                                  width: wp(18, context),
                                  height: hp(10, context),
                                  fit: BoxFit.cover,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image(
                                      image: const AssetImage(
                                          "assets/images/splash1.png"),
                                      width: wp(18, context),
                                      height: hp(10, context),
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(
                                          child: Icon(
                                        Icons.image,
                                        size: 50,
                                        color: WHITE_COLOR,
                                      ));
                                    }
                                  },
                                ),
                              ),
                        SizedBox(width: wp(3, context)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Staticmenbers.cardUsers[index].name == ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 20),
                                      child: Text(
                                        '${Staticmenbers.cardUsers[index].name}',
                                        style: const TextStyle(
                                            color: BLACK_COLOR, fontSize: 20),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[index].phone == ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 20),
                                      child: Text(
                                        '${Staticmenbers.cardUsers[index].phone}',
                                        style: const TextStyle(
                                            color: BLACK_COLOR, fontSize: 15),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[index].compeny == ""
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 20),
                                      child: Text(
                                        '${Staticmenbers.cardUsers[index].compeny}',
                                        style: const TextStyle(
                                            color: BLACK_COLOR, fontSize: 15),
                                      ),
                                    ),
                            ]),
                        const Spacer(),
                        InkWell(
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
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: hp(20, context),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Contectvisitingcard(
                                                            id: cardindex,
                                                          )));
                                            },
                                            child: Container(
                                              height: hp(8, context),
                                              width: wp(17, context),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: GRAY),
                                              child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.remove_red_eye,
                                                      size: 22,
                                                      color: BLACK_COLOR,
                                                    ),
                                                    Text(
                                                      "View",
                                                      style: TextStyle(
                                                          color: BLACK_COLOR,
                                                          fontSize: 14),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(width: wp(5, context)),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                    title: const Text(
                                                        "Are you sure you want to delete this card?"),
                                                    content: null,
                                                    actions: <Widget>[
                                                      (isLoading)
                                                          ? const Custonloading()
                                                          : const SizedBox
                                                              .shrink(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              setState(() {
                                                                isLoading =
                                                                    true;
                                                                log("${Staticmenbers.cardUsers[index].id}");

                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "users")
                                                                    .doc(FirebaseAuth
                                                                        .instance
                                                                        .currentUser
                                                                        ?.uid)
                                                                    .collection(
                                                                        "Frind's Card")
                                                                    .doc(Staticmenbers
                                                                        .cardUsers[
                                                                            index]
                                                                        .id)
                                                                    .delete()
                                                                    .then(
                                                                        (value) {
                                                                  Future.delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                    Navigator.pushReplacement(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => Dashboardscreen(
                                                                                  index: 2,
                                                                                )));
                                                                  });
                                                                });
                                                              });
                                                            },
                                                            title: 'Okey',
                                                            fontSize: 15,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Dashboardscreen(
                                                                              index: 0)));
                                                            },
                                                            title: 'Cancle',
                                                            fontSize: 15,
                                                            color: BLUE_COLOR,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                            },
                                            child: Container(
                                              height: hp(8, context),
                                              width: wp(17, context),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: GRAY),
                                              child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      size: 22,
                                                      color: BLACK_COLOR,
                                                    ),
                                                    Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: BLACK_COLOR,
                                                          fontSize: 14),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(Icons.more_horiz),
                            )),
                      ]),
                    ),
                  );
                })
            : Container(
                height: hp(100, context),
                width: wp(100, context),
                child: CustomNoData(
                  iconaddress: CARD,
                ),
              ));
  }
}
