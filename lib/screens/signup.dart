import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:yoga_app/customized/custom_textfield.dart';
import 'package:yoga_app/customized/customize_snackbar.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool istrue = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
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
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              "Yoga App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                "Register Here!!",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              SizedBox(height: 15),
              TextFormField(
                cursorHeight: 18,
                cursorColor: Color.fromARGB(183, 20, 2, 23),
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.person_rounded),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    hintText: "Full Name",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(183, 232, 9, 113), width: 1)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(183, 232, 9, 113),
                            width: 1))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorHeight: 18,
                cursorColor: Color.fromARGB(183, 20, 2, 23),
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    hintText: "Phone Number",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(183, 232, 9, 113), width: 1)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(183, 232, 9, 113),
                            width: 1))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                //textInputAction: TextInputType.number,
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
                  controller: passwordcontroller,
                  check: false,
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
                          onPressed: signUp),
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
