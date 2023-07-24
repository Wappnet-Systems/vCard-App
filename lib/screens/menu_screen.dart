// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vcard/screens/update_card_screen.dart';
// import 'package:vcard/utils/style.dart';
// import 'package:vcard/utils/textStyle.dart';
// import 'package:vcard/widget/custom_alartdialog.dart';
// import '../utils/constants.dart';
// import '../utils/responsive.dart';
// import '../widget/custom_bottom _card.dart';
// import 'card_shere_screen.dart';
// import 'contect_visiting_card.dart';
// import 'dashboard_screen.dart';
// import 'digital_visiting_card_screen.dart';

// class Menuscreen extends StatefulWidget {
//   final int? id;
//   final int? contectid;
//   const Menuscreen({super.key, this.id, this.contectid});

//   @override
//   State<Menuscreen> createState() => _MenuscreenState();
// }

// class _MenuscreenState extends State<Menuscreen> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(
//             vertical: hp(3, context),
//             horizontal: wp(6, context),
//           ),
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//             color: COLOR_WHITE,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Menu",
//                 style: titleTextStyle,
//               ),
//               SizedBox(
//                 height: hp(2, context),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   // show card
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => (widget.id != null)
//                               ? Digitalvisitingcard(
//                                   id: widget.id,
//                                 )
//                               : Contectvisitingcard(
//                                   contectid: widget.contectid,
//                                 ),
//                         ),
//                       );
//                     },
//                     child: const CardWidget(
//                       icon: Icons.remove_red_eye,
//                       data: "View",
//                       data1: "Open your card in vCard.",
//                     ),
//                   ),

//                   // remove card
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Future.delayed(const Duration(milliseconds: 100), () {
//                         showDialog(
//                           context: context,
//                           builder: (ctx) => CustomAlartDialog(
//                             title: Text(
//                               "Delete",
//                               textAlign: TextAlign.center,
//                               style: smalltitleTextStyle.copyWith(
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             content: Text(
//                               "Are you sure you want to delete this card?",
//                               selectionColor: COLOR_PRIMARY_LIGHT,
//                               textAlign: TextAlign.center,
//                               style: textMediumTextStyle.copyWith(
//                                   color: COLOR_PRIMARY_LIGHT),
//                             ),
//                             onPressedNo: () {
//                               Navigator.pop(ctx);
//                             },
//                             onPressedYes: () {
//                               isLoading = true;
//                               widget.id != null
//                                   ? FirebaseFirestore.instance
//                                       .collection("users")
//                                       .doc(FirebaseAuth
//                                           .instance.currentUser?.uid)
//                                       .collection("Carddata")
//                                       .doc(Staticmenbers
//                                           .listofUsers[widget.id!].id)
//                                       .delete()
//                                       .then(
//                                       (value) {
//                                         Navigator.push(
//                                           ctx,
//                                           PageRouteBuilder(
//                                             pageBuilder: (context, animation,
//                                                     secondaryAnimation) =>
//                                                 const Dashboardscreen(index: 0),
//                                             reverseTransitionDuration:
//                                                 Duration.zero,
//                                             transitionDuration: Duration.zero,
//                                           ),
//                                         );
//                                       },
//                                     )
//                                   : FirebaseFirestore.instance
//                                       .collection("users")
//                                       .doc(FirebaseAuth
//                                           .instance.currentUser?.uid)
//                                       .collection("Frind's card")
//                                       .doc(Staticmenbers
//                                           .cardUsers[widget.contectid!].id)
//                                       .delete()
//                                       .then(
//                                       (value) {
//                                         Navigator.pushReplacement(
//                                           ctx,
//                                           PageRouteBuilder(
//                                             pageBuilder: (context, animation,
//                                                     secondaryAnimation) =>
//                                                 const Dashboardscreen(index: 2),
//                                             reverseTransitionDuration:
//                                                 Duration.zero,
//                                             transitionDuration: Duration.zero,
//                                           ),
//                                         );
//                                       },
//                                     );
//                             },
//                           ),
//                         );
//                       });
//                     },
//                     child: const CardWidget(
//                       icon: Icons.delete,
//                       data: "Delete",
//                       data1: "Delete your Card",
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: hp(3, context),
//               ),
//               // update card
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   (widget.id != null)
//                       ? InkWell(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Updatecardscreen(
//                                   id: Staticmenbers.listofUsers[widget.id!].id,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: const CardWidget(
//                             icon: Icons.edit,
//                             data: "Edit",
//                             data1: "Customize your business card.",
//                           ),
//                         )
//                       : const SizedBox.shrink(),

//                   // share user Card
//                   (widget.id != null)
//                       ? InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                             showDialog(
//                               context: context,
//                               builder: (ctx) => Cardsherescreen(
//                                 uid: FirebaseAuth.instance.currentUser?.uid,
//                                 cid: Staticmenbers.listofUsers[widget.id!].id,
//                               ),
//                             );
//                           },
//                           child: const CardWidget(
//                             icon: Icons.send_sharp,
//                             data: "Send",
//                             data1: "Share via QR",
//                           ),
//                         )
//                       : const SizedBox.shrink(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
