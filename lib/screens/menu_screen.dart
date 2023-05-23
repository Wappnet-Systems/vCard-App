import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/update_card_screen.dart';
import '../utils/constants_color.dart';
import '../utils/responsive.dart';
import '../widget/custom_bottom _card.dart';
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
    return Wrap(
      children: [
        Container(
            padding: EdgeInsets.only(
              bottom: hp(2, context),
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: whiteColor,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: hp(2, context),
                  ),
                  const Text(
                    "Menu",
                    style: TextStyle(fontSize: 20, color: blueColor),
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(6.7, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: const CardWidget(
                            icon: Icons.remove_red_eye,
                            data: "View",
                            data1: "Open your card",
                            data2: "in vCard.",
                          ),
                        ),
                        SizedBox(width: wp(3, context)),
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
                                                            .instance
                                                            .currentUser
                                                            ?.uid)
                                                        .collection("Carddata")
                                                        .doc(Staticmenbers
                                                            .listofUsers[
                                                                widget.id!]
                                                            .id)
                                                        .delete()
                                                        .then((value) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Dashboardscreen(
                                                                      index:
                                                                          0)));
                                                    });
                                                  })
                                                : setState(() {
                                                    isLoading = true;
                                                    log("${Staticmenbers.cardUsers[widget.contectid!].id}");

                                                    FirebaseFirestore.instance
                                                        .collection("users")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.uid)
                                                        .collection(
                                                            "Frind's card")
                                                        .doc(Staticmenbers
                                                            .cardUsers[widget
                                                                .contectid!]
                                                            .id)
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
                                                        const Dashboardscreen(
                                                            index: 0)));
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
                          child: const CardWidget(
                            icon: Icons.delete,
                            data: "Delete",
                            data1: "Delete your",
                            data2: "Card.",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: hp(2, context)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(6.7, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (widget.id != null)
                            ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Updatecardscreen(
                                                  id: Staticmenbers
                                                      .listofUsers[widget.id!]
                                                      .id)));
                                },
                                child: const CardWidget(
                                  icon: Icons.edit,
                                  data: "Edit",
                                  data1: "Customize your",
                                  data2: "business card.",
                                ),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(width: wp(3, context)),
                        (widget.id != null)
                            ? InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => Cardsherescreen(
                                            uid: FirebaseAuth
                                                .instance.currentUser?.uid,
                                            cid: Staticmenbers
                                                .listofUsers[widget.id!].id,
                                          ));
                                },
                                child: const CardWidget(
                                  icon: Icons.send_sharp,
                                  data: "Send",
                                  data1: "Share via QR",
                                  data2: "",
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
