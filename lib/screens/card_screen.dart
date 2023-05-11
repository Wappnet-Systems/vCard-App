import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vcard/controllers/data_controllers.dart';
import 'package:vcard/screens/card_shere_screen.dart';
import 'package:vcard/screens/update_card_screen.dart';
import 'package:vcard/utils/string.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/app_bar_widget.dart';
import 'package:vcard/widget/custom_no_data_widget.dart';
import 'package:vcard/widget/delete_card_dialog.dart';
import 'package:vcard/widget/popup_menu_item_widget.dart';
import 'package:vcard/widget/text_button_widget.dart';
import 'view_visiting_card_screen.dart';

class Cardscreen extends StatefulWidget {
  const Cardscreen({super.key});

  @override
  State<Cardscreen> createState() => _CardscreenState();
}

class _CardscreenState extends State<Cardscreen> {
  List<Users> userData = [];
  int? cardindex;
  bool value = false;
  bool isLoading = false;

  @override
  void initState() {
    getSingleUserData();
    super.initState();
  }

  void changeData() {
    setState(() {
      log("yes");
      getSingleUserData();
      value = true;
    });
  }

  Future<void> getSingleUserData() async {
    setState(() {
      isLoading = true;
    });
    userData.clear();
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
            headline: element['HeadLine'],
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
            card: element['card']),
      );
    }

    log("userData $userData");

    setState(() {
      value = true;
      isLoading = false;
      Staticmembers.listofUsers = userData;
      log('message:$value');
    });

    log("Staticmembers.listofUsers.length : ${Staticmembers.listofUsers.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarWidget(
        title: "Cards",
        leadingWidth: wp(4, context),
      ),
      body: Staticmembers.listofUsers.isNotEmpty
          ? isLoading
              ? const Center(
                  child: SpinKitCircle(
                    color: COLOR_PRIMARY_DARK,
                  ),
                )
              : Column(
                  children: [
                    Divider(
                      color: COLOR_PRIMARY_DARK.withOpacity(0.5),
                      thickness: 1,
                      height: 1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: wp(6, context),
                          vertical: hp(3, context),
                        ),
                        itemCount: Staticmembers.listofUsers.length,
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
                                popUpMenuItem(
                                  context,
                                  value: 1,
                                  title: "View",
                                  icon: Icon(
                                    Icons.visibility_rounded,
                                    size: 20,
                                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                                  ),
                                ),
                                popUpMenuItem(
                                  context,
                                  value: 2,
                                  title: "Edit",
                                  icon: Icon(
                                    Icons.edit_rounded,
                                    size: 20,
                                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                                  ),
                                ),
                                popUpMenuItem(
                                  context,
                                  value: 3,
                                  title: "Share",
                                  icon: Icon(
                                    Icons.share_rounded,
                                    size: 20,
                                    color: COLOR_PRIMARY_LIGHT.withOpacity(0.7),
                                  ),
                                ),
                                popUpMenuItem(
                                  context,
                                  value: 4,
                                  title: "Delete",
                                  textColor: Colors.redAccent,
                                  icon: const Icon(Icons.delete_outline_rounded,
                                      size: 20, color: Colors.redAccent),
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
                                        builder: (context) => ViewVisitingCard(
                                          id: cardindex,
                                        ),
                                      ),
                                    )
                                  : value == 2
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Updatecardscreen(
                                                    id: Staticmembers
                                                        .listofUsers[index].id),
                                          ),
                                        )
                                      : value == 3
                                          ? openShareBottomSheet(
                                              context,
                                              Staticmembers
                                                  .listofUsers[index].id)
                                          : deleteCard(
                                              context,
                                              onPressed: () {
                                                setState(() {
                                                  log("${Staticmembers.listofUsers[index].id}");
                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser?.uid)
                                                      .collection("Carddata")
                                                      .doc(Staticmembers
                                                          .listofUsers[index]
                                                          .id)
                                                      .delete()
                                                      .then((value) {
                                                    Navigator.pop(
                                                        context, true);
                                                    changeData();
                                                  });
                                                });
                                              },
                                            );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: wp(3, context),
                                vertical: hp(2, context),
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: hp(2, context),
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
                                    child: Staticmembers
                                                .listofUsers[index].image ==
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
                                            frameBuilder: (context, child,
                                                frame, wasSynchronouslyLoaded) {
                                              return child;
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
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
                                                  color: PRIMARY_COLOR
                                                      .withOpacity(0.5),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            color: COLOR_PRIMARY_LIGHT
                                                .withOpacity(0.6),
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
                                            color: COLOR_PRIMARY_LIGHT
                                                .withOpacity(0.6),
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
                      ),
                    ),
                  ],
                )
          : const CustomNoData(
              iconaddress: CARD,
            ),
    );
  }

  void openShareBottomSheet(BuildContext context, String? userId) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) => CardSherScreen(
        uid: FirebaseAuth.instance.currentUser?.uid,
        cid: userId,
      ),
    );
  }
}
