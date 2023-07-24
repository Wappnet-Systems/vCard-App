import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/contect_visiting_card/card_2.dart';
import 'package:vcard/widget/contect_visiting_card/card_3.dart';
import 'package:vcard/widget/contect_visiting_card/card_4.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/widget/custom_alartdialog.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../widget/contect_visiting_card/card_1.dart';
import '../widget/contect_visiting_card/defult_card.dart';

class Contectvisitingcard extends StatefulWidget {
  final int? contectid;
  const Contectvisitingcard({super.key, required this.contectid});

  @override
  State<Contectvisitingcard> createState() => _ContectvisitingcardState();
}

class _ContectvisitingcardState extends State<Contectvisitingcard> {
  int? contactcardindex;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    contactcardindex = widget.contectid;
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // card list
    List<Widget> cardList = [
      Contectcardtheme1(id: contactcardindex),
      Contectcardtheme2(id: contactcardindex),
      Contectcardtheme3(id: contactcardindex),
      Contectcardtheme4(id: contactcardindex),
      Contectdefultcard(id: contactcardindex)
    ];
    return Scaffold(
        appBar: Customappbarwidget(
          title: "${Staticmenbers.cardUsers[widget.contectid!].type}",
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => CustomAlartDialog(
                    title: Text(
                      "Delete",
                      textAlign: TextAlign.center,
                      style: smalltitleTextStyle.copyWith(
                          fontWeight: FontWeight.w600),
                    ),
                    content: Text(
                      "Are you sure you want to delete this card?",
                      selectionColor: COLOR_PRIMARY_LIGHT,
                      textAlign: TextAlign.center,
                      style: textMediumTextStyle.copyWith(
                          color: COLOR_PRIMARY_LIGHT),
                    ),
                    onPressedNo: () {
                      Navigator.pop(ctx);
                    },
                    onPressedYes: () {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection("Frind's card")
                          .doc(Staticmenbers.cardUsers[widget.contectid!].id)
                          .delete()
                          .then(
                        (value) {
                          Navigator.pushReplacement(
                            ctx,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Dashboardscreen(index: 2),
                              reverseTransitionDuration: Duration.zero,
                              transitionDuration: Duration.zero,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: wp(2, context),
                ),
                padding: EdgeInsets.all(wp(2, context)),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: const Icon(
                  Icons.delete_outline_outlined,
                  size: 22,
                  color: COLOR_WHITE,
                ),
              ),
            )
          ],
        ),
        body: cardList[Staticmenbers.cardUsers[widget.contectid!].card!]);
  }
}
