import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/create_card_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../widget/custom_no_data_widget.dart';
import 'app_shere_screen.dart';
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
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: Customappbarwidget(
            title: "Card",
            actions: [
              Padding(
                padding:
                    EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
                child: InkWell(
                    onTap: () async {
                      final refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Createcardscreen()));
                      log("refresh:$refresh");
                      if (refresh == true) {
                        changeData();
                      }
                    },
                    child: Icon(Icons.add, size: 40)),
              )
            ],
            leading: Padding(
              padding: EdgeInsets.only(top: 11, left: 10, bottom: 5, right: 7),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      builder: (BuildContext context) => GenerateQR());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: WHITE_COLOR,
                      width: wp(0.3, context),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/splash1.png"),
                  ),
                ),
              ),
            )),
        body: Staticmenbers.listofUsers.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.all(10),
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
                      final refresh = await showDialog(
                          context: context,
                          builder: (ctx) => Detailscreen(id: cardindex));
                      log("refresh1:$refresh");
                      if (refresh == true) {
                        changeData();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            topRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Staticmenbers.listofUsers[index].color == ""
                                ? colorList[
                                    Staticmenbers.listofUsers[index].color!]
                                : PRIMARY_COLOR,
                            blurRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Color(0xffc1c4be),
                            blurRadius: 20.0,
                          ),
                        ],
                        color: Staticmenbers.listofUsers[index].color == ""
                            ? colorList[Staticmenbers.listofUsers[index].color!]
                            : PRIMARY_COLOR,
                      ),
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: 10, bottom: 5),
                      child: Column(children: [
                        Staticmenbers.listofUsers[index].image == ""
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(45),
                                    topRight: Radius.circular(50)),
                                child: Image.asset(
                                  "assets/images/splash1.png",
                                  width: wp(42, context),
                                  height: hp(17, context),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(45),
                                    topRight: Radius.circular(50)),
                                child: Image.network(
                                  "${Staticmenbers.listofUsers[index].image}",
                                  width: wp(42, context),
                                  height: hp(17, context),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Center(
                            child: Text(
                              '${Staticmenbers.listofUsers[index].type}',
                              style:
                                  TextStyle(color: WHITE_COLOR, fontSize: 16),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                })
            : CustomNoData(
                iconaddress: CARD,
              ));
  }
}
