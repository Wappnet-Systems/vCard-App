import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/widget/contect_visiting_card/card_2.dart';
import 'package:vcard/widget/contect_visiting_card/card_3.dart';
import 'package:vcard/widget/contect_visiting_card/card_4.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../widget/contect_visiting_card/card_1.dart';
import '../widget/contect_visiting_card/defult_card.dart';

class Contectvisitingcard extends StatefulWidget {
  final int? contectid;
  const Contectvisitingcard({super.key, required this.contectid});

  @override
  State<Contectvisitingcard> createState() => _ContectvisitingcardState();
}

class _ContectvisitingcardState extends State<Contectvisitingcard> {
  int? contactcardindex;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    contactcardindex = widget.contectid;
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // card list
    List<Widget> cardList = [
      Contectcardtheme1(id: contactcardindex),
      Contectcardtheme2(id: contactcardindex),
      Contectcardtheme3(id: contactcardindex),
      Contectcardtheme4(id: contactcardindex),
      Contectdefultcard(id: contactcardindex)
    ];
    return Scaffold(
        appBar: Customappbarwidget(
            title: "${Staticmenbers.cardUsers[widget.contectid!].type}",
            actions: null),
        body: cardList[Staticmenbers.cardUsers[widget.contectid!].card!]);
  }
}
