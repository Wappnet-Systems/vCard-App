import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/contect_visiting_card/card_1.dart';
import 'package:vcard/contect_visiting_card/card_2.dart';
import 'package:vcard/contect_visiting_card/card_3.dart';
import 'package:vcard/contect_visiting_card/card_4.dart';
import 'package:vcard/contect_visiting_card/defult_card.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/app_bar_widget.dart';

class Contectvisitingcard extends StatefulWidget {
  final int? id;
  const Contectvisitingcard({super.key, required this.id});

  @override
  State<Contectvisitingcard> createState() => _ContectvisitingcardState();
}

class _ContectvisitingcardState extends State<Contectvisitingcard> {
  int? contactcardindex;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    contactcardindex = widget.id;
    log("contactcardindex:$contactcardindex");
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      ContectCardTheme1(id: contactcardindex),
      Contectcardtheme2(id: contactcardindex),
      Contectcardtheme3(id: contactcardindex),
      Contectcardtheme4(id: contactcardindex),
      Contectdefultcard(id: contactcardindex)
    ];
    log("Staticmembers.listofUsers[widget.id!].card!:${Staticmembers.listofUsers[widget.id!].card!}");
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarWidget(
        title:
            "${Staticmembers.listofUsers[contactcardindex!].type?.toUpperCase()}",
        centerTitle: true,
        leadinWidget: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: WHITE_COLOR,
            size: 25,
          ),
        ),
      ),
      body: cardList[Staticmembers.listofUsers[widget.id!].card!],
    );
  }
}
