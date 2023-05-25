import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/utils/responsive.dart';
import 'screens/dashboard_screen.dart';
import 'utils/constants_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final islogin = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(islogin: islogin));
}

class MyApp extends StatefulWidget {
  final bool? islogin;
  const MyApp({
    super.key,
    this.islogin,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;
  bool? isDarkMode;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs!.getBool('isDarkMode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCard',
      theme: ThemeData(fontFamily: 'Trajan'),
      home: Container(
        decoration: const BoxDecoration(color: whiteColor),
        child: AnimatedSplashScreen(
          duration: 1500,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.transparent,
          splashIconSize: 250,
          animationDuration: const Duration(milliseconds: 1500),
          splash: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/splash1.png",
                  height: hp(25, context),
                  width: wp(130, context),
                ),
                SizedBox(height: hp(3, context)),
                const Text("V Card",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ))
              ],
            ),
          ),
          nextScreen: (widget.islogin == true)
              ? const Dashboardscreen(
                  index: 0,
                )
              : const Numberverification(),
        ),
      ),
    );
  }
}
