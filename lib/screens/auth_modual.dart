import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constants_color.dart';
import 'dashboard_screen.dart';

class Authmodual extends StatefulWidget {
  const Authmodual({super.key});

  @override
  State<Authmodual> createState() => _AuthmodualState();
}

class _AuthmodualState extends State<Authmodual> {
  TextEditingController _reminderNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Get Started"),
          backgroundColor: PRIMARY_COLOR,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/splash.png"),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode focusScopeNode = FocusScope.of(context);
            if (!focusScopeNode.hasPrimaryFocus) {
              focusScopeNode.unfocus();
            }
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Please enter your mobile number to proceed further",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  validator: textformfieldvalidator,
                  controller: _reminderNameController,
                  cursorColor: PRIMARY_COLOR,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: PRIMARY_COLOR),
                      borderRadius: BorderRadius.vertical(),
                    ),
                    labelText: 'Enter Mobile Number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter Mobile Number',
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboardscreen()));
                          },
                          child: Text("Submit",
                              style: TextStyle(
                                color: Color(0xfffefefd),
                                fontSize: 17,
                              )))),
                ),
              ],
            ),
          ),
        ));
  }

  String? textformfieldvalidator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
}
