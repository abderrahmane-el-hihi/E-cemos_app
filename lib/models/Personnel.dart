// import 'dart:ffi';

// class Personnel {
//   int IdPersonnel;
//   String? Matricule;
//   String? Cin;
//   String? Nom;
//   String? Prenom;
//   String? TelephonePersonnel;
//   String? TelephoneProfessionel;
//   String? EmailPersonnel;
//   String? Genre;
//   DateTime? DateNaissance;
//   String? LieuNaissance;
//   int? NbrEnfant;
//   String? Photo;
//   String? Email;
//   String? MotDePasse;
//   DateTime? DateAffiliation;
//   DateTime? DateDepart;
//   double? SoldeConge;
//   double? SalaireMensuel;
//   double? SalaireHoraire;
//   int? IdFromPointeurse;
//   int? CardNumber;
//   String? Statut;
//   int IdSociete;
//   int IdPoste;
//   int IdRole;

//   Personnel({
//     required this.IdPersonnel,
//     required this.Matricule,
//     required this.Cin,
//     required this.Nom,
//     required this.Prenom,
//     required this.TelephonePersonnel,
//     required this.TelephoneProfessionel,
//     required this.EmailPersonnel,
//     required this.Genre,
//     required this.DateNaissance,
//     required this.LieuNaissance,
//     required this.NbrEnfant,
//     required this.Photo,
//     required this.Email,
//     required this.MotDePasse,
//     required this.DateAffiliation,
//     required this.DateDepart,
//     required this.SoldeConge,
//     required this.SalaireMensuel,
//     required this.SalaireHoraire,
//     required this.IdFromPointeurse,
//     required this.CardNumber,
//     required this.Statut,
//     required this.IdSociete,
//     required this.IdPoste,
//     required this.IdRole,
//   });

//   factory Personnel.fromJson(Map<String, dynamic> json) {
//     return Personnel(
//       IdPersonnel: json["IdPersonnel"],
//       Matricule: json["Matricule"],
//       Cin: json["Cin"],
//       Nom: json["Nom"],
//       Prenom: json["Prenom"],
//       TelephonePersonnel: json["TelephonePersonnel"],
//       TelephoneProfessionel: json["TelephoneProfessionel"],
//       EmailPersonnel: json["EmailPersonnel"],
//       Genre: json["Genre"],
//       DateNaissance: json["DateNaissance"],
//       LieuNaissance: json["LieuNaissance"],
//       NbrEnfant: json["NbrEnfant"],
//       Photo: json["Photo"],
//       Email: json["Email"],
//       MotDePasse: json["MotDePasse"],
//       DateAffiliation: json["DateAffiliation"],
//       DateDepart: json["DateDepart"],
//       SoldeConge: json["SoldeConge"],
//       SalaireMensuel: json["SalaireMensuel"],
//       SalaireHoraire: json["SalaireHoraire"],
//       IdFromPointeurse: json["IdFromPointeurse"],
//       CardNumber: json["CardNumber"],
//       Statut: json["Statut"],
//       IdSociete: json["IdSociete"],
//       IdPoste: json["IdPoste"],
//       IdRole: json["IdRole"],
//     );
//   }
// }

//   // Map<String, dynamic> personnelToJson() => {
//   //       "IdPersonnel": this.IdPersonnel,
//   //       "Matricule": this.Matricule,
//   //       "Cin": this.Cin,
//   //       "Nom": this.Nom,
//   //       "Prenom": this.Prenom,
//   //       "TelephonePersonnel": this.TelephonePersonnel,
//   //       "TelephoneProfessionel": this.TelephoneProfessionel,
//   //       "EmailPersonnel": this.EmailPersonnel,
//   //       "Genre": this.Genre,
//   //       "DateNaissance": this.DateNaissance,
//   //       "LieuNaissance": this.LieuNaissance,
//   //       "NbrEnfant": this.NbrEnfant,
//   //       "Photo": this.Photo,
//   //       "Email": this.Email,
//   //       "MotDePasse": this.MotDePasse,
//   //       "DateAffiliation": this.DateAffiliation,
//   //       "DateDepart": this.DateDepart,
//   //       "SoldeConge": this.SoldeConge,
//   //       "SalaireMensuel": this.SalaireMensuel,
//   //       "SalaireHoraire": this.SalaireHoraire,
//   //       "IdFromPointeurse": this.IdFromPointeurse,
//   //       "CardNumber": this.CardNumber,
//   //       "Statut": this.Statut,
//   //       "IdSociete": this.IdSociete,
//   //       "IdPoste": this.IdPoste,
//   //       "IdRole": this.IdRole,
//   //     };

import 'dart:convert';

Personnel personnelFromJson(String str) => Personnel.fromJson(json.decode(str));

String personnelToJson(Personnel data) => json.encode(data.toJson());

class Personnel {
  String motDePasse;
  DateTime dateAffiliation;
  double salaireMensuel;
  dynamic salaireHoraire;
  String photo;
  int nbrEnfant;
  String email;
  int cardNumber;
  dynamic dateDepart;
  double soldeConge;
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
        "dateAffiliation":
            "${dateAffiliation.year.toString().padLeft(4, '0')}-${dateAffiliation.month.toString().padLeft(2, '0')}-${dateAffiliation.day.toString().padLeft(2, '0')}",
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
