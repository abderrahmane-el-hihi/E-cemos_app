import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/GroupVacation.dart';
import '../components/VacationBalanceCard.dart';
import '../components/button.dart';
import '../models/DemandeAbscence.dart';
import '../components/DemandeCard.dart';
import '../models/Personnel.dart';
import '../services/service.dart';
import 'Demande.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _PageState();
}

class _PageState extends State<CalendarPage> {
  List<bool> isSelected = [true, false, false];
  List<String> optionsList = [
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
                                      VacationBalanceCard(
                                          color: Colors.blue.shade400,
                                          backgroundColor: const Color.fromARGB(
                                              24, 66, 164, 245),
                                          data:
                                              snapshot.data['vacation_balance'],
                                          vacationBalanceString:
                                              'Droit annuel'),
                                      VacationBalanceCard(
                                          color: Colors.green.shade400,
                                          backgroundColor: const Color.fromARGB(
                                              24, 102, 187, 106),
                                          data: snapshot
                                              .data['remaining_last_year'],
                                          vacationBalanceString:
                                              'Reste année \ndernière'),
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
                                      VacationBalanceCard(
                                          color: Colors.cyan.shade400,
                                          backgroundColor: const Color.fromARGB(
                                              24, 38, 197, 218),
                                          data: snapshot
                                              .data['consumed_this_year'],
                                          vacationBalanceString:
                                              'Consommation \ncette année'),
                                      VacationBalanceCard(
                                          color: Colors.red.shade400,
                                          backgroundColor: const Color.fromARGB(
                                              24, 239, 83, 80),
                                          data: snapshot
                                              .data['remaining_this_year'],
                                          vacationBalanceString: 'Reste'),
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
                                    VacationBalanceCard(
                                        color: Colors.blue.shade400,
                                        backgroundColor: const Color.fromARGB(
                                            24, 66, 164, 245),
                                        data: '',
                                        vacationBalanceString: 'Droit annuel'),
                                    VacationBalanceCard(
                                        color: Colors.green.shade400,
                                        backgroundColor: const Color.fromARGB(
                                            24, 102, 187, 106),
                                        data: '',
                                        vacationBalanceString:
                                            'Reste année \ndernière'),
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
                                    VacationBalanceCard(
                                        color: Colors.cyan.shade400,
                                        backgroundColor: const Color.fromARGB(
                                            24, 38, 197, 218),
                                        data: '',
                                        vacationBalanceString:
                                            'Consommation \ncette année'),
                                    VacationBalanceCard(
                                        color: Colors.red.shade400,
                                        backgroundColor: const Color.fromARGB(
                                            24, 239, 83, 80),
                                        data: '',
                                        vacationBalanceString: 'Reste'),
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
                                      optionsList[index],
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
                                          //
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
                                case 2:
                                  //TODO GroupVacation class
                                  List<dynamic> l = [1, 2];
                                  for (int idPerso in demandes![2] ?? l) {
                                    FutureBuilder(
                                        future: RemoteService()
                                            .getPersonnel(idPerso),
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
                                                      PostDate:
                                                          p.dateNaissance);
                                                });
                                          }
                                          return const Text("No Data");
                                        });
                                  }
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
