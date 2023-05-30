import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GooglePlaceAutoCompleteTextField(
          textStyle: const TextStyle(fontSize: 12, color: blackColor),
          textEditingController: textEditingController,
          googleAPIKey: yourgoogleapikey,
          inputDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Address",
            labelStyle: TextStyle(color: grayColor, fontSize: 12),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
            hintText: "Address",
            hintStyle: TextStyle(
              color: grayColor,
              fontSize: 10,
            ),
            prefixIcon: Icon(Icons.location_on, color: grayColor),
            suffixIcon: null,
          ),
          debounceTime: 800,
          countries: const ["in", "fr"],
          isLatLngRequired: true,
          getPlaceDetailWithLatLng: (Prediction prediction) {},
          itmClick: itmClick),
    );
  }
}
