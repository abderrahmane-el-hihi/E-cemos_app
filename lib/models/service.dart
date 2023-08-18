import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'CemosUsers.dart';
import 'DemandeAbscence.dart';
import 'Personnel.dart';
import 'users.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Users>?> GetApiData() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      // var file = await DefaultCacheManager().getSingleFile('https://jsonplaceholder.typicode.com/users');
      // print(file);

      return UsersFromJson(json);
    }
  }

  //get cemos users data from api
  Future<List<CemosUsers>?> GetCemosUsersData() async {
    var client = http.Client();
    var uri = Uri.parse('api url');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return CemosUsersFromJson(json);
    }
  }

  // previous days data for
  Future GetPreviousEntryData() async {
    String url = 'https://jsonplaceholder.typicode.com/users'; //api
    var response = await http.Client().get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return UsersFromJson(
          jsonData); //create a class based on json data comming rom api  in quicktype.app to work with the class created
    }
  }

  //get demande abscense data from api
  // Future<List<DemandeAbscence>?> GetDemandeAbscence() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('localhost:8800/api/CemosRH/DemanceAbsence');
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     print(demandeAbscenceFromJson(json));
  //     return demandeAbscenceFromJson(json);
  //   }
  // }
  Future<List<DemandeAbscence>?> getDemandeList() async {
    const apiUrl = 'http://192.168.11.157:8800/api/CemosRH/DemanceAbsence/';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = response.body;
        return demandeAbscenceFromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future getPersonnel() async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/1');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return personnelFromJson(json);
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
    const String apiUrl = 'api url'; // Replace with your API URL.

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Credentials are valid, parse the response JSON to get the user's role.
        final data = json.decode(response.body);
        String role =
            data['role']; // Assuming the API response has a 'role' field.
        String nom =
            data['nom']; // Assuming the API response has a 'role' field.
        String prenom =
            data['prenom']; // Assuming the API response has a 'role' field.
        return role;
      } else {
        // Credentials are invalid, return null or an empty string to indicate failure.
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}