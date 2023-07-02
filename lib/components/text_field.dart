import 'package:flutter/material.dart';

SizedBox customTextField(InputDecoration decoration, bool isPassword,
    TextEditingController controller) {
  return (SizedBox(
      width: 300,
      height: 69,
      child: Column(
        children: [
          TextField(
            decoration: decoration,
            controller: controller,
            obscureText: isPassword,
          ),
        ],
      )));
}
