// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../utils/constants_color.dart';

// class Customappbar extends StatelessWidget with PreferredSizeWidget {
//   final Size preferredSize;
//   final String title;
//   String leadingicon;
//   List<Widget>? actions;
//   Customappbar(
//     this.title,
//     this.leadingicon,
//   ) : preferredSize = Size.fromHeight(50.0);

//   // final Widget? title;
//   // final List<Widget>? actions;
//   // final Color? backgroundColor;
//   // // final TextStyle? titleTextStyle;
//   // final SystemUiOverlayStyle? systemOverlayStyle;
//   // final Widget? leading;
//   // final bool? centerTitle;
//   // Customappbar(
//   //     {
//   //     // required this.appBar,
//   //     this.title,
//   //     this.actions,
//   //     this.backgroundColor,
//   //     // this.titleTextStyle,
//   //     this.systemOverlayStyle,
//   //     this.leading,
//   //     this.centerTitle});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       title: Text("$title"),
//       actions: <Widget>[],
//       backgroundColor: PRIMARY_COLOR,
//       leading: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           backgroundImage: AssetImage('$leadingicon'),
//         ),
//       ),
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//     );
//   }
// }
