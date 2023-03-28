import 'package:flutter/material.dart';
import 'package:vcard/utils/constants_color.dart';

import 'custom_textformfield.dart';

class Iconwidget extends StatefulWidget {
  const Iconwidget({super.key});

  @override
  State<Iconwidget> createState() => _IconwidgetState();
}

class _IconwidgetState extends State<Iconwidget> {
  TextEditingController _departmentController = TextEditingController();
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
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.whatsapp,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Whatsapp",
                      style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(width: 22),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print("apurv");
                      },
                      child: Icon(
                        Icons.telegram,
                        color: WHITE_COLOR,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Telegram",
                      style: TextStyle(color: WHITE_COLOR, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(width: 28),
                Column(
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
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 5),
                Column(
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
                // Spacer(),
                SizedBox(width: 55),
                Column(
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
                SizedBox(width: 46),
                // Spacer(),
                Column(
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
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 16),
                Column(
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
                // Spacer(),
                SizedBox(width: 56),
                Column(
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
                // Spacer(),
                SizedBox(width: 43),
                Column(
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
