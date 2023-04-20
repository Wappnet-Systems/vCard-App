import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vcard/screens/create_card_screen.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/setting_screen.dart';
import 'package:vcard/screens/update_card_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/alart_dialog_widget.dart';
import 'package:vcard/widget/bottom_sheet.dart';
import 'package:vcard/widget/floating_action_button.dart';
import '../controllers/data_controllers.dart';
import '../widget/custom_no_data.dart';
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
            snapchat: e['Snapchat'],
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
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                color: BLUE_COLOR,
                                height: 360.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Work",
                                        style: TextStyle(
                                            fontSize: 20, color: WHITE_COLOR),
                                      ),
                                      Divider(
                                          color: PRIMARY_COLOR, thickness: 5),
                                      Row(
                                        children: [
                                          SizedBox(width: 17),
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
                                                              .listofUsers[
                                                                  index]
                                                              .id));
                                            },
                                            child: CardWidget(
                                              icon: Icons.send_sharp,
                                              data: "Send",
                                              data1: "Share via QR",
                                              data2: "email.",
                                            ),
                                          ),
                                          SizedBox(width: 10),
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
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 17),
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
                                          SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text(
                                                      "Are you sure you want to delete this card?"),
                                                  content: Text(''),
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
                                                                          builder: (context) =>
                                                                              Dashboardscreen()));
                                                                });
                                                              });
                                                              if (refresh ==
                                                                  true) {
                                                                changeData();
                                                              }
                                                            });
                                                          },
                                                          title: 'okey',
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        TextButtomWidget(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          title: 'Cancle',
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
                    child: Column(
                      children: [
                        SizedBox(height: 2.8),
                        Card(
                          color: PRIMARY_COLOR,
                          child: Column(children: [
                            Staticmenbers.listofUsers[index].image == ""
                                ? Image.asset(
                                    "assets/images/splash1.png",
                                    width: 175,
                                    height: 146,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    "${Staticmenbers.listofUsers[index].image}",
                                    width: 175,
                                    height: 146,
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
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: WHITE_COLOR,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                            SizedBox(height: 3),
                            Center(
                              child: Text(
                                '${Staticmenbers.listofUsers[index].type}',
                                style: TextStyle(color: WHITE_COLOR),
                              ),
                            ),
                            SizedBox(height: 3),
                          ]),
                        ),
                      ],
                    ),
                  );
                })
            : CustomNoData(
                iconaddress: CARD,
              ));
  }
}
