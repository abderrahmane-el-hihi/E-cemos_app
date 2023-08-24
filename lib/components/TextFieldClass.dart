import 'package:flutter/material.dart';

class TextFieldClass extends StatefulWidget {
  final controller;
  int? maxLines = 1;
  bool obscureText;
  String title;
  IconData? suffIcon, suffIcon2;
  TextFieldClass({
    super.key,
    required this.controller,
    this.maxLines,
    required this.obscureText,
    required this.title,
    this.suffIcon,
    this.suffIcon2,
  });

  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          label: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText ? widget.suffIcon : widget.suffIcon2,
              color: widget.obscureText ? Colors.green.shade400 : Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green.shade400),
          ),
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(179, 179, 179, 1)),
        ),
      ),
    );
  }
}
