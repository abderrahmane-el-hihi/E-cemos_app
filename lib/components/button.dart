import 'package:cemos_app/services/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/AbsenceDemande.dart';

class L_Button extends StatefulWidget {
  final Function() onTap;

  final String text;
  const L_Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<L_Button> createState() => _L_ButtonState();
}

class _L_ButtonState extends State<L_Button> {
  final bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        splashColor: const Color.fromARGB(24, 102, 187, 106),
        borderRadius: BorderRadius.circular(15),
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          // margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(24, 102, 187, 106),
            border: Border.all(color: Colors.green.shade400, width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isPressed ? widget.text : widget.text,
                  style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonStateModel extends ChangeNotifier {
  bool isFirstInkwellVisible = true;
  bool isSecondInkwellVisible = true;
  String Acceptbtn = 'Accepter';
  Color Acceptclr = const Color.fromARGB(220, 102, 187, 106);
  String Rejectbtn = 'Rejeter';
  Color Rejectclr = const Color.fromARGB(220, 239, 83, 80);

  bool get isRejectVisible => isFirstInkwellVisible;
  bool get isAcceptVisible => isSecondInkwellVisible;

  void hideRejectButton() {
    isFirstInkwellVisible = false;
    Acceptbtn = 'Accepté';
    Acceptclr = Colors.grey.shade400;
    notifyListeners();
  }

  void hideAcceptButton() {
    isSecondInkwellVisible = false;
    Rejectbtn = 'Rejeté';
    Rejectclr = Colors.grey.shade400;
    notifyListeners();
  }
}
