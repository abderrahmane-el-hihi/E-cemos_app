import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/button.dart';
import '../models/DemandeAbscence.dart';
import '../models/DemandeCard.dart';
import '../models/Personnel.dart';
import '../services/service.dart';
import 'Demande.dart';
import 'LeaveDetailsPage.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _PageState();
}

class _PageState extends State<CalendarPage> {
  List<bool> isSelected = [true, false, false];
  List<String> OptionsList = [
    'Demandes \nde Congé',
    'Validation',
    'Mon\néquipe',
  ];
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonStateModel>(
      builder: (context, buttonState, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: WillPopScope(
            onWillPop: () async {
              SystemNavigator.pop();
              return false;
            },
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tous les départs',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // child: const Icon(CupertinoIcons.plus_app,size: 32)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DemandePage()),
                              );
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(24, 66, 164, 245),
                                border: Border.all(
                                    color: Colors.blue.shade400, width: 2.0),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.plus,
                                    size: 28,
                                    color: Colors.blue.shade400,
                                  ),
                                  Text(
                                    'Ajouter',
                                    style:
                                        TextStyle(color: Colors.blue.shade400),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022),
                    FutureBuilder(
                        future: RemoteService().getCongeSolde(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.135,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                24, 66, 164, 245),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue.shade400,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.022),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text('Droit annuel',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    )),
                                                Text(
                                                    snapshot.data[
                                                        'vacation_balance'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Colors
                                                            .blue.shade400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.135,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                24, 102, 187, 106),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.green.shade400,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.022),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text(
                                                    'Reste anneé \ndernière',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    )),
                                                Text(
                                                    snapshot.data[
                                                        'remaining_last_year'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Colors
                                                            .green.shade400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.022),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.135,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                24, 38, 197, 218),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.cyan.shade400,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.022),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text(
                                                    'Consommation \ncette anneé',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    )),
                                                Text(
                                                    snapshot.data[
                                                        'consumed_this_year'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Colors
                                                            .cyan.shade400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.135,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                24, 239, 83, 80),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.red.shade400,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.022),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text('Reste',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    )),
                                                Text(
                                                    snapshot.data[
                                                        'remaining_this_year'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Colors
                                                            .red.shade400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              24, 66, 164, 245),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.blue.shade400,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.022),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Droit annuel',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              24, 102, 187, 106),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.green.shade400,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.022),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Reste anneé \ndernière',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.022),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              24, 38, 197, 218),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.cyan.shade400,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.022),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Consommation \ncette anneé',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              24, 239, 83, 80),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.red.shade400,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.022),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.012),
                                              const Text('Reste',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.066,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GridView.count(
                          primary: true,
                          crossAxisCount: 3,
                          childAspectRatio: 2.2,
                          children: List.generate(isSelected.length, (index) {
                            return InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  setState(() {
                                    _selectedButtonIndex = index;
                                    for (int indexBtn = 0;
                                        indexBtn < isSelected.length;
                                        indexBtn++) {
                                      if (indexBtn == index) {
                                        isSelected[indexBtn] = true;
                                      } else {
                                        isSelected[indexBtn] = false;
                                      }
                                    }
                                  });
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: isSelected[index]
                                        ? Colors.blue.shade400
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      OptionsList[index],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: isSelected[index]
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ));
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.375,
                      color: Colors.grey.shade100,
                      child: FutureBuilder(
                          future: RemoteService().getDemandeApproved(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<List<DemandeApprovedList>>? demandes =
                                  snapshot.data;
                              switch (_selectedButtonIndex) {
                                case 0:
                                  int idList = 0;
                                  return ListView.builder(
                                      itemCount: demandes!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DemandeCard(
                                          idList: idList,
                                          id: 0,
                                          data: RemoteService()
                                              .getDemandeApproved(),
                                          DemandeType:
                                              demandes[idList][0].motifAbsence,
                                          date:
                                              "${DateFormat('d MMM, yyyy').format(demandes[idList][0].dateDebut)} - ${DateFormat('d MMM, yyyy').format(demandes[idList][0].dateFin)}",
                                          dureeabscence: demandes[idList][0]
                                              .dureAbsence
                                              ?.toInt(),
                                          Telephone:
                                              demandes[idList][0].telAbsence,
                                          ValidationRH:
                                              demandes[idList][0].validationRh,
                                          ValidationChef1: demandes[idList][0]
                                              .validationChef1,
                                          ValidationChef2: demandes[idList][0]
                                              .validationChef2,
                                        );
                                      });
                                case 1:
                                  return ListView.builder(
                                      itemCount: demandes!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        int idList = 1;
                                        return DemandeCard(
                                          idList: idList,
                                          id: 1,
                                          data: RemoteService()
                                              .getDemandeApproved(),
                                          DemandeType:
                                              demandes[idList][0].motifAbsence,
                                          date:
                                              "${DateFormat('d MMM, yyyy').format(demandes[idList][0].dateDebut)} - ${DateFormat('d MMM, yyyy').format(demandes[idList][0].dateFin)}",
                                          dureeabscence: demandes[idList][0]
                                              .dureAbsence
                                              ?.toInt(),
                                          Telephone:
                                              demandes[idList][0].telAbsence,
                                          ValidationRH:
                                              demandes[idList][0].validationRh,
                                          ValidationChef1: demandes[idList][0]
                                              .validationChef1,
                                          ValidationChef2: demandes[idList][0]
                                              .validationChef2,
                                        );
                                      });
                                case 2:
                                  //TODO GroupVacation class
                                  FutureBuilder(
                                      future: RemoteService().getPersonnel(
                                          demandes![2][0].idPersonnel!.toInt()),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          Personnel p = snapshot.data;
                                          return ListView.builder(
                                              itemCount: demandes.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return GroupVacation(
                                                    data: RemoteService()
                                                        .getPersonnel(1),
                                                    id: 1,
                                                    Name:
                                                        "${p.nom} ${p.prenom}",
                                                    Photo: p.photo,
                                                    PostDate: p.dateNaissance);
                                              });
                                        }
                                        return const Text("No Data");
                                      });
                              }
                            }
                            return DemandeCard(
                              id: 0,
                              idList: 0,
                              DemandeType: "",
                              date: "",
                              dureeabscence: 0,
                              Telephone: "",
                              ValidationRH: "",
                              ValidationChef1: "",
                              ValidationChef2: "",
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
