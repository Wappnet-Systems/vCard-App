String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);

  if (value!.isEmpty) {
    return "this field can't be Empty";
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? numbervalidator(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "this field can't be Empty";
  } else if (regExp.hasMatch(value)) {
    return 'Please enter correct value';
  }
  return null;
}

String? textvalidator(String? value) {
  RegExp(r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-z0-9]+\.[a-zA-Z0-9]+")
      .hasMatch(value!);
  if (value.isEmpty) {
    return "this field can't be Empty";
  }
  return null;
}

String? hasValidUrl(String? value) {
  String pattern =
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please enter https://';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid url';
  }
  return null;
}
