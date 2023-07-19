import 'package:flutter/material.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/text_button_widget.dart';

import '../utils/constants.dart';
import '../utils/responsive.dart';

class SelectCustomCard extends StatelessWidget {
  final Function()? onTapCard;
  final Color? bordercolor;
  final Function()? onPressedOk;
  const SelectCustomCard(
      {super.key,
      required this.onTapCard,
      required this.bordercolor,
      required this.onPressedOk});

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
      title: const Text("Card's"),
      content: SizedBox(
        height: hp(35, context),
        width: wp(50, context),
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return GridView.builder(
              itemCount: imageList.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: onTapCard,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: bordercolor!,
                        width: 4,
                      ),
                    ),
                    child: Image(
                      image: AssetImage(imageList[index]),
                      height: hp(15, context),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20));
        }),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButtomWidget(
              color: COLOR_PRIMARY_DARK,
              fontSize: 20,
              onPressed: onPressedOk!,
              title: 'ok',
            ),
          ]),
        )
      ],
    );
  }
}
