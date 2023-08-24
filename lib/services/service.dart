import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future getAllPersonnel() async {
    var client = http.Client();
    var uri = Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return allpersonnelFromJson(json);
    }
  }

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

  Future getAbscenceType() async {
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
  Future<String?> checkCredentials(String email, String password) async {
    const String apiUrl = 'api url';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String role = data['role'];
        String nom = data['nom'];
        String prenom = data['prenom'];
        return role;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
