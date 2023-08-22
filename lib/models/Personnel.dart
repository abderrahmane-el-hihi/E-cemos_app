import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Personnel personnelFromJson(var str) => Personnel.fromJson(json.decode(str));
List<Personnel> allpersonnelFromJson(String str) =>
    List<Personnel>.from(json.decode(str).map((x) => Personnel.fromJson(x)));
String allpersonnelToJson(List<Personnel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String personnelToJson(Personnel data) => json.encode(data.toJson());

class Personnel {
  String? motDePasse;
  DateTime dateAffiliation;
  double? salaireMensuel;
  dynamic salaireHoraire;
  String photo;
  int nbrEnfant;
  String email;
  int cardNumber;
  dynamic dateDepart;
  double? soldeConge;
  int idSociete;
  int idPoste;
  int idRole;
  String statut;
  String genre;
  String cin;
  int idPersonnelles;
  DateTime dateNaissance;
  String matricule;
  String lieuNaissance;
  String emailPersonnel;
  String prenom;
  String nom;
  dynamic idFromPointeurse;
  String telephonePersonnel;
  String telephoneProfessionel;

  Personnel({
    required this.motDePasse,
    required this.dateAffiliation,
    required this.salaireMensuel,
    required this.salaireHoraire,
    required this.photo,
    required this.nbrEnfant,
    required this.email,
    required this.cardNumber,
    required this.dateDepart,
    required this.soldeConge,
    required this.idSociete,
    required this.idPoste,
    required this.idRole,
    required this.statut,
    required this.genre,
    required this.cin,
    required this.idPersonnelles,
    required this.dateNaissance,
    required this.matricule,
    required this.lieuNaissance,
    required this.emailPersonnel,
    required this.prenom,
    required this.nom,
    required this.idFromPointeurse,
    required this.telephonePersonnel,
    required this.telephoneProfessionel,
  });

  factory Personnel.fromJson(Map<String, dynamic> json) => Personnel(
        motDePasse: json["motDePasse"],
        dateAffiliation: DateTime.parse(json["dateAffiliation"]),
        salaireMensuel: json["salaireMensuel"],
        salaireHoraire: json["salaireHoraire"],
        photo: json["photo"],
        nbrEnfant: json["nbrEnfant"],
        email: json["email"],
        cardNumber: json["cardNumber"],
        dateDepart: json["dateDepart"],
        soldeConge: json["soldeConge"]?.toDouble(),
        idSociete: json["idSociete"],
        idPoste: json["idPoste"],
        idRole: json["idRole"],
        statut: json["statut"],
        genre: json["genre"],
        cin: json["cin"],
        idPersonnelles: json["idPersonnelles"],
        dateNaissance: DateTime.parse(json["dateNaissance"]),
        matricule: json["matricule"],
        lieuNaissance: json["lieuNaissance"],
        emailPersonnel: json["emailPersonnel"],
        prenom: json["prenom"],
        nom: json["nom"],
        idFromPointeurse: json["idFromPointeurse"],
        telephonePersonnel: json["telephonePersonnel"],
        telephoneProfessionel: json["telephoneProfessionel"],
      );

  Map<String, dynamic> toJson() => {
        "motDePasse": motDePasse,
        // "dateAffiliation":"${dateAffiliation.year.toString().padLeft(4, '0')}-${dateAffiliation.month.toString().padLeft(2, '0')}-${dateAffiliation.day.toString().padLeft(2, '0')}" ,
        "salaireMensuel": salaireMensuel,
        "salaireHoraire": salaireHoraire,
        "photo": photo,
        "nbrEnfant": nbrEnfant,
        "email": email,
        "cardNumber": cardNumber,
        "dateDepart": dateDepart,
        "soldeConge": soldeConge,
        "idSociete": idSociete,
        "idPoste": idPoste,
        "idRole": idRole,
        "statut": statut,
        "genre": genre,
        "cin": cin,
        "idPersonnelles": idPersonnelles,
        "dateNaissance":
            "${dateNaissance.year.toString().padLeft(4, '0')}-${dateNaissance.month.toString().padLeft(2, '0')}-${dateNaissance.day.toString().padLeft(2, '0')}",
        "matricule": matricule,
        "lieuNaissance": lieuNaissance,
        "emailPersonnel": emailPersonnel,
        "prenom": prenom,
        "nom": nom,
        "idFromPointeurse": idFromPointeurse,
        "telephonePersonnel": telephonePersonnel,
        "telephoneProfessionel": telephoneProfessionel,
      };
}

class personnelDataProvider extends ChangeNotifier {
  Personnel? _Personnel;
  Personnel? get personneldata => _Personnel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('http://192.168.1.102:8800/api/CemosRH/Personnelles/1'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _Personnel = personnelFromJson(jsonData);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
