import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: SplashScreen(islogin: widget.islogin!),
    );
  }
}
