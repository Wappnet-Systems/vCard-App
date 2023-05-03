import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:vcard/widget/text_button_widget.dart';
import '../utils/constants_color.dart';

class placesAutoCompleteTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  placesAutoCompleteTextField(
      {super.key, required this.hint, required this.textEditingController});

  @override
  State<placesAutoCompleteTextField> createState() =>
      _placesAutoCompleteTextFieldState();
}

class _placesAutoCompleteTextFieldState
    extends State<placesAutoCompleteTextField> {
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
                    inputDecoration: const InputDecoration(
                      hintText: "Add your location",
                      icon: Icon(
                        Icons.add_location_alt_rounded,
                        color: PRIMARY_COLOR,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                      hintStyle: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    debounceTime: 800,
                    countries: ["in", "fr"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails" + prediction.lng.toString());
                    },
                    itmClick: (Prediction prediction) {
                      widget.textEditingController!.text =
                          prediction.description!;

                      widget.textEditingController!.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: prediction.description!.length));
                    }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButtomWidget(
                      onPressed: () {
                        setState(() {
                          if (_formfield.currentState!.validate()) {
                            try {
                              Navigator.pop(context, true);
                              displayCustomToast();
                            } catch (e) {
                              return null;
                            }
                          }
                        });
                      },
                      title: 'Save',
                      fontSize: 15,
                      color: PRIMARY_COLOR,
                    ),
                    TextButtomWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancle',
                      fontSize: 13,
                      color: Colors.redAccent,
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
