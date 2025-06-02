import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

class PhoneFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialCountryCode;
  final String? invalidNumberMessage;
  final void Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;
  const PhoneFieldWidget({
    this.controller,
    super.key,
    this.initialCountryCode,
    this.onChanged,
    this.onCountryChanged,
    this.invalidNumberMessage,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: COLOR_PRIMARY_DARK,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      invalidNumberMessage: invalidNumberMessage ?? "Invalid Mobile Number",
      cursorColor: COLOR_PRIMARY_DARK,
      controller: controller,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonMargin: EdgeInsets.only(
        left: wp(4, context),
      ),
      dropdownTextStyle: textSmallTextStyle.copyWith(color: COLOR_PRIMARY_DARK),
      style: textSmallTextStyle.copyWith(color: COLOR_PRIMARY_DARK),
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: COLOR_PRIMARY_LIGHT),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(2, context),
        ),
        hintStyle: textSmallTextStyle,
        labelStyle: textSmallTextStyle,
        hintText: "Phone Number",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: COLOR_PRIMARY_LIGHT),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: COLOR_PRIMARY_LIGHT),
        ),
      ),
      initialCountryCode: initialCountryCode ?? "IN",
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
    );
  }
}
