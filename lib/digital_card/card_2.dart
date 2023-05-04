import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/responsive.dart';

import '../widget/clip_path_widget.dart';

class Cardtheme2 extends StatelessWidget {
  const Cardtheme2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("abc"),
        backgroundColor: BLUE_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.ios_share_rounded),
          ),
        ],
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: WHITE_COLOR,
            child: Column(children: [
              Stack(
                children: [
                  ClipPath(
                    child: Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      color: Colors.blue,
                    ),
                    clipper: CustomClipPath(),
                  ),
                  SizedBox(height: 50),
                  ClipPath(
                    child: Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      color: Colors.blue,
                    ),
                    clipper: CustomClipPath3(),
                  ),
                  Positioned(
                    top: 90,
                    left: 180,
                    child: ClipPath(
                      child: Container(
                        width: wp(45, context),
                        height: hp(24, context),
                        color: Colors.orange,
                      ),
                      clipper: CustomClipPath2(),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
