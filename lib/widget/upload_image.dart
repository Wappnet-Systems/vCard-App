import 'package:flutter/material.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

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
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(
        horizontal: wp(4, context),
        vertical: hp(2, context),
      ),
      actionsPadding: EdgeInsets.zero,
      content: Container(
        color: COLOR_WHITE,
        padding: const EdgeInsets.all(8.0),
        height: hp(20, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pic Image From",
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: hp(2, context),
            ),
            InkWell(
              onTap: onTapCamera,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(4, context),
                  vertical: hp(1, context),
                ),
                decoration: BoxDecoration(
                  color: COLOR_PRIMARY_DARK,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera,
                      size: 28,
                      color: COLOR_WHITE,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Text(
                      "CAMERA",
                      style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: hp(2, context),
            ),
            InkWell(
              onTap: onTapGallery,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(4, context),
                  vertical: hp(1, context),
                ),
                decoration: BoxDecoration(
                  color: COLOR_PRIMARY_DARK,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/gallery.png",
                      scale: 20,
                    ),
                    SizedBox(
                      width: wp(5, context),
                    ),
                    Text(
                      "GALLERY",
                      style: textMediumTextStyle.copyWith(color: COLOR_WHITE),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
