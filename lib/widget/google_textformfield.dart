import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/string.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../utils/style.dart';

class PlacesAutoCompleteTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  const PlacesAutoCompleteTextField(
      {super.key, required this.hint, required this.textEditingController});

  @override
  State<PlacesAutoCompleteTextField> createState() =>
      _PlacesAutoCompleteTextFieldState();
}

class _PlacesAutoCompleteTextFieldState
    extends State<PlacesAutoCompleteTextField> {
  FToast? fToast;
  final _formfield = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(widget.hint!),
        content: Form(
          key: _formfield,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GooglePlaceAutoCompleteTextField(
                    textEditingController: widget.textEditingController!,
                    googleAPIKey: YOUR_GOOGLE_API_KEY,
                    inputDecoration: InputDecoration(
                      hintText: "Add your location",
                      icon: const Icon(
                        Icons.add_location_alt_rounded,
                        color: PRIMARY_COLOR,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: BLUE_COLOR),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: BLUE_COLOR),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: COLOR_PRIMARY_LIGHT.withOpacity(0.6)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: wp(2, context), vertical: hp(2, context)),
                      hintStyle: TextStyle(
                        color: COLOR_PRIMARY_LIGHT.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    debounceTime: 800,
                    countries: const ["in", "fr"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      log("placeDetails:${prediction.lng}");
                    },
                    itmClick: (Prediction prediction) {
                      widget.textEditingController!.text =
                          prediction.description!;

                      widget.textEditingController!.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: prediction.description!.length));
                    }),
                SizedBox(
                  height: hp(4, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: TextButtomWidget(
                        height: hp(6, context),
                        fontSize: 14,
                        onPressed: () {
                          setState(() {
                            if (_formfield.currentState!.validate()) {
                              try {
                                Navigator.pop(context, true);
                                displayCustomToast();
                              } catch (e) {
                                log("Error:$e");
                              }
                            }
                          });
                        },
                        title: 'Save',
                        color: PRIMARY_COLOR,
                      ),
                    ),
                    SizedBox(
                      width: wp(4, context),
                    ),
                    Flexible(
                      child: TextButtomWidget(
                        height: hp(6, context),
                        fontSize: 14,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Cancle',
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }

  displayCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: WHITE_COLOR,
      ),
      child: Text(
        "Add Successfully ${widget.hint!}",
        style: TextStyle(color: PRIMARY_COLOR),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
