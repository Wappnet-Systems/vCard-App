import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/update_card_screen.dart';

import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/text_button_widget.dart';
import 'card_shere_screen.dart';
import 'dashboard_screen.dart';
import 'digital_visiting_card_screen.dart';

class Detailscreen extends StatefulWidget {
  int? id;
  Detailscreen({super.key, this.id});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: null,
      content: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Digitalvisitingcard(
                            id: widget.id,
                          )));
            },
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: WHITE_COLOR,
                    ),
                    Text(
                      "View",
                      style: TextStyle(color: WHITE_COLOR),
                    )
                  ]),
              height: hp(7, context),
              width: wp(15, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.amber),
            ),
          ),
          SizedBox(width: wp(2, context)),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => Cardsherescreen(
                        uid: FirebaseAuth.instance.currentUser?.uid,
                        cid: Staticmenbers.listofUsers[widget.id!].id,
                      ));
            },
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_sharp,
                      color: WHITE_COLOR,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: WHITE_COLOR),
                    )
                  ]),
              height: hp(7, context),
              width: wp(15, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
            ),
          ),
          SizedBox(width: wp(2, context)),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatecardscreen(
                          id: Staticmenbers.listofUsers[widget.id!].id)));
            },
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_document,
                      color: WHITE_COLOR,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(color: WHITE_COLOR),
                    )
                  ]),
              height: hp(7, context),
              width: wp(15, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurpleAccent),
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    title: const Text(
                        "Are you sure you want to delete this card?"),
                    content: null,
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButtomWidget(
                            onPressed: () {
                              setState(() {
                                log("${Staticmenbers.listofUsers[widget.id!].id}");
                                final refresh = FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .collection("Carddata")
                                    .doc(Staticmenbers
                                        .listofUsers[widget.id!].id)
                                    .delete()
                                    .then((value) {
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Dashboardscreen(
                                                  index: 0,
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
                                          Dashboardscreen(index: 0)));
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: WHITE_COLOR,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(color: WHITE_COLOR),
                    )
                  ]),
              height: hp(7, context),
              width: wp(15, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.lightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
