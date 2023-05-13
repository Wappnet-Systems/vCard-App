import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: Customappbarwidget(
            title: "Contacts", actions: null, leading: Text("")),
        body: Staticmenbers.cardUsers.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                itemCount: Staticmenbers.cardUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      setState(() {
                        cardindex = index;
                      });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              title: null,
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye,
                                                  size: 18,
                                                  color: WHITE_COLOR,
                                                ),
                                                Text(
                                                  "View",
                                                  style: TextStyle(
                                                      color: WHITE_COLOR,
                                                      fontSize: 12),
                                                )
                                              ]),
                                          height: hp(7, context),
                                          width: wp(15, context),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.amber),
                                        ),
                                      ),
                                      SizedBox(width: wp(2, context)),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                title: const Text(
                                                    "Are you sure you want to delete this card?"),
                                                content: null,
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButtomWidget(
                                                        onPressed: () {
                                                          setState(() {
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
                                                                .then((value) {
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
                                                          });
                                                        },
                                                        title: 'Okey',
                                                        fontSize: 15,
                                                        color: Colors.redAccent,
                                                      ),
                                                      TextButtomWidget(
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Dashboardscreen(
                                                                          index:
                                                                              0)));
                                                        },
                                                        title: 'Cancle',
                                                        fontSize: 15,
                                                        color: PRIMARY_COLOR,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        },
                                        child: Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  size: 18,
                                                  color: WHITE_COLOR,
                                                ),
                                                Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: WHITE_COLOR,
                                                      fontSize: 12),
                                                )
                                              ]),
                                          height: hp(7, context),
                                          width: wp(15, context),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.lightGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            topRight: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffc1c4be),
                              blurRadius: 20.0,
                            ),
                          ],
                          color: Staticmenbers.cardUsers[index].color == ""
                              ? colorList[Staticmenbers.cardUsers[index].color!]
                              : WHITE_COLOR),
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: 5, bottom: 5),
                      child: Row(children: [
                        Staticmenbers.cardUsers[index].image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(45),
                                ),
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(32, context),
                                  height: hp(10, context),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(45),
                                ),
                                child: Image.network(
                                  "${Staticmenbers.cardUsers[index].image}",
                                  width: wp(25, context),
                                  height: hp(10, context),
                                  fit: BoxFit.fill,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image(
                                      image: AssetImage(
                                          "assets/images/splash1.png"),
                                      width: wp(32, context),
                                      height: hp(10, context),
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
                        SizedBox(width: wp(3, context)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Staticmenbers.cardUsers[index].name == ""
                                  ? SizedBox.shrink()
                                  : Text(
                                      '${Staticmenbers.cardUsers[index].name}',
                                      style: TextStyle(
                                          color: WHITE_COLOR, fontSize: 20),
                                    ),
                              Staticmenbers.cardUsers[index].phone == ""
                                  ? SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: Text(
                                        '${Staticmenbers.cardUsers[index].phone}',
                                        style: TextStyle(
                                            color: WHITE_COLOR, fontSize: 15),
                                      ),
                                    ),
                              Staticmenbers.cardUsers[index].compeny == ""
                                  ? SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.5,
                                      ),
                                      child: Text(
                                        '${Staticmenbers.cardUsers[index].compeny}',
                                        style: TextStyle(
                                            color: WHITE_COLOR, fontSize: 15),
                                      ),
                                    ),
                            ]),
                      ]),
                    ),
                  );
                })
            : CustomNoData(
                iconaddress: CARD,
              ));
  }
}
