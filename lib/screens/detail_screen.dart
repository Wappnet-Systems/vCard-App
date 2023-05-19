import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/update_card_screen.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/custom_loadingbar_widget.dart';
import '../widget/text_button_widget.dart';
import 'card_shere_screen.dart';
import 'contect_visiting_card.dart';
import 'dashboard_screen.dart';
import 'digital_visiting_card_screen.dart';

class Detailscreen extends StatefulWidget {
  final int? id;
  final int? contectid;
  const Detailscreen({super.key, this.id, this.contectid});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hp(20, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (widget.id != null)
                          ? Digitalvisitingcard(
                              id: widget.id,
                            )
                          : Contectvisitingcard(
                              contectid: widget.contectid,
                            )));
            },
            child: Container(
              height: hp(8, context),
              width: wp(17, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: grayColor),
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 22,
                      color: blackColor,
                    ),
                    Text(
                      "View",
                      style: TextStyle(color: blackColor, fontSize: 14),
                    )
                  ]),
            ),
          ),
          SizedBox(width: wp(2, context)),
          (widget.id != null)
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (ctx) => Cardsherescreen(
                              uid: FirebaseAuth.instance.currentUser?.uid,
                              cid: Staticmenbers.listofUsers[widget.id!].id,
                            ));
                  },
                  child: Container(
                    height: hp(8, context),
                    width: wp(17, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: grayColor),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_sharp,
                            size: 22,
                            color: blackColor,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(color: blackColor, fontSize: 14),
                          )
                        ]),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(width: wp(2, context)),
          (widget.id != null)
              ? InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Updatecardscreen(
                                id: Staticmenbers.listofUsers[widget.id!].id)));
                  },
                  child: Container(
                    height: hp(8, context),
                    width: wp(17, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: grayColor),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_document,
                            size: 22,
                            color: blackColor,
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(color: blackColor, fontSize: 14),
                          )
                        ]),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(width: wp(2, context)),
          InkWell(
            onTap: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: const RoundedRectangleBorder(
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
                      (isLoading)
                          ? const Custonloading()
                          : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButtomWidget(
                            onPressed: () {
                              (widget.id != null)
                                  ? setState(() {
                                      isLoading = true;
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid)
                                          .collection("Carddata")
                                          .doc(Staticmenbers
                                              .listofUsers[widget.id!].id)
                                          .delete()
                                          .then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Dashboardscreen(
                                                        index: 0)));
                                      });
                                    })
                                  : setState(() {
                                      isLoading = true;
                                      log("${Staticmenbers.cardUsers[widget.contectid!].id}");

                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid)
                                          .collection("Frind's cardJson")
                                          .doc(Staticmenbers
                                              .cardUsers[widget.contectid!].id)
                                          .delete()
                                          .then((value) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Dashboardscreen(
                                                      index: 2,
                                                    )));
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
                                          const Dashboardscreen(index: 0)));
                            },
                            title: 'Cancle',
                            fontSize: 15,
                            color: blueColor,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              });
            },
            child: Container(
              height: hp(8, context),
              width: wp(17, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: grayColor),
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 22,
                      color: blackColor,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(color: blackColor, fontSize: 14),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
