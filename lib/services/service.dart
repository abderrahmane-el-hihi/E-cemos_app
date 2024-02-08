import 'dart:convert';
import 'dart:js_interop';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';
import '../models/AbsenceDemande.dart';
import '../models/DemandeAbscence.dart';
import '../models/Personnel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future GetPreviousEntryData() async {}
  Future GetApiData() async {}

  //get demande abscense data from api
  Future<List<DemandeAbscence>?> getDemandeList() async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cachedData');
    if (cachedData != null) {
      final response = await client.get(uri);
      final demandeList = demandeAbscenceFromJson(cachedData);

      if (response.statusCode == 200) {
        final fetchedData = response.body;

        if (fetchedData != cachedData) {
          await prefs.setString('cachedData', fetchedData);
        }
      }
      return demandeList;
    }
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final data = response.body;
      await prefs.setString('cachedData', data);
      return demandeAbscenceFromJson(data);
    }
  }

  Future<List<List<DemandeApprovedList>>?> getDemandeApproved() async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/Validation/1');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cachedDemandeApproved');
    if (cachedData != null) {
      final response = await client.get(uri);
      final approvedList = demandeApprovedListFromJson(cachedData);

      if (response.statusCode == 200) {
        final fetchedData = response.body;

        if (fetchedData != cachedData) {
          await prefs.setString('cachedDemandeApproved', fetchedData);
        }
      }
      return approvedList;
    }
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final data = response.body;

      return demandeApprovedListFromJson(data);
    }
  }

  //personnel info from api
  Future getPersonnel(int id) async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/$id');
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final cachedData = prefs.getString('cachedData');
    // if (cachedData != null) {
    //   final data = cachedData;
    //   return personnelFromJson(data);
    // }
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      // await prefs.setString('cachedData', data);
      return personnelFromJson(data);
    }
  }

  //get alll personnel
  Future getAllPersonnel() async {
    var client = http.Client();
    var uri = Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return allpersonnelFromJson(json);
    }
  }

  // get vacation balance
  Future getCongeSolde() async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/Conge/1');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cachedVacationBalance');
    if (cachedData != null) {
      final response = await client.get(uri);
      final data = json.decode(cachedData);

      if (response.statusCode == 200) {
        final fetchedData = json.decode(response.body);

        if (fetchedData != cachedData) {
          await prefs.setString('cachedVacationBalance', fetchedData);
        }
      }
      return data;
    }
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      return jsonData;
    }
  }

  //get demande absence
  Future getAbscence() async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cachedAbscenaveType');
    if (cachedData != null) {
      final response = await client.get(uri);
      final data = json.decode(cachedData);

      if (response.statusCode == 200) {
        final fetchedData = json.decode(response.body);

        if (fetchedData != cachedData) {
          await prefs.setString('cachedAbscenaveType', fetchedData);
        }
      }
      return data;
    }
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      return jsonData;
    }
  }

  // Future<List<AbsenceDemandeType>?> getAbscenceDemandeType() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('http://192.168.11.157:8800/api/CemosRH/TypeAbsence/');
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var data = response.body;
  //     print(json.decode(data));
  //     return absenceDemandeTypeFromJson(data);
  //   }
  // }

  Future<List<AbsenceDemandeType?>> getAbscenceDemandeType() async {
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
      return dItems;
    }
    return [];
  }

  //methode to check mail/pass
  // Future<bool> checkCredentials(String email, String password) async {
  //   final String apiUrl = 'api url'; // Replace with your API URL.

  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       //  valid.
  //       return true;
  //     } else {
  //       //invalid
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
  Future<bool> checkCredentials(String email, String password) async {
    //

    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    print(res.toString());
    if (1 == 1) {
      return true;
    } else {
      return false;
    }
    // final Session? session = res.session;
    // final User? user = res.user;
  }
}
