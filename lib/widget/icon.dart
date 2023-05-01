import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vcard/utils/constants_color.dart';
import '../utils/responsive.dart';
import '../utils/validator.dart';
import 'icon_textfild.dart';

class Iconwidget extends StatefulWidget {
  TextEditingController? whatsappcontroller;
  TextEditingController? websitecontroller;
  TextEditingController? linkcontroller;
  TextEditingController? facebookcontroller;
  TextEditingController? emailcontroller;
  TextEditingController? numbercontroller;
  TextEditingController? telegramcontroller;
  TextEditingController? addresscontroller;

  Iconwidget(
      {required this.whatsappcontroller,
      required this.addresscontroller,
      required this.emailcontroller,
      required this.facebookcontroller,
      required this.linkcontroller,
      required this.numbercontroller,
      required this.telegramcontroller,
      required this.websitecontroller,
      super.key});
  @override
  State<Iconwidget> createState() => _IconwidgetState();
}

class _IconwidgetState extends State<Iconwidget> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##### #####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: PRIMARY_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.add, color: WHITE_COLOR, size: 30),
                Text(
                  "Add Item",
                  style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: hp(5, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: wp(5, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        builder: (context) => IconTextField(
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: PRIMARY_COLOR,
                            ),
                            hint: 'Whatsapp',
                            textInputType: TextInputType.number,
                            inputFormatters: [maskFormatter],
                            textEditingController: widget.whatsappcontroller,
                            validationfunction: numbervalidator),
                        context: context);
                  },
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Whatsapp",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: wp(5, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.telegram,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Telegram',
                              textInputType: TextInputType.number,
                              inputFormatters: [maskFormatter],
                              textEditingController: widget.telegramcontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.telegram,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Telegram",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: wp(8, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.email,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Email',
                              textInputType: TextInputType.emailAddress,
                              inputFormatters: null,
                              textEditingController: widget.emailcontroller,
                              validationfunction: emailValidator,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.email,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Email",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hp(5, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: wp(2, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.web,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Website',
                              textInputType: TextInputType.text,
                              inputFormatters: null,
                              textEditingController: widget.websitecontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.web,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Website",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: wp(15, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.link_sharp,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Link',
                              textInputType: TextInputType.text,
                              inputFormatters: null,
                              textEditingController: widget.linkcontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.link_sharp,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Link",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: wp(15, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                            icon: Icon(
                              Icons.phone,
                              color: PRIMARY_COLOR,
                            ),
                            hint: 'Number',
                            textInputType: TextInputType.number,
                            inputFormatters: [maskFormatter],
                            textEditingController: widget.numbercontroller,
                            validationfunction: numbervalidator));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Phone",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hp(5, context),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: wp(3, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.facebook,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Facebook',
                              textInputType: TextInputType.text,
                              inputFormatters: null,
                              textEditingController: widget.facebookcontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.facebook,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: wp(10, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(
                                Icons.add_location_alt_rounded,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Address',
                              textInputType: TextInputType.text,
                              inputFormatters: null,
                              textEditingController: widget.addresscontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_location_rounded,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      Text(
                        "Address",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
