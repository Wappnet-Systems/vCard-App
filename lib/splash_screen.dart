import 'package:flutter/material.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/screens/number_verification_Screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';

class SplashScreen extends StatefulWidget {
  final bool islogin;
  const SplashScreen({super.key, required this.islogin});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      widget.islogin
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboardscreen(),
              ),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Authmodual(),
              ),
            );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(
        children: [
          Container(
            height: hp(100, context),
            width: wp(100, context),
            decoration: const BoxDecoration(
              color: PRIMARY_COLOR,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [PRIMARY_COLOR, Colors.white, PRIMARY_COLOR]),
            ),
          ),
          Positioned(
            bottom: hp(20, context),
            top: hp(25, context),
            right: 0.0,
            left: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splash1.png",
                  height: hp(25, context),
                  width: wp(50, context),
                ),
                SizedBox(
                  height: hp(4, context),
                ),
                const Text(
                  "V Card",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: PRIMARY_COLOR,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
