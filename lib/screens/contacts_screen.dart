import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/widget/text_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/custom_no_data_widget.dart';
import 'detail_screen.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.3,
          title: const Text("Contacts", style: TextStyle(color: BLACK_COLOR)),
          backgroundColor: WHITE_COLOR,
        ),
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
                            color: WHITE_COLOR),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: ListTile(
                          leading: Staticmenbers.cardUsers[index].image == null
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/images/splash1.png",
                                    width: wp(18, context),
                                    height: hp(10, context),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
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
                          title: Row(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Staticmenbers.cardUsers[index].name == ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 9, left: 20),
                                          child: Textwidget(
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].name}',
                                            fontSize: 20,
                                            selectionColor: BLACK_COLOR,
                                          )),
                                  Staticmenbers.cardUsers[index].phone == ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 20),
                                          child: Textwidget(
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].phone}',
                                            fontSize: 15,
                                            selectionColor: BLACK_COLOR,
                                          )),
                                  Staticmenbers.cardUsers[index].compeny == ""
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 20),
                                          child: Textwidget(
                                            width: wp(40, context),
                                            text:
                                                '${Staticmenbers.cardUsers[index].compeny}',
                                            fontSize: 15,
                                            selectionColor: BLACK_COLOR,
                                          )),
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
                                      builder: (BuildContext context) =>
                                          Detailscreen(
                                            contectid: cardindex,
                                          ));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.more_horiz),
                                )),
                          ]),
                        )),
                  );
                })
            : SizedBox(
                height: hp(100, context),
                width: wp(100, context),
                child: CustomNoData(
                  iconaddress: CARD,
                ),
              ));
  }
}
