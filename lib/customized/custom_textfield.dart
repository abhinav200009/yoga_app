import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final String hintText;
  final IconButton icon;
  final TextInputType textType;
  final bool isobscure;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final FormFieldSetter<String>? onSaved;
  final bool check;

  const MyTextFeild(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.textType,
      required this.isobscure,
      this.validator,
      this.suffix,
      required this.onSaved,
      required this.check})
      : super(key: key);

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
      onSaved: onSaved,
    );
  }
}

String? validateEmail(String? value) {
  String? msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value!.isEmpty) {
    msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    msg = "Please provide a valid Email address";
  }
  return msg;
}

String validatePass(String? value) {
  String _msg = 'Error';
  if (value!.isEmpty) {
    _msg = "Your Password is required";
  } else {
    _msg = '';
  }
  return _msg;
}
