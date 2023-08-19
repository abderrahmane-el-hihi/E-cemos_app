import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'Demande.dart';
import 'components/button.dart';
import 'models/DemandeAbscence.dart';
import 'models/DemandeCard.dart';
import 'models/Personnel.dart';
import 'models/service.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _PageState();
}

class _PageState extends State<CalendarPage> {
  List<bool> isSelected = [true, false, false];
  List<String> OptionsList = [
    'Congé',
    'Validation',
    'Congé \nd\'équipe',
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
                              fontFamily: 'Poppins',
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
                        future: RemoteService().GetApiData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                                        fontFamily: 'Poppins')),
                                                CircularProgressIndicator(
                                                    color:
                                                        Colors.blue.shade400),
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
                                                        fontFamily: 'Poppins')),
                                                CircularProgressIndicator(
                                                  color: Colors.green.shade400,
                                                ),
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
                                                        fontFamily: 'Poppins')),
                                                CircularProgressIndicator(
                                                  color: Colors.cyan.shade400,
                                                ),
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
                                                        fontFamily: 'Poppins')),
                                                CircularProgressIndicator(
                                                  color: Colors.red.shade400,
                                                ),
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
                          } else if (snapshot.hasData) {
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
                                                        fontFamily: 'Poppins')),
                                                Text('10',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Poppins',
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
                                                        fontFamily: 'Poppins')),
                                                Text('10',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Poppins',
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
                                                        fontFamily: 'Poppins')),
                                                Text('10',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Poppins',
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
                                                        fontFamily: 'Poppins')),
                                                Text('10',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Poppins',
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins')),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins')),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins')),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins')),
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
                    //////////////////// using provider to provide data across the app
                    // Consumer<UserDataProvider>(
                    //     builder: (context, userdata, child) {
                    //   return Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 16),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Container(
                    //               width:
                    //                   MediaQuery.of(context).size.width * 0.43,
                    //               height: MediaQuery.of(context).size.height *
                    //                   0.135,
                    //               decoration: BoxDecoration(
                    //                   color: const Color.fromARGB(
                    //                       24, 66, 164, 245),
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                     width: 1,
                    //                     color: Colors.blue.shade400,
                    //                   )),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   SizedBox(
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.022),
                    //                   Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceAround,
                    //                     children: [
                    //                       const Text('Droit annuel',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 14,
                    //                               fontFamily: 'Poppins')),
                    //                       Text(userdata.userdata!.name),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Container(
                    //               width:
                    //                   MediaQuery.of(context).size.width * 0.43,
                    //               height: MediaQuery.of(context).size.height *
                    //                   0.135,
                    //               decoration: BoxDecoration(
                    //                   color: const Color.fromARGB(
                    //                       24, 102, 187, 106),
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                     width: 1,
                    //                     color: Colors.green.shade400,
                    //                   )),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   SizedBox(
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.022),
                    //                   Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceAround,
                    //                     children: [
                    //                       const Text('Reste anneé \ndernière',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 14,
                    //                               fontFamily: 'Poppins')),
                    //                       Text(userdata.userdata!.name),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       SizedBox(
                    //           height:
                    //               MediaQuery.of(context).size.height * 0.022),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 16),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Container(
                    //               width:
                    //                   MediaQuery.of(context).size.width * 0.43,
                    //               height: MediaQuery.of(context).size.height *
                    //                   0.135,
                    //               decoration: BoxDecoration(
                    //                   color: const Color.fromARGB(
                    //                       24, 38, 197, 218),
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                     width: 1,
                    //                     color: Colors.cyan.shade400,
                    //                   )),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   SizedBox(
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.022),
                    //                   Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceAround,
                    //                     children: [
                    //                       const Text(
                    //                           'Consommation \ncette anneé',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 14,
                    //                               fontFamily: 'Poppins')),
                    //                       Text(userdata.userdata!.name),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Container(
                    //               width:
                    //                   MediaQuery.of(context).size.width * 0.43,
                    //               height: MediaQuery.of(context).size.height *
                    //                   0.135,
                    //               decoration: BoxDecoration(
                    //                   color:
                    //                       const Color.fromARGB(24, 239, 83, 80),
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                     width: 1,
                    //                     color: Colors.red.shade400,
                    //                   )),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   SizedBox(
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.022),
                    //                   Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceAround,
                    //                     children: [
                    //                       SizedBox(
                    //                           height: MediaQuery.of(context)
                    //                                   .size
                    //                                   .height *
                    //                               0.012),
                    //                       const Text('Reste',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 14,
                    //                               fontFamily: 'Poppins')),
                    //                       Text(userdata.userdata!.name),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: ToggleButtons(

                    //     splashColor: Colors.grey.shade400,

                    //     direction: Axis.horizontal,
                    //     onPressed: (int index) {
                    //       setState(() {
                    //         _selectedButtonIndex = index;
                    //         for (int i = 0; i < SelectedButton.length; i++) {
                    //           SelectedButton[i] = i == index;
                    //         }
                    //       });
                    //     },
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(8)),
                    //     // selectedBorderColor: Colors.red[700],
                    //     selectedColor: Colors.white,
                    //     fillColor: const Color.fromARGB(222, 66, 164, 245),
                    //     color: Colors.grey,
                    //     constraints: BoxConstraints(
                    //       minHeight: 50,
                    //       // minWidth: 110,
                    //       minWidth: MediaQuery.of(context).size.width * 0.3,
                    //     ),
                    //     isSelected: SelectedButton,
                    //     children: [
                    //       Text('prochain',
                    //           style: TextStyle(
                    //             fontFamily: 'Poppins',
                    //             fontSize: 12,
                    //           )),
                    //       Text('passé',
                    //           style: TextStyle(
                    //             fontFamily: 'Poppins',
                    //             fontSize: 12,
                    //           )),
                    //       Text('Congé \nd\'équipe',
                    //           style: TextStyle(
                    //             fontFamily: 'Poppins',
                    //             fontSize: 12,
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.068,
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
                                          fontFamily: 'Poppins',
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
                      child: _selectedButtonIndex == 0
                          ? FutureBuilder(
                              future: RemoteService().getDemandeList(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  List<DemandeAbscence>? demandes =
                                      snapshot.data;
                                  return ListView.builder(
                                      itemCount: demandes!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DemandeCard(
                                          DemandeType:
                                              "${demandes[0].motifAbsence}",
                                          date:
                                              "${DateFormat('d MMM, yyyy').format(demandes[0].dateDebut)} - ${DateFormat('d MMM, yyyy').format(demandes[0].dateFin)}",
                                          dureeabscence:
                                              demandes[0].dureAbsence?.toInt(),
                                          Telephone:
                                              "${demandes[0].telAbsence}",
                                          ValidationRH:
                                              "${demandes[0].validationRh}",
                                          ValidationChef1:
                                              "${demandes[0].validationChef1}",
                                          ValidationChef2:
                                              "${demandes[0].validationChef2}",
                                        );
                                      });
                                }
                                return DemandeCard(
                                  DemandeType: "",
                                  date: "",
                                  dureeabscence: 0,
                                  Telephone: "",
                                  ValidationRH: "",
                                  ValidationChef1: "",
                                  ValidationChef2: "",
                                );
                              })
                          : _selectedButtonIndex == 1
                              ? FutureBuilder(
                                  future: RemoteService().getDemandeApproved(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      List<DemandeApprovedList>? demandes =
                                          snapshot.data;
                                      return ListView.builder(
                                          itemCount: demandes!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return DemandeCard(
                                              DemandeType:
                                                  demandes[0].motifAbsence,
                                              date:
                                                  "${DateFormat('d MMM, yyyy').format(demandes[0].dateDebut)} - ${DateFormat('d MMM, yyyy').format(demandes[0].dateFin)}",
                                              dureeabscence: demandes[0]
                                                  .dureAbsence
                                                  ?.toInt(),
                                              Telephone: demandes[0].telAbsence,
                                              ValidationRH:
                                                  demandes[0].validationRh,
                                              ValidationChef1:
                                                  demandes[0].validationChef1,
                                              ValidationChef2:
                                                  demandes[0].validationChef2,
                                            );
                                          });
                                    }
                                    return DemandeCard(
                                      DemandeType: "",
                                      date: "",
                                      dureeabscence: 0,
                                      Telephone: "",
                                      ValidationRH: "",
                                      ValidationChef1: "",
                                      ValidationChef2: "",
                                    );
                                  })
                              : FutureBuilder(
                                  future: RemoteService().getPersonnel(1),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      Personnel p = snapshot.data;
                                      return ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GroupVacation(
                                                Name: "${p.nom} ${p.prenom}",
                                                Photo: p.photo,
                                                PostDate: p.dateNaissance);
                                          });
                                    }
                                    return GroupVacation(
                                        Name: "",
                                        Photo: "",
                                        PostDate: DateTime.now());
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






















// showCupertinoDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoAlertDialog(
//         // title: Text(
//         //   'Congé appliqué \navec succès',
//         //   style: TextStyle(
//         //     fontFamily: 'Poppins',
//         //     fontSize: 14,
//         //   ),
//         // ),
//         title: Text(
//           'Demande de Congé',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 16,
//           ),
//         ),
//         content: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Appliquée le:',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   ),
//                   Text(
//                     '${DateFormat('MMM d, yyyy').format(DateTime.now())}',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Jours d\'applications:',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   ),
//                   Text(
//                     '5',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Solde de Congé:',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   ),
//                   Text(
//                     '16',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Approuvé par:',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   ),
//                   Text(
//                     'RH',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Etat:',
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       // fontSize: 12,
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: const Color
//                                 .fromARGB(24,
//                             102, 187, 106),
//                         borderRadius:
//                             BorderRadius
//                                 .circular(5)),
//                     padding:
//                         const EdgeInsets.all(
//                             4),
//                     child: Text(
//                       'Approuvé',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors
//                               .green.shade400,
//                           fontFamily:
//                               "Poppins"),
//                     ),
//                   ),
//                 ],
//               ),
//             ]),

//         // actions: [
//         //   CupertinoDialogAction(
//         //     child: Text(
//         //       'D\'accord',
//         //       style: TextStyle(
//         //         fontFamily: 'Poppins',
//         //         fontSize: 14,
//         //       ),
//         //     ),
//         //     onPressed: () {
//         //       Navigator.pop(context);
//         //     },
//         //   ),
//         // ],
//       );
//     });






///////// filtrage icon and showmodalbottomsheet
// SizedBox(
//                                 width:
//                                     MediaQuery.of(context).size.height * 0.012),
//                             GestureDetector(
//                                 onTap: () {
//                                   // showModalBottomSheet(
//                                   //   context: context,
//                                   //   builder: (BuildContext context) {
//                                   //     return Container(
//                                   //       decoration: BoxDecoration(
//                                   //           color: Colors.grey.shade100,
//                                   //           borderRadius:
//                                   //               BorderRadius.circular(30)),
//                                   //       child: Wrap(
//                                   //         children: [
//                                   //           Container(
//                                   //             padding:
//                                   //                 const EdgeInsets.symmetric(
//                                   //                     horizontal: 24,
//                                   //                     vertical: 10),
//                                   //             child: Column(
//                                   //               children: [
//                                   //                 Padding(
//                                   //                   padding:
//                                   //                       const EdgeInsets.only(
//                                   //                           top: 8),
//                                   //                   child: Text(
//                                   //                     'Les filtres',
//                                   //                     style: TextStyle(
//                                   //                       fontFamily: "Poppins",
//                                   //                       fontSize: 16,
//                                   //                     ),
//                                   //                   ),
//                                   //                 ),
//                                   //               ],
//                                   //             ),
//                                   //           ),
//                                   //           Container(
//                                   //               margin: EdgeInsets.symmetric(
//                                   //                   horizontal: 25),
//                                   //               child: Divider(
//                                   //                   color: const Color.fromRGBO(
//                                   //                       179, 179, 179, 1),
//                                   //                   thickness: 1)),
//                                   //           Column(
//                                   //             children: [
//                                   //               Row(
//                                   //                 mainAxisAlignment:
//                                   //                     MainAxisAlignment.start,
//                                   //                 children: [
//                                   //                   Padding(
//                                   //                     padding: const EdgeInsets
//                                   //                             .symmetric(
//                                   //                         horizontal: 48,
//                                   //                         vertical: 10),
//                                   //                     child: Text(
//                                   //                       'Status',
//                                   //                       style: TextStyle(
//                                   //                           fontWeight:
//                                   //                               FontWeight.w500,
//                                   //                           fontFamily:
//                                   //                               "Poppins"),
//                                   //                     ),
//                                   //                   ),
//                                   //                 ],
//                                   //               ),
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets
//                                   //                         .symmetric(
//                                   //                     horizontal: 24),
//                                   //                 child: Row(
//                                   //                   children: [
//                                   //                     Checkbox(
//                                   //                         activeColor: Colors
//                                   //                             .blue.shade400,
//                                   //                         tristate: false,
//                                   //                         value: isChecked1,
//                                   //                         onChanged: (value) {
//                                   //                           setState(() {
//                                   //                             isChecked1 =
//                                   //                                 value;
//                                   //                           });
//                                   //                         }),
//                                   //                     SizedBox(
//                                   //                         width: MediaQuery.of(
//                                   //                                     context)
//                                   //                                 .size
//                                   //                                 .width *
//                                   //                             0.018),
//                                   //                     Text('Approuvé'),
//                                   //                   ],
//                                   //                 ),
//                                   //               ),
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets
//                                   //                         .symmetric(
//                                   //                     horizontal: 24),
//                                   //                 child: Row(
//                                   //                   children: [
//                                   //                     Checkbox(
//                                   //                         activeColor: Colors
//                                   //                             .blue.shade400,
//                                   //                         tristate: false,
//                                   //                         value: isChecked2,
//                                   //                         onChanged: (value) {
//                                   //                           setState(() {
//                                   //                             isChecked2 =
//                                   //                                 value;
//                                   //                           });
//                                   //                         }),
//                                   //                     SizedBox(
//                                   //                         width: MediaQuery.of(
//                                   //                                     context)
//                                   //                                 .size
//                                   //                                 .width *
//                                   //                             0.012),
//                                   //                     Text('Rejeté'),
//                                   //                   ],
//                                   //                 ),
//                                   //               ),
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets
//                                   //                         .symmetric(
//                                   //                     horizontal: 24),
//                                   //                 child: Row(
//                                   //                   children: [
//                                   //                     Checkbox(
//                                   //                         activeColor: Colors
//                                   //                             .blue.shade400,
//                                   //                         tristate: false,
//                                   //                         value: isChecked3,
//                                   //                         onChanged: (value) {
//                                   //                           setState(() {
//                                   //                             isChecked3 =
//                                   //                                 value;
//                                   //                           });
//                                   //                         }),
//                                   //                     SizedBox(
//                                   //                         width: MediaQuery.of(
//                                   //                                     context)
//                                   //                                 .size
//                                   //                                 .width *
//                                   //                             0.018),
//                                   //                     Text('En cours'),
//                                   //                   ],
//                                   //                 ),
//                                   //               ),
//                                   //             ],
//                                   //           ),
//                                   //           Container(
//                                   //               margin: EdgeInsets.symmetric(
//                                   //                   horizontal: 25),
//                                   //               child: Divider(
//                                   //                   color: const Color.fromRGBO(
//                                   //                       179, 179, 179, 1),
//                                   //                   thickness: 1)),
//                                   //           Column(
//                                   //             children: [
//                                   //               Row(
//                                   //                 mainAxisAlignment:
//                                   //                     MainAxisAlignment.start,
//                                   //                 children: [
//                                   //                   Padding(
//                                   //                     padding: const EdgeInsets
//                                   //                             .symmetric(
//                                   //                         horizontal: 48,
//                                   //                         vertical: 10),
//                                   //                     child: Text(
//                                   //                       'Les types',
//                                   //                       style: TextStyle(
//                                   //                           fontWeight:
//                                   //                               FontWeight.w500,
//                                   //                           fontFamily:
//                                   //                               "Poppins"),
//                                   //                     ),
//                                   //                   ),
//                                   //                 ],
//                                   //               ),
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets
//                                   //                         .symmetric(
//                                   //                     horizontal: 24),
//                                   //                 child: Row(
//                                   //                   children: [
//                                   //                     Checkbox(
//                                   //                         activeColor: Colors
//                                   //                             .blue.shade400,
//                                   //                         tristate: false,
//                                   //                         value: isChecked4,
//                                   //                         onChanged: (value) {
//                                   //                           setState(() {
//                                   //                             isChecked4 =
//                                   //                                 value;
//                                   //                           });
//                                   //                         }),
//                                   //                     SizedBox(width: 15),
//                                   //                     Text('congé'),
//                                   //                   ],
//                                   //                 ),
//                                   //               ),
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets
//                                   //                         .symmetric(
//                                   //                     horizontal: 24),
//                                   //                 child: Row(
//                                   //                   children: [
//                                   //                     Checkbox(
//                                   //                         activeColor: Colors
//                                   //                             .blue.shade400,
//                                   //                         tristate: false,
//                                   //                         value: isChecked4,
//                                   //                         onChanged: (value) {
//                                   //                           setState(() {
//                                   //                             isChecked4 =
//                                   //                                 value;
//                                   //                           });
//                                   //                         }),
//                                   //                     SizedBox(width: 15),
//                                   //                     Text('maladie'),
//                                   //                   ],
//                                   //                 ),
//                                   //               ),
//                                   //             ],
//                                   //           ),
//                                   //         ],
//                                   //       ),
//                                   //     );
//                                   //   },
//                                   // );
//                                   //   showCupertinoModalPopup(
//                                   //     context: context,
//                                   //     builder: (BuildContext context) {
//                                   //       return CupertinoActionSheet(
//                                   //         title: Text(
//                                   //           'Les filtres',
//                                   //           style:
//                                   //               TextStyle(fontFamily: "Poppins"),
//                                   //         ),
//                                   //         actions: <Widget>[
//                                   //           CupertinoActionSheetAction(
//                                   //             onPressed: () {},
//                                   //             child: Row(
//                                   //               mainAxisAlignment:
//                                   //                   MainAxisAlignment
//                                   //                       .spaceBetween,
//                                   //               children: [
//                                   //                 Column(
//                                   //                   children: [
//                                   //                     Row(
//                                   //                       mainAxisAlignment:
//                                   //                           MainAxisAlignment
//                                   //                               .start,
//                                   //                       children: [
//                                   //                         Padding(
//                                   //                           padding:
//                                   //                               const EdgeInsets
//                                   //                                       .symmetric(
//                                   //                                   horizontal:
//                                   //                                       48,
//                                   //                                   vertical: 10),
//                                   //                           child: Text(
//                                   //                             'Status',
//                                   //                             style: TextStyle(
//                                   //                                 fontWeight:
//                                   //                                     FontWeight
//                                   //                                         .w500,
//                                   //                                 fontFamily:
//                                   //                                     "Poppins"),
//                                   //                           ),
//                                   //                         ),
//                                   //                       ],
//                                   //                     ),
//                                   //                     Padding(
//                                   //                       padding: const EdgeInsets
//                                   //                               .symmetric(
//                                   //                           horizontal: 24),
//                                   //                       child: Row(
//                                   //                         children: [
//                                   //                           Checkbox(
//                                   //                               activeColor:
//                                   //                                   Colors.blue
//                                   //                                       .shade400,
//                                   //                               tristate: false,
//                                   //                               value: isChecked1,
//                                   //                               onChanged:
//                                   //                                   (value) {
//                                   //                                 setState(() {
//                                   //                                   isChecked1 =
//                                   //                                       value;
//                                   //                                 });
//                                   //                               }),
//                                   //                           SizedBox(
//                                   //                               width: MediaQuery.of(
//                                   //                                           context)
//                                   //                                       .size
//                                   //                                       .width *
//                                   //                                   0.018),
//                                   //                           Text('Approuvé'),
//                                   //                         ],
//                                   //                       ),
//                                   //                     ),
//                                   //                   ],
//                                   //                 )
//                                   //               ],
//                                   //             ),
//                                   //           ),
//                                   //           CupertinoActionSheetAction(
//                                   //             child: Row(
//                                   //               mainAxisAlignment:
//                                   //                   MainAxisAlignment
//                                   //                       .spaceBetween,
//                                   //               children: [],
//                                   //             ),
//                                   //             onPressed: () {},
//                                   //           ),
//                                   //           CupertinoActionSheetAction(
//                                   //             child: Row(
//                                   //               mainAxisAlignment:
//                                   //                   MainAxisAlignment
//                                   //                       .spaceBetween,
//                                   //               children: [],
//                                   //             ),
//                                   //             onPressed: () {},
//                                   //           ),
//                                   //           CupertinoActionSheetAction(
//                                   //             child: Row(
//                                   //               mainAxisAlignment:
//                                   //                   MainAxisAlignment
//                                   //                       .spaceBetween,
//                                   //               children: [],
//                                   //             ),
//                                   //             onPressed: () {},
//                                   //           ),
//                                   //         ],
//                                   //       );
//                                   //     },
//                                   //   );
//                                 },
//                                 child:
//                                     Icon(CupertinoIcons.list_bullet, size: 28)),
















