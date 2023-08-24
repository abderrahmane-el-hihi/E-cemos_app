import 'package:flutter/material.dart';

class VacationBalanceCard extends StatelessWidget {
  Color color;
  Color backgroundColor;
  String data;
  String vacationBalanceString;
  VacationBalanceCard({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.data,
    required this.vacationBalanceString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.135,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: color,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.022),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(vacationBalanceString,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )),
              Text(data,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16, color: color)),
            ],
          ),
        ],
      ),
    );
  }
}
