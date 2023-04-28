import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcard/screens/auth_modual.dart';
import 'screens/dashboard_screen.dart';
import 'utils/constants_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final islogin = await prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(islogin: islogin));
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class MyApp extends StatefulWidget {
  bool? islogin;
  MyApp({
    super.key,
    required this.islogin,
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
    bool isfirsttime = false;
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    print(isfirsttime);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCard',
      theme: ThemeData(fontFamily: 'Trajan'),
      home: AnimatedSplashScreen(
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: PRIMARY_COLOR,
        splashIconSize: 250,
        animationDuration: Duration(milliseconds: 1500),
        splash: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/splash1.png",
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 10),
              Text("V Card",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: BACKGROUND_COLOR,
                  ))
            ],
          ),
        ),
        nextScreen: (widget.islogin! == true)
            ? Dashboardscreen(
                index: 0,
              )
            : Authmodual(),
      ),
    );
  }
}
