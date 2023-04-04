// import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:vcard/screens/dashboard_screen.dart';
// import 'package:vcard/utils/constants_color.dart';

// import 'intro_screen.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AnimatedSplashScreen(
//         duration: 1500,
//         splashTransition: SplashTransition.fadeTransition,
//         backgroundColor: PRIMARY_COLOR,
//         splashIconSize: 250,
//         animationDuration: Duration(milliseconds: 1500),
//         splash: Center(
//           child: Column(
//             children: [
//               Container(
//                 child: Image.asset(
//                   "assets/images/splash.png",
//                   height: 200,
//                   width: 200,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text("V Card",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: BACKGROUND_COLOR,
//                   ))
//             ],
//           ),
//         ),
//         nextScreen: IntroductionScreens(),
//         // nextScreen: widget.islogin!
//         //     ? Home(
//         //         id: index!,
//         //       )
//         //     : Login(),
//       ),
//     );
//   }
// }
