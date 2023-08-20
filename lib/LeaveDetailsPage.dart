import 'package:cemos_app/SwitchPages.dart';
import 'package:cemos_app/models/DemandeAbscence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'components/button.dart';
import 'models/service.dart';

class LeaveDetailsPage extends StatefulWidget {
  const LeaveDetailsPage({super.key});

  @override
  State<LeaveDetailsPage> createState() => _LeaveDetailsPageState();
}

class _LeaveDetailsPageState extends State<LeaveDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Consumer<ButtonStateModel>(
          builder: (context, buttonState, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.018),
                          const Text(
                            'Détails du congé',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Titre',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const Text(
                            'Titre',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type du congé',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const Text(
                            'Type du congé',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          Text(
                            '${DateFormat('d MMM yyyy').format(DateTime.now())} - ${DateFormat('d MMM yyyy').format(DateTime.now())}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appliqué le',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          Text(
                            DateFormat('d MMM yyyy').format(DateTime.now()),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Telephone',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const Text(
                            '0666666666',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fichiers joints',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const Text(
                            'Fichier',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (buttonState.isRejectVisible)
                            InkWell(
                              onTap: () {
                                buttonState.hideAcceptButton();
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        content: const Text(
                                          'La demande rejeter\navec succès',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text(
                                              'D\'accord',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SwitchPages()));
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              splashColor: const Color.fromARGB(150, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color:const Color.fromARGB(220, 239, 83, 80),
                                  color: buttonState.Rejectclr,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      const Icon(CupertinoIcons.xmark_circle,
                                          color: Colors.white),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        // 'Rejeter',
                                        buttonState.Rejectbtn,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.06,
                          ),
                          if (buttonState.isAcceptVisible)
                            InkWell(
                              onTap: () {
                                buttonState.hideRejectButton();
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        content: const Text(
                                          'La demande accepter\navec succès',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text(
                                              'D\'accord',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SwitchPages()));
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              splashColor: const Color.fromARGB(150, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  // color: const Color.fromARGB(220, 102, 187, 106),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        // 'Accepter',
                                        buttonState.Acceptbtn,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
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
            );
          },
        ),
      ),
    );
  }
}

class Demandedetails extends StatefulWidget {
  const Demandedetails({super.key});

  @override
  State<Demandedetails> createState() => _DemandedetailsState();
}

class _DemandedetailsState extends State<Demandedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Demande',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          FutureBuilder(
              future: RemoteService().getDemandeList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<DemandeAbscence> demandes = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date de conge',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                'De: ${demandes[1].dateDebut} \njusqu\'a: ${demandes[1].dateFin}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duree d\'abscence',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                '${demandes[1].dureAbsence?.toInt()} jours',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Telephone',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                '${demandes[1].telAbsence}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Validation',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade400),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Par chef: ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(24, 255, 168, 38),
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'En cours',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Par RH: ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(24, 255, 168, 38),
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'En cours',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02),
                      ],
                    ),
                  );
                }
                return Center();
              }),
        ],
      )),
    );
  }
}
