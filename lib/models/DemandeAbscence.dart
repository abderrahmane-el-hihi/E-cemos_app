import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List<DemandeAbscence> demandeAbscenceFromJson(var str) =>
    List<DemandeAbscence>.from(
        json.decode(str).map((x) => DemandeAbscence.fromJson(x)));

// List<DemandeAbscence> demandeAbscenceFromJson(var str) {
//   List<dynamic> parsed = json.decode(str);
//   return parsed
//       .map<DemandeAbscence>((json) => DemandeAbscence.fromJson(json))
//       .toList();
// }

// String demandeAbscenceToJson(List<DemandeAbscence> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemandeAbscence {
  DateTime dateDebut;
  double? dureAbsence;
  String? motifAbsence;
  DateTime dateFin;
  String? mailAbsence;
  String? validationChef1;
  String? validationChef2;
  String? telAbsence;
  int? idPersonnel;
  String? validationRh;
  int? idTypeAbsence;
  DateTime dateSaisi;
  int? idDemandeAbsence;
  String? dateDernierModification;

  DemandeAbscence({
    required this.dateDebut,
    required this.dureAbsence,
    required this.motifAbsence,
    required this.dateFin,
    required this.mailAbsence,
    required this.validationChef1,
    required this.validationChef2,
    required this.telAbsence,
    required this.idPersonnel,
    required this.validationRh,
    required this.idTypeAbsence,
    required this.dateSaisi,
    required this.idDemandeAbsence,
    required this.dateDernierModification,
  });

  factory DemandeAbscence.fromJson(Map<String, dynamic> json) =>
      DemandeAbscence(
        dateDebut: DateTime.parse(json["dateDebut"]),
        dureAbsence: json["dureAbsence"],
        motifAbsence: json["motifAbsence"],
        dateFin: DateTime.parse(json["dateFin"]),
        mailAbsence: json["mailAbsence"],
        validationChef1: json["validationChef1"],
        validationChef2: json["validationChef2"],
        telAbsence: json["telAbsence"],
        idPersonnel: json["idPersonnel"],
        validationRh: json["validationRH"],
        idTypeAbsence: json["idTypeAbsence"],
        dateSaisi: DateTime.parse(json["dateSaisi"]),
        idDemandeAbsence: json["idDemandeAbsence"],
        dateDernierModification: json["dateDernierModification"],
      );

  Map<String, dynamic> toJson() => {
        "dateDebut":
            // "${dateDebut.year.toString().padLeft(4, '0')}-${dateDebut.month.toString().padLeft(2, '0')}-${dateDebut.day.toString().padLeft(2, '0')}",
            dateDebut,
        "dureAbsence": dureAbsence,
        "motifAbsence": motifAbsence,
        "dateFin":
            // "${dateFin.year.toString().padLeft(4, '0')}-${dateFin.month.toString().padLeft(2, '0')}-${dateFin.day.toString().padLeft(2, '0')}",
            dateFin,
        "mailAbsence": mailAbsence,
        "validationChef1": validationChef1,
        "validationChef2": validationChef2,
        "telAbsence": telAbsence,
        "idPersonnel": idPersonnel,
        "validationRH": validationRh,
        "idTypeAbsence": idTypeAbsence,
        "dateSaisi":
            // "${dateSaisi.year.toString().padLeft(4, '0')}-${dateSaisi.month.toString().padLeft(2, '0')}-${dateSaisi.day.toString().padLeft(2, '0')}",
            dateSaisi,
        "idDemandeAbsence": idDemandeAbsence,
        "dateDernierModification":
            // "${dateDernierModification.year.toString().padLeft(4, '0')}-${dateDernierModification.month.toString().padLeft(2, '0')}-${dateDernierModification.day.toString().padLeft(2, '0')}",
            dateDernierModification,
      };
}

class DemandeAbscenceDataProvider extends ChangeNotifier {
  DemandeAbscence? _DemandeAbscence;
  DemandeAbscence? get DemandeAbscencedata => _DemandeAbscence;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('http://192.168.11.157:8800/api/CemosRH/'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _DemandeAbscence =
            demandeAbscenceFromJson(jsonData) as DemandeAbscence?;
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}

List<List<DemandeApprovedList>> demandeApprovedListFromJson(String str) =>
    List<List<DemandeApprovedList>>.from(json.decode(str).map((x) =>
        List<DemandeApprovedList>.from(
            x.map((x) => DemandeApprovedList.fromJson(x)))));

String demandeApprovedListToJson(List<List<DemandeApprovedList>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class DemandeApprovedList {
  DateTime dateDebut;
  double? dureAbsence;
  String? motifAbsence;
  DateTime dateFin;
  String? mailAbsence;
  String? validationChef1;
  String? validationChef2;
  String? telAbsence;
  int? idPersonnel;
  String? validationRh;
  int? idTypeAbsence;
  DateTime dateSaisi;
  int? idDemandeAbsence;
  // DateTime? dateDernierModification;

  DemandeApprovedList({
    required this.dateDebut,
    required this.dureAbsence,
    required this.motifAbsence,
    required this.dateFin,
    required this.mailAbsence,
    required this.validationChef1,
    required this.validationChef2,
    required this.telAbsence,
    required this.idPersonnel,
    required this.validationRh,
    required this.idTypeAbsence,
    required this.dateSaisi,
    required this.idDemandeAbsence,
    // this.dateDernierModification,
  });

  factory DemandeApprovedList.fromJson(Map<String, dynamic> json) =>
      DemandeApprovedList(
        dateDebut: DateTime.parse(json["dateDebut"]),
        dureAbsence: json["dureAbsence"],
        motifAbsence: json["motifAbsence"],
        dateFin: DateTime.parse(json["dateFin"]),
        mailAbsence: json["mailAbsence"],
        validationChef1: json["validationChef1"],
        validationChef2: json["validationChef2"],
        telAbsence: json["telAbsence"],
        idPersonnel: json["idPersonnel"],
        validationRh: json["validationRH"],
        idTypeAbsence: json["idTypeAbsence"],
        dateSaisi: DateTime.parse(json["dateSaisi"]),
        idDemandeAbsence: json["idDemandeAbsence"],
        // dateDernierModification:
        //     DateTime.parse(json["dateDernierModification"]),
      );

  Map<String, dynamic> toJson() => {
        "dateDebut":
            // "${dateDebut?.year.toString().padLeft(4, '0')}-${dateDebut?.month.toString().padLeft(2, '0')}-${dateDebut?.day.toString().padLeft(2, '0')}",
            dateDebut,
        "dureAbsence": dureAbsence,
        "motifAbsence": motifAbsence,
        "dateFin":
            // "${dateFin?.year.toString().padLeft(4, '0')}-${dateFin?.month.toString().padLeft(2, '0')}-${dateFin?.day.toString().padLeft(2, '0')}",
            dateFin,
        "mailAbsence": mailAbsence,
        "validationChef1": validationChef1,
        "validationChef2": validationChef2,
        "telAbsence": telAbsence,
        "idPersonnel": idPersonnel,
        "validationRH": validationRh,
        "idTypeAbsence": idTypeAbsence,
        "dateSaisi":
            // "${dateSaisi?.year.toString().padLeft(4, '0')}-${dateSaisi?.month.toString().padLeft(2, '0')}-${dateSaisi?.day.toString().padLeft(2, '0')}",
            dateSaisi,
        "idDemandeAbsence": idDemandeAbsence,
        // "dateDernierModification":
        //     // "${dateDernierModification?.year.toString().padLeft(4, '0')}-${dateDernierModification?.month.toString().padLeft(2, '0')}-${dateDernierModification?.day.toString().padLeft(2, '0')}",
        //     dateDernierModification,
      };
}
