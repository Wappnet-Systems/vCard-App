import 'package:flutter/material.dart';
import '../model/data_controllers.dart';

const String card = 'assets/lottie/No_Data.json';
const String qrJson = 'assets/lottie/QR.json';

//Google API Key
const yourgoogleapikey = 'AIzaSyDJbqVkRb6llQczHvPN_WnK4pGUGt30ykM';

// member list
class Staticmenbers {
  static List<Users> listofUsers = [];
  static List<Users> cardUsers = [];
}

// card color list
final colorList = [
  const Color(0xfff4d354),
  Colors.blue,
  const Color(0xffff9410),
  const Color(0xff56433d),
  const Color(0xffa82fed),
  const Color(0xff4A964E),
  const Color(0xff4c464e),
  const Color(0xffff3c02),
  const Color(0xff7ecbd5),
  const Color(0xff949a9f),
  const Color(0xfff6c028),
  const Color(0xff960001),
  const Color(0xffb5ca1d)
];

// create card image list
final imageList = [
  "assets/cards/card1.jpg",
  'assets/cards/card2.jpg',
  "assets/cards/card3.jpg",
  "assets/cards/card4.jpg"
];

// update card image list
final cardList = [
  "assets/cards/card1.jpg",
  'assets/cards/card2.jpg',
  "assets/cards/card3.jpg",
  "assets/cards/card4.jpg",
  "assets/cards/card5.jpg"
];
