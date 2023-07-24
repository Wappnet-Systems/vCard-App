import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vcard/screens/card_shere_screen.dart';
import 'package:vcard/screens/digital_visiting_card_screen.dart';
import 'package:vcard/utils/constants.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import '../model/data_controllers.dart';
import '../widget/custom_alartdialog.dart';
import '../widget/custom_no_data_widget.dart';

class Cardscreen extends StatefulWidget {
  const Cardscreen({super.key});

  @override
  State<Cardscreen> createState() => _CardscreenState();
}

class _CardscreenState extends State<Cardscreen> {
  int? cardindex;
  bool value = false;
  bool isLoading = false;
  @override
  void initState() {
    getSingleUserData();
    setState(() {});
    super.initState();
  }

  void changeData() {
    setState(() {
      getSingleUserData();
      value = true;
    });
  }

  // Database data get
  Future<void> getSingleUserData() async {
    setState(() {
      isLoading = true;
    });
    List<Users> userData = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Carddata")
        .get();
    for (var element in snapshot.docs) {
      userData.add(
        Users(
            user: element.data()['user'],
            name: element.data()['Name'],
            department: element.data()['Department'],
            compeny: element.data()['Company'],
            whatsapp: element.data()['WhatsApp'],
            telegram: element.data()['Telegram'],
            website: element.data()['Website'],
            linkdin: element.data()['Linkdin'],
            facebook: element.data()['Facebook'],
            email: element.data()['Email'],
            phone: element.data()['Phone'],
            country: element.data()['country'],
            address: element.data()['Address'],
            id: element.data()['id'],
            type: element.data()['type'],
            image: element.data()['images'],
            card: element.data()['card'],
            color: element.data()['color']),
      );
    }

    setState(() {
      value = true;
      Staticmenbers.listofUsers = userData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return CustomAlartDialog(
                title: Text(
                  "Exit Application",
                  textAlign: TextAlign.center,
                  style:
                      smalltitleTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                content: Text(
                  "Do you want to exit an Applicaton?",
                  textAlign: TextAlign.center,
                  style:
                      textMediumTextStyle.copyWith(color: COLOR_PRIMARY_LIGHT),
                ),
                onPressedNo: () {
                  Navigator.pop(context);
                },
                onPressedYes: () {
                  exit(0);
                },
              );
            });
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        appBar: const Customappbarwidget(
          title: "Cards",
          centerTitle: false,
          leadingWidth: 0.0,
          leading: SizedBox.shrink(),
        ),
        body: isLoading == true
            ? const Center(
                child: SpinKitCircle(color: COLOR_PRIMARY),
              )
            : Staticmenbers.listofUsers.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.all(
                      wp(4, context),
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: Staticmenbers.listofUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Digitalvisitingcard(
                                id: index,
                              ),
                            ),
                          );
                        },
                        // user card
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: wp(4, context),
                            vertical: hp(2, context),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: hp(1, context),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: COLOR_WHITE,
                            boxShadow: [
                              BoxShadow(
                                color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                                blurRadius: 1.0,
                                offset: const Offset(1, -1),
                              ),
                              BoxShadow(
                                color: COLOR_PRIMARY_LIGHT.withOpacity(0.5),
                                blurRadius: 1.0,
                                offset: const Offset(-1, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    color: COLOR_PRIMARY,
                                    child: const Icon(
                                      Icons.image,
                                      size: 40,
                                      color: COLOR_WHITE,
                                    ),
                                  ),
                                  imageUrl:
                                      "${Staticmenbers.listofUsers[index].image}",
                                  width: wp(16, context),
                                  height: hp(8, context),
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      color: COLOR_PRIMARY,
                                      child: const Icon(
                                        Icons.image,
                                        size: 40,
                                        color: COLOR_WHITE,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: wp(4, context),
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Staticmenbers.listofUsers[index].name ??
                                          "",
                                      style: textMediumTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: hp(0.5, context),
                                    ),
                                    Text(
                                        Staticmenbers.listofUsers[index].type ??
                                            "",
                                        style: textSmallTextStyle),
                                    SizedBox(
                                      height: hp(0.5, context),
                                    ),
                                    Text(
                                        Staticmenbers.listofUsers[index]
                                                .department ??
                                            "",
                                        style: textSmallTextStyle),
                                  ]),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => Cardsherescreen(
                                      uid: FirebaseAuth
                                          .instance.currentUser?.uid,
                                      cid: Staticmenbers.listofUsers[index].id,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                // no data screen
                : const CustomNoData(
                    iconaddress: card,
                  ),
      ),
    );
  }
}
