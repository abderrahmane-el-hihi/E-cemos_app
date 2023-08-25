import 'dart:convert';

List<AbsenceDemandeType> absenceDemandeTypeFromJson(String str) =>
    List<AbsenceDemandeType>.from(
        json.decode(str).map((x) => AbsenceDemandeType.fromJson(x)));

String absenceDemandeTypeToJson(List<AbsenceDemandeType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AbsenceDemandeType {
  int idTypeAbsence;
  Statut statut;
  String descriptionAbsence;
  String commentaire;

  AbsenceDemandeType({
    required this.idTypeAbsence,
    required this.statut,
    required this.descriptionAbsence,
    required this.commentaire,
  });

  factory AbsenceDemandeType.fromJson(Map<String, dynamic> json) =>
      AbsenceDemandeType(
        idTypeAbsence: json["idTypeAbsence"],
        statut: statutValues.map[json["statut"]]!,
        descriptionAbsence: json["descriptionAbsence"],
        commentaire: json["commentaire"],
      );

  Map<String, dynamic> toJson() => {
        "idTypeAbsence": idTypeAbsence,
        "statut": statutValues.reverse[statut],
        "descriptionAbsence": descriptionAbsence,
        "commentaire": commentaire,
      };
}

enum Statut { ACTIVE }

final statutValues = EnumValues({"Active": Statut.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
