import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/auth_modual.dart';
import 'package:vcard/screens/dashboard_screen.dart';
import 'package:vcard/splash_screen.dart';
import 'utils/style.dart';

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
    required this.islogin,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isfirsttime = false;
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
        // For iOS (dark icons)
      ),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VCard',
        theme: appThemeData[AppTheme.CustomTheme],
        home: SplashScreen(islogin: widget.islogin!)
        //  AnimatedSplashScreen(
        //   duration: 1500,
        //   splashTransition: SplashTransition.fadeTransition,
        //   backgroundColor: PRIMARY_COLOR,
        //   splashIconSize: 250,
        //   animationDuration: const Duration(milliseconds: 1500),
        //   splash: Center(
        //     child: Column(
        //       children: [
        //         Image.asset(
        //           "assets/images/splash1.png",
        //           height: 200,
        //           width: 200,
        //         ),
        //         const SizedBox(height: 10),
        //         const Text("V Card",
        //             style: TextStyle(
        //               fontSize: 30,
        //               fontWeight: FontWeight.bold,
        //               color: BACKGROUND_COLOR,
        //             ))
        //       ],
        //     ),
        //   ),
        //   nextScreen: (widget.islogin! == true)
        //       ? Dashboardscreen(
        //           index: 0,
        //         )
        //       : Authmodual(),
        // ),
        );
  }
}
