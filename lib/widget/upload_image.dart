import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/responsive.dart';

class Uploadimage extends StatelessWidget {
  final Function()? onTapCamera;
  final Function()? onTapGallery;
  const Uploadimage(
      {super.key, required this.onTapCamera, required this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      content: Container(
        color: whiteColor,
        height: hp(22, context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Pic Image From",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: blueColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: hp(2, context),
              ),
              InkWell(
                onTap: onTapCamera,
                child: Container(
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Icon(
                            Icons.camera,
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(width: wp(5, context)),
                        const Text(
                          "CAMERA",
                          style: TextStyle(color: whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: hp(2, context)),
              InkWell(
                onTap: onTapGallery,
                child: Container(
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Image.asset(
                            "assets/icon/gallery.png",
                            scale: 20,
                          )),
                      SizedBox(width: wp(5, context)),
                      const Text("GALLERY", style: TextStyle(color: whiteColor))
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
