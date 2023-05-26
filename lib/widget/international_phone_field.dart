// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// import '../utils/constants_color.dart';

// class InternationalPhoneField extends StatelessWidget {
//   final TextEditingController? controller;
//   dynamic Function()? onCountryChanged;
//   const InternationalPhoneField(
//       {super.key, required this.controller, required dynamic.onCountryChanged});

//   @override
//   Widget build(BuildContext context) {
//     return IntlPhoneField(
//         dropdownIcon: const Icon(
//           Icons.arrow_drop_down,
//           color: blueColor,
//         ),
//         disableLengthCheck: false,
//         cursorColor: blueColor,
//         controller: controller,
//         decoration: const InputDecoration(
//           counterText: '',
//           focusedBorder:
//               OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
//           contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
//           hintStyle: TextStyle(
//             color: grayColor,
//             fontWeight: FontWeight.w400,
//             fontSize: 10,
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(),
//           ),
//         ),
//         initialCountryCode: 'IN',
//         onChanged: (phone) {
//           log(phone.completeNumber);
//         },
//         onCountryChanged: onCountryChanged!);
//   }
// }
