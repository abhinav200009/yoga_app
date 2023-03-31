import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/customized/custom_textfield.dart';
import 'package:yoga_app/main.dart';
import 'package:yoga_app/screens/forgotpass.dart';

import 'package:yoga_app/screens/signup.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool istrue = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((Route) => Route.isFirst);
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Login to continue',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 20),
              MyTextFeild(
                  check: false,
                  controller: passwordcontroller,
                  hintText: 'Password',
                  icon: IconButton(
                      onPressed: () {
                        istrue = !istrue;
                        setState(() {});
                      },
                      icon: (istrue) ? Icon(Icons.lock) : Icon(Icons.lock_open),
                      color: Colors.blueAccent),
                  textType: TextInputType.text,
                  isobscure: istrue),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const forgotpassword()),
                      );
                    },
                    child: const Text('Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                          child: Text("Login",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                          ),
                          onPressed: signIn),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      //height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child:
                        Text('OR', style: TextStyle(color: Colors.blueAccent)),
                  ),
                  Expanded(
                    child: Divider(
                      //height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 93, 226, 235),
                            Color.fromARGB(255, 157, 142, 211)
                          ])),
                      child: TextButton(
                          child: Text("Sign up",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signup()),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
