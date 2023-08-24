import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'Pages/LeaveDetailsPage.dart';
import 'models/DemandeAbscence.dart';
import 'components/DemandeCard.dart';
import 'models/Personnel.dart';

import 'services/service.dart';

class twidget extends StatefulWidget {
  const twidget({super.key});

  @override
  State<twidget> createState() => _twidgetState();
}

class _twidgetState extends State<twidget> {
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  GetIpandname() async {
    final info = NetworkInfo();
    final wifiIP = await info.getWifiIP();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');
    print('Running on ${androidInfo.version.release}');
    print(wifiIP);
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }

  Future<String?> getPublicIP() async {
    try {
      var url = Uri.parse('https://api.ipify.org');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // The response body is the IP in plain text, so just
        // return it as-is.
        return response.body;
      } else {
        // The request failed with a non-200 code
        // The ipify.org API has a lot of guaranteed uptime
        // promises, so this shouldn't ever actually happen.
        print(response.statusCode);
        print(response.body);
        return null;
      }
    } catch (e) {
      // Request failed due to an error, most likely because
      // the phone isn't connected to the internet.
      print(e);
      return null;
    }
  }

  ///api fetching sectiion
  Future getDemandeList() async {
    const apiUrl = 'http://192.168.11.157:8800/api/CemosRH/Personnelles/1';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // var data = json.decode(response.body);
        var data = response.body;

        print(data);
        print("=============================");
        print(demandeAbscenceFromJson(data));
        return demandeAbscenceFromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future GetApiData() async {
    var client = http.Client();
    var uri =
        Uri.parse('http://192.168.11.157:8800/api/CemosRH/Personnelles/1');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return personnelFromJson(json);
    }
  }

  final _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // GetIpandname();
                  // printIps();
                  // getPublicIP();
                  // LoadData();
                  // GetApiData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaveDetailsPage(
                                data: RemoteService().getPersonnel(1),
                                id: 1,
                              )));
                },
                child: Text('click')),
          ],
        ),
      )),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: twidget(),
//     ),
//   );
// }
