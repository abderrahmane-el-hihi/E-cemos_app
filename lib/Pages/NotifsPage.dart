import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/button.dart';
import '../services/service.dart';
import 'LeaveDetailsPage.dart';

class NotifsPage extends StatefulWidget {
  const NotifsPage({super.key});

  @override
  State<NotifsPage> createState() => _NotifsPageState();
}

bool isDemande = true;

class _NotifsPageState extends State<NotifsPage> {
  // List<Personnel>? Personnel;
  var Personnel;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Personnel = await RemoteService().GetApiData();
  }

  // list to store clicked listtiles
  Set<int> clickedListTileIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(child: SingleChildScrollView(
        child:
            Consumer<ButtonStateModel>(builder: (context, buttonState, child) {
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.018),
                    const Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.855,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      bool isClicked = clickedListTileIndexes.contains(index);
                      return Column(
                        children: [
                          ListTile(
                              onTap: () {
                                setState(() {
                                  if (!isClicked) {
                                    clickedListTileIndexes.add(index);
                                  }
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LeaveDetailsPage()));
                              },
                              splashColor: Colors.grey.shade200,
                              title: NotifBody(
                                isClicked: isClicked,
                                x: 1,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 16),
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return const Center();
                  })
            ],
          );
        }),
      )),
    );
  }
}

class NotifShape extends StatelessWidget {
  Color? color;
  Color? backgroundClr;
  IconData? iconData;
  NotifShape(
      {super.key,
      required this.color,
      required this.backgroundClr,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundClr, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}

class NotifBody extends StatelessWidget {
  int? x = 1;
  bool? isClicked = false;
  NotifBody({
    super.key,
    this.x,
    this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (x == 1)
              NotifShape(
                color: Colors.red.shade400,
                backgroundClr: const Color.fromARGB(24, 239, 83, 80),
                iconData: CupertinoIcons.xmark,
              )
            else if (x == 2)
              NotifShape(
                color: Colors.blue.shade400,
                backgroundClr: const Color.fromARGB(24, 66, 164, 245),
                iconData: CupertinoIcons.checkmark_alt,
              )
            else
              Icon(
                Icons.account_circle_rounded,
                color: Colors.grey.shade400,
                size: 42,
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  x == 1 ? 'La demande est rejetee' : 'La demande est aprouvee',
                  style: const TextStyle(),
                ),
                Text(
                  DateFormat('d MMM yyyy').format(DateTime.now()),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.01,
          width: MediaQuery.of(context).size.width * 0.02,
          decoration: BoxDecoration(
              color: isClicked! ? Colors.grey.shade100 : Colors.blue.shade400,
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}
