import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../components/button.dart';
import 'SwitchPages.dart';
import 'package:http/http.dart' as http;

class DemandePage extends StatefulWidget {
  const DemandePage({super.key});

  @override
  State<DemandePage> createState() => _DemandePageState();
}

bool isAttached = false;
PlatformFile? file;
FilePickerResult? result;
// final Date_d_controller = TextEditingController();
// final Date_r_controller = TextEditingController();
final type_conge_controller = TextEditingController();
final emailcontroller = TextEditingController();
final telecontroller = TextEditingController();
final commentcontroller = TextEditingController();
DateTime selectedDateD = DateTime.now();
DateTime selectedDateR = DateTime.now();

class _DemandePageState extends State<DemandePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.022),
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.018),
                    const Text(
                      'Demande',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.042),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text(
                      'Date depart',
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(179, 179, 179, 1))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green.shade400),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null && picked != selectedDateD) {
                          setState(() {
                            selectedDateD = picked;
                          });
                        }
                      },
                      icon: const Icon(CupertinoIcons.calendar),
                    ),
                  ),
                  controller: TextEditingController(
                      // text: DateFormat('MM/dd/yyyy').format(selectedDateD),
                      text: DateFormat('d MMM yyyy').format(selectedDateD)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.042),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text(
                      'Date retour',
                      style: TextStyle(),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(179, 179, 179, 1))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green.shade400),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null && picked != selectedDateR) {
                          setState(() {
                            selectedDateR = picked;
                          });
                        }
                      },
                      icon: const Icon(CupertinoIcons.calendar),
                    ),
                  ),
                  controller: TextEditingController(
                    // text: DateFormat('MM/dd/yyyy').format(selectedDateR),
                    text: DateFormat('d MMM yyyy').format(selectedDateR),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.042),
              DropdownM(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.042),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  maxLines: 3,
                  controller: commentcontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                    label: const Text(
                      'Commentaire',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
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
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(179, 179, 179, 1)),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.042),
              Container(child: Text("Le fichier attechee:  ${file!.name}")),
              SizedBox(height: MediaQuery.of(context).size.height * 0.021),
              isAttached == false
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: InkWell(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            file = result!.files.first;
                            if (file!.extension == "jpg" ||
                                file!.extension == "pdf") {
                              setState(() {
                                isAttached = true;
                              });
                            }
                          }
                          return;
                        },
                        splashColor: const Color.fromARGB(24, 66, 164, 245),
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(24, 66, 164, 245),
                            border: Border.all(
                                color: Colors.blue.shade400, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Attacher fichier',
                              style: TextStyle(
                                color: Colors.blue.shade400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                file = result!.files.first;
                                if (file!.extension == "jpg" ||
                                    file!.extension == "pdf") {}
                              }
                              return;
                            },
                            splashColor: const Color.fromARGB(24, 66, 164, 245),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(24, 66, 164, 245),
                                border: Border.all(
                                    color: Colors.blue.shade400, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Modifier',
                                  style: TextStyle(
                                    color: Colors.blue.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              OpenFile.open(file!.path!);
                            },
                            splashColor: const Color.fromARGB(24, 66, 164, 245),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(24, 66, 164, 245),
                                border: Border.all(
                                    color: Colors.blue.shade400, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Consulter',
                                  style: TextStyle(
                                    color: Colors.blue.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.021),
              L_Button(
                  onTap: () {
                    if (selectedDateR.isAfter(selectedDateD) ||
                        selectedDateR.isAtSameMomentAs(selectedDateR)) {
                      showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              content: const Text(
                                'Congé appliqué \navec succès',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text(
                                    'D\'accord',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SwitchPages()));
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            content: const Text(
                              'Les données sont invalides',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text(
                                  'D\'accord',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  type_conge_controller.clear();
                                  emailcontroller.clear();
                                  telecontroller.clear();
                                  commentcontroller.clear();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  text: 'Demander un congé'),
            ],
          )),
        ),
      ),
    );
  }
}
