import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcard/contect_visiting_card/card_2.dart';
import 'package:vcard/contect_visiting_card/card_3.dart';
import 'package:vcard/contect_visiting_card/card_4.dart';
import 'package:vcard/utils/constants_color.dart';
import '../contect_visiting_card/card_1.dart';
import '../contect_visiting_card/defult_card.dart';

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
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      Contectcardtheme1(id: contactcardindex),
      Contectcardtheme2(id: contactcardindex),
      Contectcardtheme3(id: contactcardindex),
      Contectcardtheme4(id: contactcardindex),
      Contectdefultcard(id: contactcardindex)
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("${Staticmenbers.cardUsers[widget.id!].type}"),
            backgroundColor: BLUE_COLOR,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          backgroundColor: WHITE_COLOR,
          body: cardList[Staticmenbers.cardUsers[widget.id!].card!]),
    );
  }
}
