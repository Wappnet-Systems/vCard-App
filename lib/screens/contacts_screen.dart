import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/string.dart';
import '../controllers/data_controllers.dart';
import '../utils/style.dart';
import '../utils/responsive.dart';
import '../widget/bottom_sheet.dart';
import '../widget/custom_no_data.dart';
import '../widget/decoration_widget.dart';
import '../widget/text_button_widget.dart';
import 'contect_visiting_card.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({super.key});

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

    print("object");
    final userData = snapshot.docs
        .map((e) => Users(
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
            type: e['type']))
        .toList();

    print("userData $userData");

    setState(() {
      value = true;
      Staticmenbers.listofUsers = userData;
      log('message:$value');
    });

    print(
        "Staticmenbers.listofUsers.length : ${Staticmenbers.listofUsers.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Contacts"),
          backgroundColor: PRIMARY_COLOR,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/splash1.png"),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Staticmenbers.listofUsers.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                ),
                itemCount: Staticmenbers.listofUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      setState(() {
                        cardindex = index;
                      });
                      final refresh = await showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: BLUE_COLOR,
                                ),
                                height: hp(30, context),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Decorationwidget(),
                                      SizedBox(
                                        height: hp(1, context),
                                      ),
                                      Text(
                                        "Work",
                                        style: TextStyle(
                                            fontSize: 20, color: WHITE_COLOR),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: wp(6.7, context)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // SizedBox(width: wp(7, context)),
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
                                              child: CardWidget(
                                                icon: Icons.remove_red_eye,
                                                data: "View",
                                                data1: "Open your card",
                                                data2: "in vCard.",
                                              ),
                                            ),
                                            // SizedBox(width: wp(3, context)),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    title: const Text(
                                                        "Are you sure you want to delete this card?"),
                                                    content: null,
                                                    actions: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              setState(() {
                                                                log("${Staticmenbers.listofUsers[index].id}");
                                                                final refresh = FirebaseFirestore
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
                                                                        .listofUsers[
                                                                            index]
                                                                        .id)
                                                                    .delete()
                                                                    .then(
                                                                        (value) {
                                                                  Future.delayed(
                                                                      Duration(
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
                                                                if (refresh ==
                                                                    true) {
                                                                  changeData();
                                                                }
                                                              });
                                                            },
                                                            title: '0key',
                                                            fontSize: 15,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            title: 'Cancle',
                                                            fontSize: 15,
                                                            color:
                                                                PRIMARY_COLOR,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: CardWidget(
                                                icon: Icons.delete,
                                                data: "Delete",
                                                data1: "Delete your",
                                                data2: "Card.",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                      log("refresh1:$refresh");
                      if (refresh == true) {
                        changeData();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PRIMARY_COLOR,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: wp(2, context),
                      ),
                      child: Column(children: [
                        Staticmenbers.listofUsers[index].image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(45, context),
                                  height: hp(20, context),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${Staticmenbers.listofUsers[index].image}",
                                  width: wp(45, context),
                                  height: hp(20, context),
                                  fit: BoxFit.fill,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image(
                                      image: AssetImage(
                                          "assets/images/splash1.png"),
                                      width: wp(45, context),
                                      height: hp(20, context),
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                          child: Icon(
                                        Icons.image,
                                        size: 130,
                                        color: WHITE_COLOR,
                                      ));
                                    }
                                  },
                                ),
                              ),
                        SizedBox(height: hp(0.5, context)),
                        Center(
                          child: Text(
                            '${Staticmenbers.listofUsers[index].type}',
                            style: TextStyle(color: WHITE_COLOR),
                          ),
                        ),
                        SizedBox(height: hp(0.5, context)),
                      ]),
                    ),
                  );
                })
            : CustomNoData(
                iconaddress: CARD,
              ));
  }
}
