import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'DemandeAbscence.dart';
import 'Personnel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future GetPreviousEntryData() async {}
  Future GetApiData() async {}

  //get demande abscense data from api
  Future<List<DemandeAbscence>?> getDemandeList() async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final data = response.body;
      // var file = await DefaultCacheManager().getSingleFile('http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/');
      // print(file);
      return demandeAbscenceFromJson(data);
    }
  }

  Future<List<DemandeApprovedList>?> getDemandeApproved() async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/Approved/1');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final data = response.body;
      // var file = await DefaultCacheManager().getSingleFile('http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/');
      // print(file);
      return demandeApprovedListFromJson(data);
    }
  }

  //personnel info from api
  Future getPersonnel(int id) async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return personnelFromJson(json);
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
