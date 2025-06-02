// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/textStyle.dart';

const Color COLOR_WHITE = Color(0Xfffcfdfd);
const Color COLOR_PRIMARY = Color(0xFF8EC5D4);
const Color COLOR_PRIMARY_DARK = Color(0xff1d2e3e);
const Color COLOR_PRIMARY_LIGHT = Color(0xff878d96);
const Color COLOR_YELLOW = Color(0xfff4d354);

enum AppTheme {
  CustomTheme,
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.CustomTheme: ThemeData.light().copyWith(
    primaryColor: COLOR_PRIMARY,
    primaryColorLight: COLOR_PRIMARY_LIGHT,
    primaryColorDark: COLOR_PRIMARY_DARK,
    secondaryHeaderColor: COLOR_PRIMARY.withOpacity(0.7),
    scaffoldBackgroundColor: COLOR_WHITE,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: COLOR_PRIMARY_LIGHT,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      labelColor: COLOR_PRIMARY,

      // labelStyle: textBodyStyle.copyWith(color: COLOR_PRIMARY),
      // unselectedLabelStyle: textBodyStyle.copyWith(color: COLOR_PRIMARY_LIGHT),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: COLOR_WHITE,
      foregroundColor: COLOR_WHITE,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: COLOR_WHITE,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: titleTextStyle.copyWith(fontWeight: FontWeight.w600),
      iconTheme: const IconThemeData(color: COLOR_PRIMARY_DARK),
      actionsIconTheme: const IconThemeData(color: COLOR_PRIMARY_DARK),
    ),
    iconTheme: const IconThemeData(color: COLOR_PRIMARY_DARK),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryTextTheme: const TextTheme(
        titleSmall: TextStyle(color: COLOR_PRIMARY_DARK, fontFamily: "Trajan")),
    colorScheme: const ColorScheme.light(
        primary: COLOR_PRIMARY,
        onPrimary: COLOR_WHITE,
        onSurface: COLOR_PRIMARY_DARK),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: COLOR_PRIMARY,
      ),
    ),
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
  ),
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
  )
};
