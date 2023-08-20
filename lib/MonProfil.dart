import 'package:cemos_app/models/Personnel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/service.dart';

class MonProfil extends StatefulWidget {
  const MonProfil({super.key});

  @override
  State<MonProfil> createState() => _MonProfilState();
}

class _MonProfilState extends State<MonProfil> {
  // List<bool> isSelected = [true, false];
  // List<String> OptionsList = [
  //   'Personnel',
  //   'Professionnel',
  // ];
  // int _selectedButtonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.018),
                      const Text(
                        'Mon profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                FutureBuilder(
                    future: RemoteService().getPersonnel(1),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        Personnel p = snapshot.data;
                        return Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nom Prenom',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    '${p.nom} ${p.prenom}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    p.email,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Telephone',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    p.telephonePersonnel,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adresse',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    'address',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Center();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
