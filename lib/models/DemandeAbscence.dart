import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
class DemandeAbscence {
  String? dateDebut;
  String? dureAbsence;
  String? motifAbsence;
  String? dateFin;
  String? mailAbsence;
  String? validationChef1;
  String? validationChef2;
  String? telAbsence;
  String? idPersonnel;
  String? validationRh;
  String? idTypeAbsence;
  String? dateSaisi;
  String? idDemandeAbsence;
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
        dateDebut: json["dateDebut"],
        dureAbsence: json["dureAbsence"],
        motifAbsence: json["motifAbsence"],
        dateFin: json["dateFin"],
        mailAbsence: json["mailAbsence"],
        validationChef1: json["validationChef1"],
        validationChef2: json["validationChef2"],
        telAbsence: json["telAbsence"],
        idPersonnel: json["idPersonnel"],
        validationRh: json["validationRH"],
        idTypeAbsence: json["idTypeAbsence"],
        dateSaisi: json["dateSaisi"],
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
