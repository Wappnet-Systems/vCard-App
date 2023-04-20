import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcard/screens/setting_screen.dart';
import '../utils/constants_color.dart';
import '../widget/bottom_sheet.dart';
import '../widget/custom_no_data.dart';
import '../widget/floating_action_button.dart';
import '../widget/text_button_widget.dart';
import 'contect_visiting_card.dart';

class ContactsScreen extends StatefulWidget {
  final int? contectid;
  ContactsScreen({super.key, this.contectid});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int? contectcard;
  int? cvc;

  @override
  void initState() {
    super.initState();
    contectcard = widget.contectid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts"),
        backgroundColor: PRIMARY_COLOR,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/splash1.png"),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Staticmenbers.listofUsers.length == 0
          ? CustomNoData(
              iconaddress: CARD,
            )
          : RefreshIndicator(
              onRefresh: () async {
                initState();
              },
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: .001,
                    crossAxisSpacing: .001,
                  ),
                  itemCount: Staticmenbers.newUserCar.length,
                  itemBuilder: (BuildContext context, int contectcard) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          cvc = contectcard;
                        });
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  color: BLUE_COLOR,
                                  height: 220.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Work",
                                          style: TextStyle(
                                              fontSize: 20, color: WHITE_COLOR),
                                        ),
                                        Divider(
                                            color: PRIMARY_COLOR, thickness: 5),
                                        Row(
                                          children: [
                                            SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            contectvisitingcard(
                                                                id: cvc)));
                                              },
                                              child: CardWidget(
                                                icon: Icons.remove_red_eye,
                                                data: "View",
                                                data1: "Open your card",
                                                data2: "in vCard.",
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    title: const Text(
                                                        "Are you sure you want to delete this card?"),
                                                    content: Text(''),
                                                    actions: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButtomWidget(
                                                            onPressed: () {},
                                                            title: 'okey',
                                                            color:
                                                                PRIMARY_COLOR,
                                                          ),
                                                          TextButtomWidget(
                                                            onPressed: () {
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              ContactsScreen()));
                                                            },
                                                            title: 'Cancle',
                                                            color: Colors
                                                                .redAccent,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: CardWidget(
                                                icon: Icons.delete,
                                                data: "Delete",
                                                data1: "Delete your",
                                                data2: "Card.",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            });
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 2.8),
                          Card(
                            color: PRIMARY_COLOR,
                            child: Column(children: [
                              Staticmenbers.newUserCar[contectcard].image == ""
                                  ? Image.asset(
                                      "assets/images/splash1.png",
                                      width: 175,
                                      height: 146,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "${Staticmenbers.newUserCar[contectcard].image}",
                                      width: 175,
                                      height: 146,
                                      fit: BoxFit.cover,
                                      frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) {
                                        return child;
                                      },
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: WHITE_COLOR,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                              SizedBox(height: 3),
                              Center(
                                child: Text(
                                  '${Staticmenbers.newUserCar[contectcard].type}',
                                  style: TextStyle(color: WHITE_COLOR),
                                ),
                              ),
                              SizedBox(height: 3),
                            ]),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
