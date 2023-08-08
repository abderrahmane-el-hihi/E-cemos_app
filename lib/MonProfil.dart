import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonProfil extends StatefulWidget {
  const MonProfil({super.key});

  @override
  State<MonProfil> createState() => _MonProfilState();
}

class _MonProfilState extends State<MonProfil> {
  List<bool> isSelected = [true, false];
  List<String> OptionsList = [
    'Personnel',
    'Professionnel',
  ];
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
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Prenom',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey.shade400),
                      ),
                      const Text(
                        'Nom Prenom',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey.shade400),
                      ),
                      const Text(
                        'exemple@gmail.com',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telephone',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey.shade400),
                      ),
                      const Text(
                        '0666666666',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adresse',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey.shade400),
                      ),
                      const Text(
                        'Laayoune',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
