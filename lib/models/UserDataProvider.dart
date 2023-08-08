import 'dart:convert';
import 'users.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  Users? _Users;
  Users? get userdata => _Users;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _Users = Users.fromJson(jsonData);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
