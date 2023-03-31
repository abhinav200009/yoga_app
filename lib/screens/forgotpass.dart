import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/customized/custom_textfield.dart';
import 'package:yoga_app/main.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final emailcontroller = TextEditingController();
  Future resetpass() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((Route) => Route.isFirst);
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Reset Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextFeild(
                    controller: emailcontroller,
                    check: true,
                    hintText: 'Email address',
                    icon: IconButton(
                      icon: Icon(Icons.person_rounded),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    textType: TextInputType.emailAddress,
                    isobscure: false,
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // ignore: prefer_const_constructors
                          decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 93, 226, 235),
                                Color.fromARGB(255, 157, 142, 211)
                              ])),
                          child: TextButton(
                              child: Text("Reset",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(20)),
                              ),
                              onPressed: resetpass),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
