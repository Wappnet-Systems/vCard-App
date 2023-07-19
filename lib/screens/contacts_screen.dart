import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/widget/custom_appbar_widget.dart';
import 'package:vcard/widget/text_widget.dart';
import '../model/data_controllers.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widget/custom_no_data_widget.dart';
import 'menu_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int? cardindex;
  bool value = false;
  bool isLoading = false;
  List<Users> userData = [];
  @override
  void initState() {
    getContectUserData();
    super.initState();
  }

  void changeData() {
    setState(() {
      getContectUserData();
      value = true;
    });
  }

  // Contect person card data get
  Future<void> getContectUserData() async {
    setState(() {
      isLoading = true;
    });
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Frind's card")
        .get();
    final contectData = snapshot.docs
        .map((e) => Users(
            user: e.data()['user'],
            name: e.data()['Name'],
            department: e.data()['Department'],
            compeny: e.data()['Company'],
            whatsapp: e.data()['WhatsApp'],
            telegram: e.data()['Telegram'],
            website: e.data()['Website'],
            linkdin: e.data()['Linkdin'],
            facebook: e.data()['Facebook'],
            email: e.data()['Email'],
            phone: e.data()['Phone'],
            country: e.data()['country'],
            address: e.data()['Address'],
            id: e.data()['id'],
            image: e.data()['images'],
            type: e.data()['type'],
            card: e.data()['card'],
            color: e.data()['color']))
        .toList();

    setState(() {
      value = true;
      isLoading = false;
      Staticmenbers.cardUsers = contectData;
      log('message:$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: const Customappbarwidget(
        title: "Contacts",
        centerTitle: false,
        leadingWidth: 0.0,
        leading: SizedBox.shrink(),
      ),
      // save card
      body: isLoading == true
          ? const Center(
              child: SpinKitCircle(color: COLOR_PRIMARY),
            )
          : Staticmenbers.cardUsers.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: hp(1, context), horizontal: wp(4, context)),
                  itemCount: Staticmenbers.cardUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          cardindex = index;
                        });
                        showModalBottomSheet(
                          backgroundColor: COLOR_WHITE,
                          elevation: 0.0,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0)),
                          ),
                          builder: (BuildContext context) => Menuscreen(
                            contectid: cardindex,
                          ),
                        );
                      },
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
                                    const BorderRadius.all(Radius.circular(10)),
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
                                      "${Staticmenbers.cardUsers[index].image}",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(50, context),
                                    text: Staticmenbers.cardUsers[index].name ??
                                        "",
                                    fontSize: 20,
                                    selectionColor: COLOR_PRIMARY_DARK,
                                  ),
                                  SizedBox(
                                    height: hp(0.5, context),
                                  ),
                                  Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(50, context),
                                    text: Staticmenbers.cardUsers[index].type ??
                                        "",
                                    fontSize: 14,
                                    selectionColor: COLOR_PRIMARY_LIGHT,
                                  ),
                                  SizedBox(
                                    height: hp(0.5, context),
                                  ),
                                  Textwidget(
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    width: wp(50, context),
                                    text: Staticmenbers
                                            .cardUsers[index].department ??
                                        "",
                                    fontSize: 14,
                                    selectionColor: COLOR_PRIMARY_LIGHT,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: COLOR_PRIMARY_DARK,
                              ),
                            ],
                          )),
                    );
                  })
              // no deta screen
              : const CustomNoData(
                  iconaddress: card,
                ),
    );
  }
}
