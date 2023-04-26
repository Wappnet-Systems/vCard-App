import 'package:flutter/cupertino.dart';

double hp(percentage, context) {
  final result = (MediaQuery.of(context).size.height * percentage) / 100;
  return result;
}

double wp(percentage, context) {
  final result = (MediaQuery.of(context).size.width * percentage) / 100;
  return result;
}

double dp(size, context) {
  return size * MediaQuery.textScaleFactorOf(context);
}
