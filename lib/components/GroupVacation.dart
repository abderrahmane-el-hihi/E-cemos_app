import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Pages/LeaveDetailsPage.dart';
import '../components/button.dart';

class GroupVacation extends StatefulWidget {
  String? Name;
  String Photo;
  DateTime? PostDate;
  Future? data;
  int id;

  GroupVacation({
    super.key,
    required this.Name,
    required this.Photo,
    required this.PostDate,
    required this.data,
    required this.id,
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
                    builder: (context) => LeaveDetailsPage(
                          data: widget.data,
                          id: widget.id,
                        )),
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
