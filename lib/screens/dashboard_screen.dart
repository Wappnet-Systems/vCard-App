import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/alart_dialog_widget.dart';
import 'package:vcard/widget/bottom_sheet.dart';
import 'package:vcard/widget/buttombar.dart';
import 'package:vcard/widget/floating_action_button.dart';
import '../controllers/data_controllers.dart';
import '../widget/custom_no_data.dart';
import '../widget/text_button_widget.dart';
import 'digital_visiting_card.dart';
import 'update_card_screen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int? cardindex;
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
            image: e['images']))
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
          IconButton(onPressed: () async {}, icon: Icon(Icons.settings)),
        ],
        backgroundColor: PRIMARY_COLOR,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/splash.png"),
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
                  ),
                  itemCount: Staticmenbers.listofUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            cardindex = index;
                          });
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    height: 400.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Work",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              SizedBox(width: 17),
                                              CardWidget(
                                                icon: Icons.send_sharp,
                                                data: "Send",
                                                data1: "Share via QR",
                                                data2: "email.",
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
                                                    builder: (ctx) =>
                                                        AlertDialog(
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: BACKGROUND_COLOR,
                                offset: const Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: PRIMARY_COLOR,
                            child: Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: PRIMARY_COLOR, width: 5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: Image.network(
                                  "${Staticmenbers.listofUsers[index].image}",
                                  width: 130,
                                  height: 130,
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
                              ),
                              Text('${Staticmenbers.listofUsers[index].name}'),
                            ]),
                          ),
                        ),
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
