import 'dart:convert';

List<DemandeAbscence> demandeAbscenceFromJson(String str) =>
    List<DemandeAbscence>.from(
        json.decode(str).map((x) => DemandeAbscence.fromJson(x)));

String demandeAbscenceToJson(List<DemandeAbscence> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemandeAbscence {
  DateTime dateDernierModification;
  int idDemandeAbsence;
  String telAbsence;
  int dureAbsence;
  String? validationChef2;
  DateTime dateDebut;
  DateTime dateFin;
  String motifAbsence;
  String mailAbsence;
  String validationChef1;
  DateTime dateSaisi;
  String? validationRh;
  int idPersonnel;
  int idTypeAbsence;

  DemandeAbscence({
    required this.dateDernierModification,
    required this.idDemandeAbsence,
    required this.telAbsence,
    required this.dureAbsence,
    required this.validationChef2,
    required this.dateDebut,
    required this.dateFin,
    required this.motifAbsence,
    required this.mailAbsence,
    required this.validationChef1,
    required this.dateSaisi,
    required this.validationRh,
    required this.idPersonnel,
    required this.idTypeAbsence,
  });

  factory DemandeAbscence.fromJson(Map<String, dynamic> json) =>
      DemandeAbscence(
        dateDernierModification:
            DateTime.parse(json["dateDernierModification"]),
        idDemandeAbsence: json["idDemandeAbsence"],
        telAbsence: json["telAbsence"],
        dureAbsence: json["dureAbsence"],
        validationChef2: json["validationChef2"],
        dateDebut: DateTime.parse(json["dateDebut"]),
        dateFin: DateTime.parse(json["dateFin"]),
        motifAbsence: json["motifAbsence"],
        mailAbsence: json["mailAbsence"],
        validationChef1: json["validationChef1"],
        dateSaisi: DateTime.parse(json["dateSaisi"]),
        validationRh: json["validationRH"],
        idPersonnel: json["idPersonnel"],
        idTypeAbsence: json["idTypeAbsence"],
      );

  Map<String, dynamic> toJson() => {
        "dateDernierModification":
            "${dateDernierModification.year.toString().padLeft(4, '0')}-${dateDernierModification.month.toString().padLeft(2, '0')}-${dateDernierModification.day.toString().padLeft(2, '0')}",
        "idDemandeAbsence": idDemandeAbsence,
        "telAbsence": telAbsence,
        "dureAbsence": dureAbsence,
        "validationChef2": validationChef2,
        "dateDebut":
            "${dateDebut.year.toString().padLeft(4, '0')}-${dateDebut.month.toString().padLeft(2, '0')}-${dateDebut.day.toString().padLeft(2, '0')}",
        "dateFin":
            "${dateFin.year.toString().padLeft(4, '0')}-${dateFin.month.toString().padLeft(2, '0')}-${dateFin.day.toString().padLeft(2, '0')}",
        "motifAbsence": motifAbsence,
        "mailAbsence": mailAbsence,
        "validationChef1": validationChef1,
        "dateSaisi":
            "${dateSaisi.year.toString().padLeft(4, '0')}-${dateSaisi.month.toString().padLeft(2, '0')}-${dateSaisi.day.toString().padLeft(2, '0')}",
        "validationRH": validationRh,
        "idPersonnel": idPersonnel,
        "idTypeAbsence": idTypeAbsence,
      };
}
