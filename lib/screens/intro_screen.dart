import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vcard/utils/constants_color.dart';
import 'auth_modual.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: IntroductionScreen(
          globalBackgroundColor: PRIMARY_COLOR,
          pages: [
            PageViewModel(
              title: 'Create A Degital Card',
              body:
                  'A digital card offers convenience as well as data security',
              image: Image.asset("assets/images/intro1.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Send your card easily',
              body:
                  'This allows them to send you a visiting card instantly via QR code.',
              image: Image.asset("assets/images/intro2.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Easy to scan other card codes',
              body:
                  'This allows them to send you a visiting card instantly via QR code.',
              image: Image.asset("assets/images/intro3.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            if (kDebugMode) {
              print("Done clicked");
            }
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip: const Text("Skip",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: WHITE_COLOR)),
          next: const Icon(Icons.forward, color: WHITE_COLOR),
          done: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Authmodual()));
              },
              child: const Text("Get Started",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: WHITE_COLOR))),
          dotsDecorator: getDotsDecorator()),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      width: 550,
      height: 400,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 50),
      pageColor: PRIMARY_COLOR,
      bodyPadding: EdgeInsets.only(top: 40, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 100, left: 20, right: 20),
      titleTextStyle: TextStyle(color: WHITE_COLOR, fontSize: 30),
      bodyTextStyle: TextStyle(color: WHITE_COLOR, fontSize: 20),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.black,
      color: WHITE_COLOR,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
