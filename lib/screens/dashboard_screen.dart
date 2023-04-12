import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/screens/setting_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/alart_dialog_widget.dart';
import 'package:vcard/widget/bottom_sheet.dart';
import 'package:vcard/widget/buttombar.dart';
import 'package:vcard/widget/floating_action_button.dart';
import '../controllers/data_controllers.dart';
import '../widget/custom_no_data.dart';
import '../widget/text_button_widget.dart';
import 'app_shere_screen.dart';
import 'card_shere_screen.dart';
import 'digital_visiting_card.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int? cardindex;
  Future<void> getSingleUserData() async {
    // String abc= FirebaseAuth.instance.currentUser?.uid;
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
      Staticmenbers.listofUsers = userData;
    });

    print(
        "Staticmenbers.listofUsers.length : ${Staticmenbers.listofUsers.length}");
  }

  @override
  void initState() {
    getSingleUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DashBoard"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting_Screen()));
              },
              icon: Icon(Icons.settings)),
        ],
        backgroundColor: PRIMARY_COLOR,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GenerateQR()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/splash1.png"),
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Staticmenbers.listofUsers.length == 0
          ? CustomNoData(
              iconaddress: CARD,
            )
          : RefreshIndicator(
              onRefresh: () async {
                initState();
              },
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: .001,
                    crossAxisSpacing: .001,
                  ),
                  itemCount: Staticmenbers.listofUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("index $index");
                    return InkWell(
                      onTap: () {
                        setState(() {
                          cardindex = index;
                        });
                        showModalBottomSheet(
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CardGenerateQR(
                                                                uid: FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    ?.uid,
                                                                cid: Staticmenbers
                                                                    .listofUsers[
                                                                        index]
                                                                    .id)));
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
                                            CardWidget(
                                              icon: Icons.edit,
                                              data: "Edit",
                                              data1: "Customize your",
                                              data2: "business card.",
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
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              log("${Staticmenbers.listofUsers[index].id}");
                                                              FirebaseFirestore
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
                                                                  .delete();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            title: 'okey',
                                                            color:
                                                                PRIMARY_COLOR,
                                                          ),
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Dashboardscreen()));
                                                            },
                                                            title: 'Cancle',
                                                            color: Colors
                                                                .redAccent,
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
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 2.8),
                          Card(
                            color: PRIMARY_COLOR,
                            child: Column(children: [
                              Image.network(
                                "${Staticmenbers.listofUsers[index].image}",
                                width: 175,
                                height: 147,
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
                  }),
            ),
      bottomNavigationBar: CustomButtomBar(""),
      floatingActionButton: Customfloatingbuttom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
