import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants_color.dart';
import '../widget/custom_textformfield.dart';
import '../widget/icon.dart';

class Createcardscreen extends StatefulWidget {
  const Createcardscreen({super.key});

  @override
  State<Createcardscreen> createState() => _CreatecardscreenState();
}

class _CreatecardscreenState extends State<Createcardscreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _headlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Card"),
        actions: <Widget>[
          IconButton(onPressed: () async {}, icon: Icon(Icons.save)),
        ],
        backgroundColor: PRIMARY_COLOR,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text("New Card"),
                Divider(),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/splash.png"),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 230),
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.add),
                          Text("Logo"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _titleController,
                  texteditinghinttext: 'Title',
                  customobscuretext: true,
                  custominkwell: null,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _departmentController,
                  texteditinghinttext: 'Department',
                  customobscuretext: true,
                  custominkwell: null,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _companyController,
                  texteditinghinttext: 'Company',
                  customobscuretext: true,
                  custominkwell: null,
                ),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Color(0xff000000)),
                  cursorColor: PRIMARY_COLOR,
                  controller: _headlineController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: PRIMARY_COLOR),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                    hintText: 'Headline',
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Divider(),
                Row(
                  children: [
                    Text("Add credential or affiliation Badges"),
                    SizedBox(width: 60),
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.add),
                          Text("BADGE"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Iconwidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
