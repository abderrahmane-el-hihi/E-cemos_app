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
                },
                child: Text('click')),
          ],
        ),
      )),
    );
  }
}

class DropdownItem {
  final int id;
  final String displayText;

  DropdownItem({required this.id, required this.displayText});
}

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  List<DropdownItem> dropdownItems = [
    DropdownItem(id: 1, displayText: 'Item 1'),
    DropdownItem(id: 2, displayText: 'Item 2'),
    DropdownItem(id: 3, displayText: 'Item 3'),
  ];

  int? selectedItemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form Page'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200.0), // Set a maximum height
          child: DropdownButtonFormField<DropdownItem>(
            borderRadius: BorderRadius.circular(15),
            elevation: 1,
            dropdownColor: Colors.grey.shade100,
            decoration: InputDecoration(
              label: const Text(
                'Choisir la demande',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(179, 179, 179, 1))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.green.shade400),
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
            value: selectedItemId != null
                ? dropdownItems.firstWhere((item) => item.id == selectedItemId)
                : null,
            items: dropdownItems.map((item) {
              return DropdownMenuItem<DropdownItem>(
                value: item,
                child: Text(item.displayText),
              );
            }).toList(),
            onChanged: (selectedItem) {
              setState(() {
                selectedItemId = selectedItem != null ? selectedItem.id : null;
              });
            },
          ),
        ),
      ),
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
