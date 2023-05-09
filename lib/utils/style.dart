// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../controllers/data_controllers.dart';

//Colors constants
const Color PRIMARY_COLOR = Color(0Xff60ab44);
const COLOR_PRIMARY_DARK = Color(0xff000000);
Color COLOR_PRIMARY_LIGHT = const Color(0xff000000).withOpacity(0.7);
const COLOR_BACKGROUND_DARK = Color(0xffF5F6FA);
const COLOR_SECONDARY = Color(0xffC4C4C4);
const Color BACKGROUND_COLOR = Color(0xffFFFFFF);
const Color WHITE_COLOR = Color(0XffFFFFFF);
const Color BLACK_COLOR = Colors.black;
const Color BLUE_COLOR = Color(0xff1d2e3e);

class Staticmembers {
  static List<Users> listofUsers = [];
}

enum AppTheme {
  CustomTheme,
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.CustomTheme: ThemeData.light().copyWith(
    primaryColor: PRIMARY_COLOR,
    primaryColorLight: COLOR_PRIMARY_LIGHT,
    primaryColorDark: COLOR_PRIMARY_DARK,
    secondaryHeaderColor: PRIMARY_COLOR.withOpacity(0.5),
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: COLOR_PRIMARY_LIGHT,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      labelColor: PRIMARY_COLOR,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryTextTheme:
        const TextTheme(titleSmall: TextStyle(color: COLOR_PRIMARY_DARK)),
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
  ),
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
  )
};
