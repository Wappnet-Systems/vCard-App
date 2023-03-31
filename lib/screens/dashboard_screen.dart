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

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
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
            return Card(
              color: Colors.amber,
              child: Column(children: [
                Text('${Staticmenbers.listofUsers[index].id}'),
                Text('${Staticmenbers.listofUsers[index].name}'),
                Text('${Staticmenbers.listofUsers[index].department}'),
                Text('${Staticmenbers.listofUsers[index].compeny}'),
                Text('${Staticmenbers.listofUsers[index].headline}'),
                Text('${Staticmenbers.listofUsers[index].whatsapp}'),
                Text('${Staticmenbers.listofUsers[index].telegram}'),
                Text('${Staticmenbers.listofUsers[index].snapchat}'),
                Text('${Staticmenbers.listofUsers[index].website}'),
                Text('${Staticmenbers.listofUsers[index].link}'),
                Text('${Staticmenbers.listofUsers[index].facebook}'),
                Text('${Staticmenbers.listofUsers[index].email}'),
                Text('${Staticmenbers.listofUsers[index].phone}'),
                Text('${Staticmenbers.listofUsers[index].address}'),
              ]),
            );
          }),
      bottomNavigationBar: CustomButtomBar(""),
      floatingActionButton: Customfloatingbuttom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
