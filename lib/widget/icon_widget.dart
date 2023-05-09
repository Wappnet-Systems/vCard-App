import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vcard/utils/style.dart';
import '../utils/responsive.dart';
import '../utils/validator.dart';
import 'google_textformfield_widget.dart';
import 'icon_textfild_widget.dart';

class Iconwidget extends StatefulWidget {
  final TextEditingController? whatsappcontroller;
  final TextEditingController? websitecontroller;
  final TextEditingController? linkcontroller;
  final TextEditingController? facebookcontroller;
  final TextEditingController? emailcontroller;
  final TextEditingController? numbercontroller;
  final TextEditingController? telegramcontroller;
  final TextEditingController? textEditingController;

  const Iconwidget(
      {required this.whatsappcontroller,
      required this.textEditingController,
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
  var maskFormatter = MaskTextInputFormatter(
      mask: '##### #####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: PRIMARY_COLOR.withOpacity(0.8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(4, context),
          vertical: hp(2, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.add, color: WHITE_COLOR, size: 25),
                SizedBox(
                  width: wp(2, context),
                ),
                const Text(
                  "Add Item",
                  style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: hp(3, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        builder: (context) => IconTextField(
                              icon: const Icon(
                                FontAwesomeIcons.whatsapp,
                                color: PRIMARY_COLOR,
                              ),
                              hint: 'Whatsapp',
                              textInputType: TextInputType.number,
                              inputFormatters: [maskFormatter],
                              textEditingController: widget.whatsappcontroller,
                              validationfunction: numbervalidator,
                            ),
                        context: context);
                  },
                  child: Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.whatsapp,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Whatsapp",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
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
                              icon: const Icon(
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
                      const Icon(
                        Icons.telegram_rounded,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Telegram",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
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
                              icon: const Icon(
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
                      const Icon(
                        Icons.email_rounded,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hp(3, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: wp(2, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: const Icon(
                                Icons.desktop_mac_rounded,
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
                      const Icon(
                        Icons.desktop_mac_rounded,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Website",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
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
                              icon: const Icon(
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
                      const Icon(
                        Icons.link_sharp,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Link",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: wp(15, context),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                            icon: const Icon(
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
                      const Icon(
                        Icons.phone,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Phone",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hp(3, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: const Icon(
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
                      const Icon(
                        Icons.facebook,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Facebook",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => PlacesAutoCompleteTextField(
                              hint: 'Address',
                              textEditingController:
                                  widget.textEditingController,
                            ));
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.add_location_rounded,
                        color: WHITE_COLOR,
                        size: 25,
                      ),
                      SizedBox(
                        height: hp(1, context),
                      ),
                      const Text(
                        "Address",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: wp(10, context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
