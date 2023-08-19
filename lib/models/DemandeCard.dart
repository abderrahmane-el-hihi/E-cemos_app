import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemandeCard extends StatefulWidget {
  String? DemandeType;
  String? date;
  // String? Status;
  int? dureeabscence;
  String? Telephone;
  String? ValidationRH;
  String? ValidationChef1;
  String? ValidationChef2;
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
  });

  @override
  State<DemandeCard> createState() => _DemandeCardState();
}

class _DemandeCardState extends State<DemandeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                  color:
                                      const Color.fromARGB(24, 102, 187, 106),
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
                                  color: const Color.fromARGB(24, 239, 83, 80),
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
                        style: TextStyle(fontSize: 10, fontFamily: "Poppins"),
                      ),
                      Text(
                        '${widget.dureeabscence}',
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
                      Text(
                        'Téléphone',
                        style: TextStyle(fontSize: 10, fontFamily: "Poppins"),
                      ),
                      Text(
                        '${widget.Telephone}',
                        style: TextStyle(
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
                      Text(
                        'Approuvé par',
                        style: TextStyle(fontSize: 10, fontFamily: "Poppins"),
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
            ],
          ),
        ),
      ),
    );
  }
}
