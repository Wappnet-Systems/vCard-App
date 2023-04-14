import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);

  if (value!.isEmpty) {
    return 'Please this field must be filled';
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? numbervalidator(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  RegExp regExp = new RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please this field must be filled';
  } else if (regExp.hasMatch(value)) {
    return 'Please enter correct value';
  }
  return null;
}

String? textvalidator(String? value) {
  bool passwordValid = RegExp(
          r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-z0-9]+\.[a-zA-Z0-9]+")
      .hasMatch(value!);
  if (value.isEmpty) {
    return "this field can't be Empty";
  }
}
