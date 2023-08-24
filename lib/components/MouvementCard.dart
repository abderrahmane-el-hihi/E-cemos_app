import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MouvementCard extends StatelessWidget {
  String crdTitle;
  IconData icon;
  String time;
  double width;
  int? size = 24;
  int? fontsize = 12;
  bool isColumn;
  MouvementCard({
    super.key,
    required this.crdTitle,
    required this.icon,
    required this.time,
    required this.width,
    this.size,
    required this.isColumn,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height * 0.135,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          )),
      child: isColumn
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(24, 66, 164, 245),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          icon,
                          // default size 24
                          size: size as double?,
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Text(crdTitle,
                        style: TextStyle(
                          //fontsize = 12
                          fontSize: fontsize as double?,
                        )),
                  ],
                ),
                Text(time,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(24, 66, 164, 245),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          icon,
                          // default size 24
                          size: size as double?,
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Text(crdTitle,
                        style: TextStyle(
                          fontSize: fontsize as double?,
                        )),
                  ],
                ),
                Text(time,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
    );
  }
}
