import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/buttombar.dart';
import 'package:vcard/widget/floating_action_button.dart';
import '../controllers/data_controllers.dart';
import 'digital_visiting_card.dart';

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
            id: e['id']))
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
      body: GridView.builder(
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                        Container(
                                          height: 140,
                                          width: 150,
                                          child: Card(
                                            color: PRIMARY_COLOR,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 10),
                                                  Icon(
                                                    Icons.send_sharp,
                                                    color: WHITE_COLOR,
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Send",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Share via QR,",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  Text(
                                                    "email.",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  )
                                                ],
                                              ),
                                            ),
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
                                          child: Container(
                                            height: 140,
                                            width: 150,
                                            child: Card(
                                              color: PRIMARY_COLOR,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Icon(
                                                      Icons.remove_red_eye,
                                                      color: WHITE_COLOR,
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "View",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: WHITE_COLOR),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "Open your card",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: WHITE_COLOR),
                                                    ),
                                                    Text(
                                                      "in vCard.",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: WHITE_COLOR),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 140,
                                          width: 150,
                                          child: Card(
                                            color: PRIMARY_COLOR,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 10),
                                                  Icon(
                                                    Icons.edit,
                                                    color: WHITE_COLOR,
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Customize your",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  Text(
                                                    "business card.",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 140,
                                          width: 150,
                                          child: Card(
                                            color: PRIMARY_COLOR,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 10),
                                                  Icon(
                                                    Icons.delete,
                                                    color: WHITE_COLOR,
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Delete your",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  ),
                                                  Text(
                                                    "Card.",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: WHITE_COLOR),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        );
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
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                  ), //BoxDecoration
                  child: Card(
                    color: Colors.amber,
                    child: Column(children: [
                      Image.asset(
                        "assets/images/splash1.png",
                        scale: 4,
                      ),
                      Text('${Staticmenbers.listofUsers[index].name}'),
                    ]),
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: CustomButtomBar(""),
      floatingActionButton: Customfloatingbuttom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
