import 'package:cemos_app/LoginPage.dart';
import 'package:cemos_app/SettingsPage.dart';
import 'package:cemos_app/models/Personnel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MonProfil.dart';
import 'models/service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              FutureBuilder(
                  future: RemoteService().getPersonnel(1),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      Personnel p = snapshot.data;
                      return Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.grey.shade400,
                            size: 128,
                          ),
                          Text(
                            p.nom + ' ' + p.prenom,
                            style: const TextStyle(fontSize: 22),
                          ),
                          Text(
                            'Service IT',
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.grey.shade400,
                          size: 128,
                        ),
                        const Text(
                          'Nom Prenom',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
                        ),
                        const Text(
                          'Service',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ],
                    );
                  }),
              // Consumer<personnelDataProvider>(
              //     builder: (context, personneldata, child) {
              //   return Column(
              //     children: [
              //       Icon(
              //         Icons.account_circle,
              //         color: Colors.grey.shade400,
              //         size: 128,
              //       ),
              //       Text(
              //         personneldata.personneldata!.nom,
              //         style:
              //             const TextStyle(fontFamily: 'Poppins', fontSize: 22),
              //       ),
              //       Text(
              //         'Service IT',
              //         style: const TextStyle(fontFamily: 'Poppins'),
              //       ),
              //     ],
              //   );
              // }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MonProfil()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(24, 102, 187, 106)),
                      child: const Icon(CupertinoIcons.person),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mon profil',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(24, 102, 187, 106)),
                      child: const Icon(CupertinoIcons.gear),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Paramètres',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(24, 239, 83, 80)),
                      child: const Icon(CupertinoIcons.square_arrow_left),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Se déconnecter',
                            style: TextStyle(color: Colors.red.shade400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
