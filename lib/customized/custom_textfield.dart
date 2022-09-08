import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final String hintText;
  final IconButton icon;
  final TextInputType textType;
  final bool isobscure;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;

  final bool check;

  final TextEditingController controller;

  const MyTextFeild({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.textType,
    required this.isobscure,
    this.validator,
    this.suffix,
    required this.controller,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 18,
      cursorColor: Color.fromARGB(183, 20, 2, 23),
      obscureText: isobscure,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 12),
          prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.blueAccent, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black, width: 1)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                  color: Color.fromARGB(183, 232, 9, 113), width: 1)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.blueAccent, width: 1)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                  color: Color.fromARGB(183, 232, 9, 113), width: 1))),
      keyboardType: textType,
      validator: (check) ? validateEmail : validatePass,
      textInputAction: TextInputAction.done,
      controller: controller,
    );
  }
}

String? validatePass(String? value) {
  String? msg;
  if (value != null && value.length < 6) {
    msg = "Your Password is required";
  }
  return msg;
}

String? validateEmail(String? value) {
  String? msg;
  if (value != null && !EmailValidator.validate(value)) {
    msg = "Enter a valid email";
  }
  return msg;
}
