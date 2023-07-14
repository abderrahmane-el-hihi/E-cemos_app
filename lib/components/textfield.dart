import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  final controller;
  final String hinText;
  final bool obsecureText;
  final preicon;

  const Text_Field({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obsecureText,
    this.preicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            preicon,
            color: Colors.grey.shade500,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(131, 172, 64, 1)),
          ),
          fillColor: Colors.transparent,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
        ),
      ),
    );
  }
}
