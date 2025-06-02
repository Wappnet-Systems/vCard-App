// email validation

String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);

  if (value!.isEmpty) {
    return "Email is required.";
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

// number validation
String? numbervalidator(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "This field can't be Empty";
  } else if (regExp.hasMatch(value)) {
    return 'Please enter correct value';
  }
  return null;
}

// textvalidation
String? textvalidator(String? value, {String? message}) {
  if (value == null || value.isEmpty) {
    return message ?? "This field is required.";
  }

  RegExp regex = RegExp(r"^[A-Za-z\.\s]+$");
  if (!regex.hasMatch(value)) {
    return "Invalid format";
  }

  return null;
}

String? namevalidator(String? value, {String? message}) {
  if (value == null || value.isEmpty) {
    return message ?? "This field is required.";
  }

  RegExp regex = RegExp(r'^[a-zA-Z\s]+[a-zA-Z\s]+$');
  if (!regex.hasMatch(value)) {
    return "Please enter valide name";
  }

  return null;
}

// scanner screen validation
bool qrvalidateString(String input) {
  final alphanumericRegExp = RegExp(r'^[a-zA-Z0-9]+$');
  return alphanumericRegExp.hasMatch(input);
}
