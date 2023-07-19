import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcard/screens/update_card_screen.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/text_widget.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widget/custom_bottom _card.dart';
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
              color: COLOR_WHITE,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Text(
                    "Menu",
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: hp(2, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(6.7, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // show card
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
                        // remove card
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop;
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => CustomAlartDialog(
                                        title: const Textwidget(
                                            textAlign: TextAlign.center,
                                            text: "Delete"),
                                        content: const Textwidget(
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          text:
                                              "Are you sure you want to delete this card?",
                                          selectionColor: COLOR_PRIMARY_LIGHT,
                                        ),
                                        onPressedNo: () {
                                          Navigator.pop(context);
                                        },
                                        onPressedYes: () {
                                          (widget.id != null)
                                              ? setState(() {
                                                  isLoading = true;
                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser?.uid)
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
                                                                    index: 0)));
                                                  });
                                                })
                                              : setState(() {
                                                  isLoading = true;
                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser?.uid)
                                                      .collection(
                                                          "Frind's card")
                                                      .doc(Staticmenbers
                                                          .cardUsers[
                                                              widget.contectid!]
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
                                      ));
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
                  // update card
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
                        // share user Card
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
