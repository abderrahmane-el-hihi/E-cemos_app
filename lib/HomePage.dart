import 'package:cemos_app/MonProfil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'NotifsPage.dart';
import 'models/Personnel.dart';

import 'models/service.dart';

import 'utils/date_utils.dart' as date_util;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    // currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    // final agent = Provider.of<UserDataProvider>(context);
    super.initState();
  }

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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // FutureBuilder(
                      //   future: RemoteService().GetApiData(),
                      //   builder:
                      //       (BuildContext context, AsyncSnapshot snapshot) {
                      //     if (snapshot.hasData) {
                      //       List<Users?> users = snapshot.data;
                      //       return Row(
                      //         children: [
                      //           GestureDetector(
                      //             onTap: () {
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           const MonProfil()));
                      //             },
                      //             child: Icon(
                      //               Icons.account_circle,
                      //               color: Colors.grey.shade400,
                      //               size: 64,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.012),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 users[2]!.name,
                      //                 style: const TextStyle(
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.w500,
                      //                     fontFamily: 'Poppins'),
                      //               ),
                      //               Text(
                      //                 users[2]!.company.name,
                      //                 style: const TextStyle(
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.w400,
                      //                     fontFamily: 'Poppins'),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       );
                      //     }
                      //     return Row(
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) =>
                      //                         const MonProfil()));
                      //           },
                      //           child: Icon(
                      //             Icons.account_circle,
                      //             color: Colors.grey.shade400,
                      //             size: 64,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //             width: MediaQuery.of(context).size.width *
                      //                 0.012),
                      //         const Column(
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   'Nom Prenom',
                      //                   style: TextStyle(
                      //                       fontSize: 18,
                      //                       fontWeight: FontWeight.w500,
                      //                       fontFamily: 'Poppins'),
                      //                 ),
                      //               ],
                      //             ),
                      //             Text(
                      //               'Agent Comercial',
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontWeight: FontWeight.w400,
                      //                   fontFamily: 'Poppins'),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // ),

                      FutureBuilder(
                          future: RemoteService().getPersonnel(1),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              Personnel p = snapshot.data;
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MonProfil()));
                                    },
                                    child: p.photo == "" ||
                                            !p.photo.contains('https://')
                                        ? Icon(
                                            Icons.account_circle,
                                            color: Colors.grey.shade400,
                                            size: 64,
                                          )
                                        : Image.network(p.photo),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.012),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${p.nom} ${p.prenom}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Service IT',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            return Icon(
                              Icons.account_circle,
                              color: Colors.grey.shade400,
                              size: 64,
                            );
                          }),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotifsPage()));
                        },
                        splashColor: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(CupertinoIcons.bell),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        date_util.DateUtils.months[currentDateTime.month - 1] +
                            ' ' +
                            currentDateTime.year.toString(),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green.shade400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currentMonthList.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isCurrentDay =
                          DateTime.now().day == currentMonthList[index].day;

                      return GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isCurrentDay
                                  ? const Color.fromARGB(24, 66, 164, 245)
                                  : Colors.white,
                              border: Border.all(
                                color: isCurrentDay
                                    ? Colors.blue.shade400
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  date_util.DateUtils.weekdays[
                                      currentMonthList[index].weekday - 1],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: isCurrentDay
                                        ? Colors.blue.shade400
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  currentMonthList[index].day.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: isCurrentDay
                                        ? Colors.blue.shade400
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Présence d\'aujourd\'hui',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Color(0xFF66BB6A)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                FutureBuilder(
                    future: RemoteService().GetPreviousEntryData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
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
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade300,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        24, 66, 164, 245),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: const Icon(CupertinoIcons
                                                    .square_arrow_right)),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01),
                                            const Text('Date d\'entrée',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins')),
                                          ],
                                        ),
                                        Text('10:00',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500)),
                                        const Text('A temps',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                            )),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade300,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        24, 66, 164, 245),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: const Icon(CupertinoIcons
                                                    .square_arrow_left)),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01),
                                            const Text('Date sortie',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins')),
                                          ],
                                        ),
                                        Text('18:00',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500)),
                                        const Text('A temps',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                            )),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 110,

                                height:
                                    MediaQuery.of(context).size.height * 0.135,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    24, 66, 164, 245),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              CupertinoIcons.calendar_today,
                                              size: 32,
                                            )),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03),
                                        const Text('Total jours \ntravaillées',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Poppins')),
                                      ],
                                    ),
                                    Text('23',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  height: MediaQuery.of(context).size.height *
                                      0.135,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      )),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      24, 66, 164, 245),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const EdgeInsets.all(4),
                                              child: const Icon(CupertinoIcons
                                                  .square_arrow_right)),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          const Text('Date d\'entrée',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      const Text('No Data',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500)),
                                      const Text('',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          )),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  height: MediaQuery.of(context).size.height *
                                      0.135,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      )),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      24, 66, 164, 245),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const EdgeInsets.all(4),
                                              child: const Icon(CupertinoIcons
                                                  .square_arrow_left)),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          const Text('Date sortie',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      const Text('No Data',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500)),
                                      const Text('',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          )),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.022),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // height: 110,

                              height:
                                  MediaQuery.of(context).size.height * 0.135,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey.shade300,
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  24, 66, 164, 245),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            CupertinoIcons.calendar_today,
                                            size: 32,
                                          )),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                      const Text('Total jours \ntravaillées',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins')),
                                    ],
                                  ),
                                  const Text('No Data',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Votre activite',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.green.shade400)),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoActionSheet(
                                title: const Text(
                                  'vos activites',
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    24, 66, 164, 245),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              // width: 50,
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              child: const Icon(
                                                  CupertinoIcons
                                                      .square_arrow_right,
                                                  size: 30),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.012),
                                            Column(
                                              children: [
                                                const Text('Date d\'entrée',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins')),
                                                Text(
                                                    '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.012),
                                        const Column(
                                          children: [
                                            Text(
                                              '10:30',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              'A temps',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    24, 66, 164, 245),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              // width: 50,
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              child: const Icon(
                                                  CupertinoIcons
                                                      .square_arrow_left,
                                                  size: 30),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.012),
                                            Column(
                                              children: [
                                                const Text('Date sortie',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins')),
                                                Text(
                                                    '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.012),
                                        const Column(
                                          children: [
                                            Text(
                                              '18:00',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              'A temps',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    24, 66, 164, 245),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              child: const Icon(
                                                  CupertinoIcons
                                                      .square_arrow_right,
                                                  size: 30),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.012),
                                            Column(
                                              children: [
                                                const Text('Date d\'entrée',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins')),
                                                Text(
                                                    '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.012),
                                        const Column(
                                          children: [
                                            Text(
                                              '10:30',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              'A temps',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    24, 66, 164, 245),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              // width: 50,
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              child: const Icon(
                                                  CupertinoIcons
                                                      .square_arrow_left,
                                                  size: 30),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.012),
                                            Column(
                                              children: [
                                                const Text('Date sortie',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins')),
                                                Text(
                                                    '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.012),
                                        const Column(
                                          children: [
                                            Text(
                                              '18:00',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              'A temps',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        // child: Text('Voir Tous',
                        //     style: TextStyle(
                        //         color: Colors.blue.shade400,
                        //         fontSize: 12,
                        //         fontFamily: 'Poppins')),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(24, 66, 164, 245),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            'Voir Tous',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue.shade400,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 255, 255, 255),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(24, 66, 164, 245),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: MediaQuery.of(context).size.width * 0.12,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: const Icon(
                                    CupertinoIcons.square_arrow_right,
                                    size: 30),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.012),
                              Column(
                                children: [
                                  const Text('Date d\'entrée',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'Poppins')),
                                  Text(
                                      '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.012),
                          const Column(
                            children: [
                              Text(
                                '10:30',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'A temps',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 255, 255, 255),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(24, 66, 164, 245),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // width: 50,
                                // height: 50,
                                width: MediaQuery.of(context).size.width * 0.12,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: const Icon(
                                    CupertinoIcons.square_arrow_right,
                                    size: 30),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.012),
                              Column(
                                children: [
                                  Text('Date d\'entrée',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'Poppins')),
                                  Text(
                                      '${DateFormat('MMM d, yyyy').format(DateTime.now())} ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.012),
                          const Column(
                            children: [
                              Text(
                                '10:30',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'A temps',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
