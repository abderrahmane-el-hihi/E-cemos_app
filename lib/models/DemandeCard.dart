import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Pages/LeaveDetailsPage.dart';
import '../components/button.dart';

class DemandeCard extends StatefulWidget {
  String? DemandeType;
  String? date;
  // String? Status;
  int? dureeabscence;
  String? Telephone;
  String? ValidationRH;
  String? ValidationChef1;
  String? ValidationChef2;
  List? data;
  DemandeCard({
    super.key,
    required this.DemandeType,
    required this.date,
    // required this.Status,
    required this.dureeabscence,
    required this.Telephone,
    required this.ValidationRH,
    required this.ValidationChef1,
    required this.ValidationChef2,
    required this.data,
  });

  @override
  State<DemandeCard> createState() => _DemandeCardState();
}

class _DemandeCardState extends State<DemandeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.DemandeType ?? "",
                            style: const TextStyle(
                                color: Colors.black, fontFamily: "Poppins"),
                          ),
                          Text(
                            // '${DateFormat('MMM d, yyyy').format(DateTime.now())} - ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
                            widget.date ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontSize: 12),
                          )
                        ],
                      ),
                      widget.ValidationRH == null ||
                              widget.ValidationRH == "Pending" ||
                              widget.ValidationChef1 == null ||
                              widget.ValidationChef1 == "Pending" ||
                              widget.ValidationChef2 == null ||
                              widget.ValidationChef2 == "Pending"
                          ? Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(24, 255, 168, 38),
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                'En cours',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange.shade400,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          : widget.ValidationRH == "Approved" &&
                                      widget.ValidationChef1 == "Approved" ||
                                  widget.ValidationRH == "Approved" &&
                                      widget.ValidationChef1 == "Pending" ||
                                  widget.ValidationRH == "Pending" &&
                                      widget.ValidationChef1 == "Approved"
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          24, 102, 187, 106),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    'Approuvé',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green.shade400,
                                        fontFamily: "Poppins"),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(24, 239, 83, 80),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    'Refusé',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red.shade400,
                                        fontFamily: "Poppins"),
                                  ),
                                )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Durée d\'abscence',
                            style:
                                TextStyle(fontSize: 10, fontFamily: "Poppins"),
                          ),
                          Text(
                            '${widget.dureeabscence} Jours',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Téléphone',
                            style:
                                TextStyle(fontSize: 10, fontFamily: "Poppins"),
                          ),
                          Text(
                            '${widget.Telephone}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Approuvé par',
                            style:
                                TextStyle(fontSize: 10, fontFamily: "Poppins"),
                          ),
                          Text(
                            'RH',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     MaterialPageRoute(
                  //         builder: (context) => Demandedetails(
                  //               data: widget.data,
                  //             ));
                  //   },
                  //   borderRadius: BorderRadius.circular(8),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //         color: const Color.fromARGB(24, 102, 187, 106),
                  //         border: Border.all(color: Colors.green.shade400)),
                  //     padding: const EdgeInsets.symmetric(vertical: 8),
                  //     width: MediaQuery.of(context).size.width * 0.5,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const Text("Voir Details"),
                  //         SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.02,
                  //         ),
                  //         const Icon(CupertinoIcons.arrow_right),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.012,
        ),
      ],
    );
  }
}

class GroupVacation extends StatefulWidget {
  String? Name;
  String Photo;
  DateTime? PostDate;

  GroupVacation({
    super.key,
    required this.Name,
    required this.Photo,
    required this.PostDate,
  });

  @override
  State<GroupVacation> createState() => GroupVacationState();
}

class GroupVacationState extends State<GroupVacation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonStateModel>(builder: (context, buttonState, child) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LeaveDetailsPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 4, top: 8),
                    child: Row(
                      children: [
                        widget.Photo == "" || !widget.Photo.contains('https://')
                            ? Icon(
                                Icons.account_circle,
                                size: 64,
                                color: Colors.grey.shade400,
                              )
                            : Image.network(widget.Photo),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.Name ?? "",
                                style: const TextStyle(fontFamily: 'Poppins')),
                            Text(
                              DateFormat('d MMM, yyyy').format(
                                  widget.PostDate ?? DateTime.timestamp()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 8, top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // if (isFirstInkwellVisible)
                        if (buttonState.isRejectVisible)
                          InkWell(
                            // onTap: () =>_onFirstInkwellTap(),
                            onTap: () {
                              buttonState.hideAcceptButton();
                            },
                            splashColor: const Color.fromARGB(150, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: const Color
                                //         .fromARGB(
                                //     220, 239, 83, 80),
                                // color: Rejectclr,
                                color: buttonState.Rejectclr,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    const Icon(CupertinoIcons.xmark_circle,
                                        color: Colors.white),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      // '$Rejectbtn',
                                      buttonState.Rejectbtn,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        // if (isSecondInkwellVisible)
                        if (buttonState.isAcceptVisible)
                          InkWell(
                            // onTap: () =>_onSecondInkwellTap(),
                            onTap: () {
                              buttonState.hideRejectButton();
                            },
                            splashColor: const Color.fromARGB(150, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                // color: const Color
                                //         .fromARGB(
                                //     220, 102, 187, 106),
                                // color: Acceptclr,
                                color: buttonState.Acceptclr,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    const Icon(
                                        CupertinoIcons.checkmark_alt_circle,
                                        color: Colors.white),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      // '$Acceptbtn',
                                      buttonState.Acceptbtn,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
        ],
      );
    });
  }
}
