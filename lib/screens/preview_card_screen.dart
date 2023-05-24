import 'package:flutter/material.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/widget/preview_card/preview_card1.dart';
import 'package:vcard/widget/preview_card/preview_card2.dart';
import 'package:vcard/widget/preview_card/Preview_card3.dart';
import 'package:vcard/widget/preview_card/PreviewCard4.dart';
import 'package:vcard/widget/preview_card/preview_card_defult_card.dart';

class PreviewCard extends StatefulWidget {
  final int? cardid;
  final int? colorid;
  const PreviewCard({super.key, required this.cardid, required this.colorid});

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  int? previewcard;
  int? previewcolor;
  @override
  void initState() {
    previewcard = widget.cardid;
    previewcolor = widget.colorid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      PreviewCard1(id: previewcolor),
      PreviewCard2(id: previewcolor),
      PreviewCard3(id: previewcolor),
      PreviewCard4(id: previewcolor),
      const PreviewDefultCard()
    ];
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        color: whiteColor,
      ),
      child: cardList[previewcard!],
    );
  }
}
