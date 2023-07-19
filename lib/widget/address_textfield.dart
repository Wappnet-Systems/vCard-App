import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

import '../utils/constants.dart';

class Addresstextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final InputBorder? focusedBorder;
  final Function(Prediction)? itmClick;
  const Addresstextfield(
      {super.key,
      required this.textEditingController,
      required this.itmClick,
      this.focusedBorder});

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
        textStyle: textSmallTextStyle.copyWith(color: COLOR_PRIMARY_DARK),
        textEditingController: textEditingController,
        googleAPIKey: yourgoogleapikey,
        inputDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: COLOR_PRIMARY_LIGHT,
            ),
          ),
          labelText: "Address",
          labelStyle: textSmallTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: COLOR_PRIMARY_LIGHT,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: COLOR_PRIMARY_LIGHT,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
          hintText: "Address",
          hintStyle: textSmallTextStyle,
          prefixIcon: const Icon(Icons.location_on, color: COLOR_PRIMARY_LIGHT),
        ),
        debounceTime: 800,
        countries: const ["in", "fr"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {},
        itmClick: itmClick);
  }
}
