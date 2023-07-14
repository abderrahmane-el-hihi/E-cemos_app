import 'package:intl/intl.dart';
import 'package:cemos_app/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'components/button.dart';

class DemandePage extends StatefulWidget {
  const DemandePage({super.key});

  @override
  State<DemandePage> createState() => _DemandePageState();
}

final Date_d_controller = TextEditingController();
final Date_r_controller = TextEditingController();
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
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Demande',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text('Date depart'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(179, 179, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(131, 172, 64, 1)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null && picked != selectedDateD)
                                setState(() {
                                  selectedDateD = picked;
                                });
                            },
                            icon: Icon(Icons.calendar_today),
                          ),
                        ),
                        controller: TextEditingController(
                          text: DateFormat('MM/dd/yyyy').format(selectedDateD),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text('Date retour'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(179, 179, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(131, 172, 64, 1)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null && picked != selectedDateR)
                                setState(() {
                                  selectedDateR = picked;
                                });
                            },
                            icon: Icon(Icons.calendar_today),
                          ),
                        ),
                        controller: TextEditingController(
                          text: DateFormat('MM/dd/yyyy').format(selectedDateR),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              DropdownM(),
              SizedBox(height: 10),
              Text_Field(
                  controller: emailcontroller,
                  hinText: 'Email',
                  obsecureText: false),
              SizedBox(height: 10),
              Text_Field(
                  controller: telecontroller,
                  hinText: 'Telephone',
                  obsecureText: false),
              SizedBox(height: 10),
              Text_Field(
                  controller: commentcontroller,
                  hinText: 'Commentaire',
                  obsecureText: false),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.first;
                    // Do something with the selected file
                  }
                },
                child: Text('Attach File'),
              ),
              SizedBox(height: 10),
              L_Button(onTap: () {}, text: 'Valider'),
            ],
          )),
        ),
      ),
    );
  }
}
