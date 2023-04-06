import 'package:flutter/material.dart';
import 'package:vcard/utils/constants_color.dart';

import '../utils/validator.dart';
import 'icon_textfild.dart';

class Iconwidget extends StatefulWidget {
  TextEditingController? whatsappcontroller;
  TextEditingController? snapchatcontroller;
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
      required this.snapchatcontroller,
      required this.telegramcontroller,
      required this.websitecontroller,
      super.key});
  @override
  State<Iconwidget> createState() => _IconwidgetState();
}

class _IconwidgetState extends State<Iconwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: PRIMARY_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
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
            SizedBox(height: 25),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        builder: (context) => IconTextField(
                            icon: Icon(
                              Icons.whatsapp,
                            ),
                            hint: 'Whatsapp',
                            textInputType: TextInputType.number,
                            textEditingController: widget.whatsappcontroller,
                            validationfunction: numbervalidator),
                        context: context);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.whatsapp,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Whatsapp",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 22),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.telegram),
                              hint: 'Telegram',
                              textInputType: TextInputType.text,
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
                      SizedBox(height: 5),
                      Text(
                        "Telegram",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 28),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.snapchat_outlined),
                              hint: 'Snapchat',
                              textInputType: TextInputType.text,
                              textEditingController: widget.snapchatcontroller,
                              validationfunction: null,
                            ));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.snapchat_outlined,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Snapchat",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.web),
                              hint: 'Website',
                              textInputType: TextInputType.text,
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
                      SizedBox(height: 5),
                      Text(
                        "Website",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                // Spacer(),
                SizedBox(width: 55),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.link_sharp),
                              hint: 'Link',
                              textInputType: TextInputType.text,
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
                      SizedBox(height: 5),
                      Text(
                        "Link",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 46),
                // Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.facebook),
                              hint: 'Facebook',
                              textInputType: TextInputType.text,
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
                      SizedBox(height: 5),
                      Text(
                        "Facebook",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.email),
                              hint: 'Email',
                              textInputType: TextInputType.emailAddress,
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
                      SizedBox(height: 5),
                      Text(
                        "Email",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                // Spacer(),
                SizedBox(width: 56),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                            icon: Icon(Icons.phone),
                            hint: 'Number',
                            textInputType: TextInputType.number,
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
                      SizedBox(height: 5),
                      Text(
                        "Phone",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
                // Spacer(),
                SizedBox(width: 43),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => IconTextField(
                              icon: Icon(Icons.add_location_alt_rounded),
                              hint: 'Address',
                              textInputType: TextInputType.text,
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
                      SizedBox(height: 5),
                      Text(
                        "Address",
                        style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 18),
                Column(
                  children: [
                    Icon(
                      Icons.more,
                      color: WHITE_COLOR,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "More",
                      style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
