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

class Menuscreen extends StatefulWidget {
  final int? id;
  final int? contectid;
  const Menuscreen({super.key, this.id, this.contectid});

  @override
  State<Menuscreen> createState() => _MenuscreenState();
}

class _MenuscreenState extends State<Menuscreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: (widget.id != null) ? hp(45, context) : hp(30, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Menu",
            style: TextStyle(color: blackColor, fontSize: 16),
          ),
          SizedBox(height: hp(2, context)),
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
              padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(10)),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(
                  Icons.remove_red_eye,
                  size: 35,
                  color: whiteColor,
                ),
                SizedBox(width: wp(10, context)),
                const Text(
                  "View",
                  style: TextStyle(color: whiteColor, fontSize: 16),
                )
              ]),
            ),
          ),
          (widget.id != null)
              ? SizedBox(height: hp(2, context))
              : const SizedBox.shrink(),
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
                    padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.share_sharp,
                            size: 35,
                            color: whiteColor,
                          ),
                          SizedBox(width: wp(10, context)),
                          const Text(
                            "Share",
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          )
                        ]),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(height: hp(2, context)),
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
                    padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.edit_document,
                            size: 35,
                            color: whiteColor,
                          ),
                          SizedBox(width: wp(10, context)),
                          const Text(
                            "Edit",
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          )
                        ]),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(height: hp(2, context)),
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
                                          .collection("Frind's card")
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
              padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(10)),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(
                  Icons.delete,
                  size: 35,
                  color: whiteColor,
                ),
                SizedBox(width: wp(10, context)),
                const Text(
                  "Delete",
                  style: TextStyle(color: whiteColor, fontSize: 16),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
