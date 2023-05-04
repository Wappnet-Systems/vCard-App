import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width * 2.5, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(
        size.width / 2, 0); // moving to topCenter 1st, then draw the path
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, size.height * .75);
    path.lineTo(size.width * .5, size.height);
    path.lineTo(0, size.height * .75);
    path.lineTo(0, size.height * .25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath3 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.width * 5);
    path.lineTo(size.width * 3, 0);
    path.lineTo(0, size.width / 1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
