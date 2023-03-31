//  SizedBox(
//                                 width: double.infinity,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5.r),
//                                       color: Colors.blue[300]),
//                                   child: TextButton(
//                                       onPressed: () async {
//                                         if (_formfield.currentState!
//                                             .validate()) {
//                                           try {
//                                             final credential =
//                                                 await FirebaseAuth.instance
//                                                     .signInWithEmailAndPassword(
//                                               email: _emailController.text,
//                                               password:
//                                                   _passwordController.text,
//                                             )
//                                                     .then((value) async {
//                                               SharedPreferences prefs =
//                                                   await SharedPreferences
//                                                       .getInstance();
//                                               await prefs.setBool(
//                                                   'isLoggedIn', true);
//                                               AwesomeDialog(
//                                                 context: context,
//                                                 dialogType: DialogType.success,
//                                                 showCloseIcon: true,
//                                                 desc: "Login Successfully",
//                                               ).show();
//                                               await Future.delayed(
//                                                   const Duration(seconds: 1));
//                                               Navigator.pushReplacement(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           HomePage()));
//                                             });
//                                           } on FirebaseAuthException catch (e) {
//                                             if (e.code == 'user-not-found') {
//                                               print(
//                                                   'No user found for that email.');
//                                             } else if (e.code ==
//                                                 'wrong-password') {
//                                               print(
//                                                   'Wrong password provided for that user.');
//                                             }
//                                           }
//                                         }
//                                       },
//                                       child: Text(
//                                         "LogIn",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 13.h,
//                                         ),
//                                       )),
//                                 ),
//                               ),