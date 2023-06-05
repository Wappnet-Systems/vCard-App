import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/widget/text_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widget/custom_no_data_widget.dart';
import 'menu_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int? cardindex;
  bool value = false;
  List<Users> userData = [];
  @override
  void initState() {
    getContectUserData();
    super.initState();
  }

  void changeData() {
    setState(() {
      getContectUserData();
      value = true;
    });
  }

  // Contect person card data get
  Future<void> getContectUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's card")
        .get();
    final contectData = snapshot.docs
        .map((e) => Users(
            user: e.data()['user'],
            name: e.data()['Name'],
            department: e.data()['Department'],
            compeny: e.data()['Company'],
            whatsapp: e.data()['WhatsApp'],
            telegram: e.data()['Telegram'],
            website: e.data()['Website'],
            linkdin: e.data()['Linkdin'],
            facebook: e.data()['Facebook'],
            email: e.data()['Email'],
            phone: e.data()['Phone'],
            country: e.data()['country'],
            address: e.data()['Address'],
            id: e.data()['id'],
            image: e.data()['images'],
            type: e.data()['type'],
            card: e.data()['card'],
            color: e.data()['color']))
        .toList();

    setState(() {
      value = true;
      Staticmenbers.cardUsers = contectData;
      log('message:$value');
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.3,
          title: const Text("Contacts", style: TextStyle(color: blackColor)),
          backgroundColor: whiteColor,
        ),
        // save card
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
                                blurRadius: 10.0,
                              ),
                            ],
                            color: whiteColor),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              "${Staticmenbers.cardUsers[index].image}",
                              width: wp(16, context),
                              height: hp(8, context),
                              fit: BoxFit.fill,
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                return child;
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image(
                                  image: const AssetImage(
                                      "assets/images/splash1.png"),
                                  width: wp(16, context),
                                  height: hp(8, context),
                                  fit: BoxFit.fill,
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
                                    color: whiteColor,
                                  ));
                                }
                              },
                            ),
                          ),
                          title: Row(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Staticmenbers.cardUsers[index].name == ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 9, left: 5),
                                          child: Textwidget(
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].name}',
                                            fontSize: 20,
                                            selectionColor: blackColor,
                                          )),
                                  Staticmenbers.cardUsers[index].type == ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 5),
                                          child: Textwidget(
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].type}',
                                            fontSize: 14,
                                            selectionColor: grayColor,
                                          )),
                                  Staticmenbers.cardUsers[index].department ==
                                          ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 5),
                                          child: Textwidget(
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].department}',
                                            fontSize: 14,
                                            selectionColor: grayColor,
                                          )),
                                ]),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(Icons.more_horiz),
                            ),
                          ]),
                        )),
                    onTap: () async {
                      setState(() {
                        cardindex = index;
                      });
                      showModalBottomSheet(
                          backgroundColor: whiteColor,
                          elevation: 0.0,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0)),
                          ),
                          builder: (BuildContext context) => Menuscreen(
                                contectid: cardindex,
                              ));
                    },
                  );
                })
            // no deta screen
            : SizedBox(
                height: hp(100, context),
                width: wp(100, context),
                child: const CustomNoData(
                  iconaddress: card,
                ),
              ));
  }
}
