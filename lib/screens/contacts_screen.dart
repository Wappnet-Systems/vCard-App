import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vcard/controllers/data_controllers.dart';
import 'package:vcard/screens/contect_visiting_card.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/string.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import 'package:vcard/widget/custom_no_data_widget.dart';
import 'package:vcard/widget/delete_card_dialog.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int? cardindex;
  bool value = false;
  bool isLoading = false;
  List<Users> userData = [];
  @override
  void initState() {
    getContactData();
    super.initState();
  }

  void changeData() {
    setState(() {
      getContactData();
      value = true;
    });
  }

  Future<void> getContactData() async {
    setState(() {
      isLoading = true;
    });
    userData.clear();
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's Card")
        .get();

    userData = snapshot.docs
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
      value = true;
      isLoading = false;
      Staticmembers.listofUsers = userData;
    });

    log("contact length : ${Staticmembers.listofUsers.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: const AppBarWidget(
        title: "Contacts",
        centerTitle: true,
      ),
      body: Staticmembers.listofUsers.isNotEmpty
          ? isLoading
              ? const Center(
                  child: SpinKitCircle(
                    color: PRIMARY_COLOR,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(6, context),
                    vertical: hp(3, context),
                  ),
                  itemCount: Staticmembers.listofUsers.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: wp(28, context),
                        maxHeight: hp(35, context),
                      ),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry>[
                          PopupMenuItem(
                            value: 1,
                            height: hp(6, context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.visibility_rounded,
                                  size: 20,
                                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                                ),
                                SizedBox(
                                  width: wp(2, context),
                                ),
                                Text(
                                  "View",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.8),
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            height: hp(6, context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.delete_outline_rounded,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: wp(2, context),
                                ),
                                const Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        setState(() {
                          cardindex = index;
                        });
                        value == 1
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Contectvisitingcard(
                                    id: cardindex,
                                  ),
                                ),
                              )
                            : value == 2
                                ? deleteCard(
                                    context,
                                    onPressed: () {
                                      setState(() {
                                        log("${Staticmembers.listofUsers[index].id}");
                                        FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser?.uid)
                                            .collection("Frind's Card")
                                            .doc(Staticmembers
                                                .listofUsers[index].id)
                                            .delete()
                                            .then((value) {
                                          Navigator.pop(context, true);
                                          changeData();
                                        });
                                      });
                                    },
                                  )
                                : null;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: wp(3, context),
                          vertical: hp(2, context),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: hp(1.5, context),
                        ),
                        decoration: BoxDecoration(
                          color: WHITE_COLOR,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                              blurRadius: 1.0,
                              offset: const Offset(1, -1),
                            ),
                            BoxShadow(
                              color: COLOR_PRIMARY_DARK.withOpacity(0.2),
                              blurRadius: 1.0,
                              offset: const Offset(-1, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Staticmembers.listofUsers[index].image ==
                                      ""
                                  ? Image.asset(
                                      "assets/images/splash1.png",
                                      width: wp(16, context),
                                      height: hp(10, context),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "${Staticmembers.listofUsers[index].image}",
                                      width: wp(16, context),
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
                                          return Center(
                                            child: Icon(
                                              Icons.image,
                                              size: 60,
                                              color: PRIMARY_COLOR
                                                  .withOpacity(0.5),
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Icon(
                                            Icons.image,
                                            size: 60,
                                            color:
                                                PRIMARY_COLOR.withOpacity(0.5),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                            SizedBox(
                              width: wp(3, context),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Staticmembers.listofUsers[index].type}',
                                    style: const TextStyle(
                                      color: COLOR_PRIMARY_DARK,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Company: ${Staticmembers.listofUsers[index].compeny}',
                                    style: TextStyle(
                                      color:
                                          COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Department: ${Staticmembers.listofUsers[index].department}',
                                    style: TextStyle(
                                      color:
                                          COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.menu_rounded,
                              size: 20,
                              color: BLUE_COLOR,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
          : const CustomNoData(
              iconaddress: CARD,
            ),
    );
  }
}
