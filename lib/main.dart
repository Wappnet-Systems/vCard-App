import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/login_screen.dart';
import 'package:vcard/utils/style.dart';
import 'screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final islogin = prefs.getBool('isLoggedIn') ?? false;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp(islogin: islogin)));
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCard',
      theme: appThemeData[AppTheme.CustomTheme],
      home: Container(
        decoration: const BoxDecoration(color: COLOR_WHITE),
        child: AnimatedSplashScreen(
          duration: 1500,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.transparent,
          splashIconSize: 300,
          animationDuration: const Duration(milliseconds: 1500),
          splash: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/splash1.png",
                  scale: 2.3,
                ),
                const SizedBox(height: 50),
                const Text(
                  "V Card",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: COLOR_PRIMARY_DARK,
                  ),
                ),
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
