// import 'package:flutter/material.dart';
// import 'package:vcard/widget/text_button_widget.dart';
// import '../utils/constants_color.dart';
// import '../utils/responsive.dart';

// Future<int?> imagelist(context, selectedIndex, List<String> imageList) async {
//   int? cardresult = await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                   topLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20)),
//             ),
//             title: const Text("Card's"),
//             content: SizedBox(
//               height: hp(35, context),
//               width: wp(50, context),
//               child: GridView.builder(
//                   itemCount: imageList.length,
//                   scrollDirection: Axis.vertical,
//                   physics: const BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color:
//                                 selectedIndex == index ? blueColor : whiteColor,
//                             width: 4,
//                           ),
//                         ),
//                         child: Image(
//                           image: AssetImage(imageList[index]),
//                           height: hp(15, context),
//                         ),
//                       ),
//                     );
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 30,
//                       crossAxisSpacing: 20)),
//             ),
//             actions: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 8),
//                 child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                   TextButtomWidget(
//                     color: blueColor,
//                     fontSize: 20,
//                     onPressed: () {
//                       Navigator.pop(context, selectedIndex);
//                     },
//                     title: 'ok',
//                   ),
//                 ]),
//               )
//             ],
//           );
//         });
//       });

//   print("11111111111111result:$cardresult");
//   return cardresult;
// }

// Future<int?> showcolorlist(context, selectcolor, List<Color> colorList) async {
//   int? colorresult = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//                 topLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20)),
//           ),
//           title: const Text('Colors'),
//           content: SizedBox(
//             height: hp(35, context),
//             width: wp(55, context),
//             child: StatefulBuilder(
//               builder: (BuildContext context,
//                   void Function(void Function()) setState) {
//                 return GridView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: colorList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectcolor = index;
//                         });
//                       },
//                       child: Container(
//                         width: wp(5, context),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: selectcolor == index
//                                   ? blueColor
//                                   : bluegrayColor,
//                               width: 4,
//                             ),
//                             color: colorList[index],
//                             borderRadius: BorderRadius.circular(100)),
//                       ),
//                     );
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       mainAxisSpacing: 15,
//                       crossAxisSpacing: 10),
//                 );
//               },
//             ),
//           ),
//           actions: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                 TextButtomWidget(
//                   color: blueColor,
//                   fontSize: 20,
//                   onPressed: () {
//                     Navigator.pop(context, selectcolor);
//                   },
//                   title: 'ok',
//                 ),
//               ]),
//             )
//           ],
//         );
//       });
//   print("2222222222result:$colorresult");
//   return colorresult;
// }
