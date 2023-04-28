import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/screens/create_card_screen.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/update_card_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/widget/bottom_sheet.dart';
import '../controllers/data_controllers.dart';
import '../widget/custom_no_data.dart';
import '../widget/decoration_widget.dart';
import '../widget/text_button_widget.dart';
import 'app_shere_screen.dart';
import 'card_shere_screen.dart';
import 'digital_visiting_card.dart';

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
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
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
          title: const Text("Cards"),
          backgroundColor: PRIMARY_COLOR,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
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
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/splash1.png"),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Staticmenbers.listofUsers.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: .001,
                  crossAxisSpacing: .001,
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
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: BLUE_COLOR,
                                ),
                                height: hp(50, context),
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
                                      Row(
                                        children: [
                                          SizedBox(width: wp(7, context)),
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    25.0)),
                                                  ),
                                                  builder: (BuildContext
                                                          context) =>
                                                      CardGenerateQR(
                                                        uid: FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.uid,
                                                        cid: Staticmenbers
                                                            .listofUsers[index]
                                                            .id,
                                                      ));
                                            },
                                            child: CardWidget(
                                              icon: Icons.send_sharp,
                                              data: "Send",
                                              data1: "Share via QR",
                                              data2: "",
                                            ),
                                          ),
                                          SizedBox(width: wp(3, context)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Digitalvisitingcard(
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
                                        ],
                                      ),
                                      SizedBox(height: hp(1, context)),
                                      Row(
                                        children: [
                                          SizedBox(width: wp(7, context)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Updatecardscreen(
                                                              id: Staticmenbers
                                                                  .listofUsers[
                                                                      index]
                                                                  .id)));
                                            },
                                            child: CardWidget(
                                              icon: Icons.edit,
                                              data: "Edit",
                                              data1: "Customize your",
                                              data2: "business card.",
                                            ),
                                          ),
                                          SizedBox(width: wp(3, context)),
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
                                                          MainAxisAlignment.end,
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
                                                                      "Carddata")
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
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Dashboardscreen(
                                                                                index: 0,
                                                                              )));
                                                                });
                                                              });
                                                              if (refresh ==
                                                                  true) {
                                                                changeData();
                                                              }
                                                            });
                                                          },
                                                          title: 'Okey',
                                                          fontSize: 15,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        TextButtomWidget(
                                                          onPressed: () {
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        Dashboardscreen(
                                                                            index:
                                                                                2)));
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
                        boxShadow: [
                          BoxShadow(
                            color: WHITE_COLOR,
                            blurRadius: 20.0,
                          ),
                        ],
                        color: PRIMARY_COLOR,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: wp(2.5, context),
                          vertical: hp(0.5, context)),
                      child: Column(children: [
                        Staticmenbers.listofUsers[index].image == ""
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
