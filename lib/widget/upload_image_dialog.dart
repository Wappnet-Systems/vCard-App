import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

void imagePicker(context,
    {required void Function() cameraOnPressed, galleryOnPressed}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: WHITE_COLOR,
      iconPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: wp(10, context),
          ),
          const Text(
            "Upload Image",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: PRIMARY_COLOR),
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
              color: PRIMARY_COLOR,
              size: 25,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: wp(6, context)),
      content: SizedBox(
        height: hp(27, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Upload photo from your gallery\n or take a new photo.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: COLOR_PRIMARY_LIGHT.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: hp(2, context),
            ),
            TextButtomWidget(
              onPressed: cameraOnPressed,
              icon: Padding(
                padding: EdgeInsets.only(
                  right: wp(3, context),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.camera_enhance_rounded,
                    color: WHITE_COLOR,
                    size: 22,
                  ),
                ),
              ),
              title: "Take a new photo",
              fontSize: 15,
              height: hp(6.5, context),
              width: wp(50, context),
            ),
            SizedBox(
              height: hp(3, context),
            ),
            TextButtomWidget(
              onPressed: galleryOnPressed,
              icon: Padding(
                padding: EdgeInsets.only(
                  right: wp(2, context),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.file_upload_rounded,
                    color: WHITE_COLOR,
                    size: 22,
                  ),
                ),
              ),
              title: "Upload from gallery",
              fontSize: 15,
              height: hp(6.5, context),
              width: wp(50, context),
            ),
            SizedBox(
              height: hp(2, context),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<int?> showimagelist(
    context, selectedIndex, List<String> imageList) async {
  int? result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Card Theme",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: COLOR_PRIMARY_DARK,
          ),
        ),
        titlePadding: EdgeInsets.only(
          right: wp(4, context),
          left: wp(4, context),
          top: hp(2, context),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(3, context),
        ),
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: hp(30, context),
            child: ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Navigator.pop(context, selectedIndex);
                    },
                    child: Container(
                      height: hp(2, context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? PRIMARY_COLOR
                              : WHITE_COLOR,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.only(
                        right: wp(4, context),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image(
                          image: AssetImage(
                            imageList[index],
                          ),
                          height: hp(20, context),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        }),
      );
    },
  );
  log("result:$result");
  return result;
}
