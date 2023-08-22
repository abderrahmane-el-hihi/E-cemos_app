import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class DropdownM extends StatefulWidget {
  DropdownM({
    super.key,
  });

  @override
  State<DropdownM> createState() => _DropdownMState();
}

class _DropdownMState extends State<DropdownM> {
  final TextEditingController demandeController = TextEditingController();
  DemandeType? selectedDemande;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<DemandeType>> demandeEntries =
        <DropdownMenuItem<DemandeType>>[];

    for (final DemandeType demande in DemandeType.values) {
      demandeEntries.add(
        DropdownMenuItem<DemandeType>(
          value: demande,
          // label: demande.label,
          child: Text(
            demande.label,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<DemandeType>(
        borderRadius: BorderRadius.circular(15),
        elevation: 1,
        dropdownColor: Colors.grey.shade100,
        decoration: InputDecoration(
          label: const Text(
            'Choisir la demande',
            style: TextStyle(
              fontFamily: 'Poppins',
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
        ),
        value: selectedDemande,
        onChanged: (DemandeType? Demande) {
          setState(() {
            selectedDemande = Demande;
          });
        },
        items: demandeEntries,
      ),
    );
  }
}

enum DemandeType {
  D1('Congé', ''),
  D2('Des heures supplémentaires', ''),
  D3('Sttéstation', '');

  const DemandeType(this.label, this.demandetypeval);
  final String label;
  final demandetypeval;
}

// return DropdownMenu<DemandeType>(
//   initialSelection: DemandeType.D1,
//   controller: demandeController,
//   label: const Text('Type de demande'),
//   dropdownMenuEntries: demandeEntries,
//   onSelected: (DemandeType? Demande) {
//     setState(() {
//       selectedDemande = Demande;
//     });
//   },
// );

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
