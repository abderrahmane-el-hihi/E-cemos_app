import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cemos_app/services/service.dart';
import 'package:flutter/material.dart';
import '../models/AbsenceDemande.dart';

class demandetypeDrop extends StatefulWidget {
  demandetypeDrop({
    super.key,
  });

  @override
  State<demandetypeDrop> createState() => _demandetypeDropState();
}

class _demandetypeDropState extends State<demandetypeDrop> {
  AbsenceDemandeType? selectedItem;
  List<AbsenceDemandeType?> dropdownItems = [];

  Future<void> getAbscenceDemandeType() async {
    var client = http.Client();
    var uri = Uri.parse('http://192.168.11.157:8800/api/CemosRH/TypeAbsence/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      final d = json.decode(data);
      List<AbsenceDemandeType?> dItems = [];
      for (var item in d) {
        dItems.add(AbsenceDemandeType(
            idTypeAbsence: item['idTypeAbsence'],
            descriptionAbsence: item['descriptionAbsence'],
            commentaire: item['commentaire'],
            statut: item['statut']));
      }
      setState(() {
        dropdownItems = dItems;
      });
    }
  }

  @override
  void initState() {
    getAbscenceDemandeType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: DropdownButtonFormField<AbsenceDemandeType>(
        borderRadius: BorderRadius.circular(15),
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        dropdownColor: Colors.grey.shade100,
        decoration: InputDecoration(
          label: const Text(
            'Choisir la demande',
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
        value: selectedItem,
        items: dropdownItems.map((item) {
          return DropdownMenuItem<AbsenceDemandeType>(
            value: item,
            child: Text(item!.descriptionAbsence),
          );
        }).toList(),
        onChanged: (selected) {
          setState(() {
            selectedItem = selected;
          });
        },
      ),
    );
  }
}
