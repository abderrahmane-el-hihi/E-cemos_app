import 'package:flutter/material.dart';

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
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(131, 172, 64, 1),
          border:
              Border.all(color: Color.fromRGBO(131, 172, 64, 1), width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isPressed ? widget.text : widget.text,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: "Poppins"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownM extends StatefulWidget {
  const DropdownM({super.key});

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
          child: Text('${demande.label}'),
        ),
      );
    }
    return DropdownButtonFormField<DemandeType>(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(131, 172, 64, 1)),
          ),
          fillColor: Colors.transparent,
          filled: true,
          hintText: 'Choisir la demande',
          hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
        ),
        value: selectedDemande,
        onChanged: (DemandeType? Demande) {
          setState(() {
            selectedDemande = Demande;
          });
        },
        items: demandeEntries);
  }
}

enum DemandeType {
  //'' valeur de type de demande
  D1('Demande de conge 1', ''),
  D2('Demande de conge 2', ''),
  D3('Demande de conge 3', ''),
  D4('Demande de conge 4', ''),
  D5('Demande de conge 5', '');

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