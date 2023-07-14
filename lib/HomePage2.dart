import 'package:flutter/material.dart';
import 'package:cemos_app/components/textfield.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

final searchcontroller = TextEditingController();

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Bonjour.',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(131, 172, 64, 1),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 64,
                    color: Colors.grey.shade300,
                  ),
                  Text(
                    'Nom Prenom',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text_Field(
                controller: searchcontroller,
                hinText: 'Rechercher... ',
                obsecureText: false,
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      child: InkWell(
                        splashColor:
                            Color.fromRGBO(131, 172, 64, 1).withAlpha(30),
                        onTap: () {},
                        child: SizedBox(
                          width: 120,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Droit annuel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor:
                            Color.fromRGBO(131, 172, 64, 1).withAlpha(30),
                        onTap: () {},
                        child: SizedBox(
                          width: 120,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Reste d\'anne\nderniere'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor:
                            Color.fromRGBO(131, 172, 64, 1).withAlpha(30),
                        onTap: () {},
                        child: SizedBox(
                          width: 120,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Container(
                                //   height: 50,
                                //   width: 50,
                                //   decoration: BoxDecoration(
                                //     color: const Color.fromARGB(
                                //         255, 255, 255, 255),
                                //     borderRadius: BorderRadius.circular(30),
                                //   ),
                                //   child: Icon(Icons.calendar_month_rounded),
                                // ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Consommation'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reste',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(131, 172, 64, 1),
                        ),
                      ),
                      child: Center(child: Text('10')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Les demandes',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    // Container(
                    //   width: 10,
                    //   height: 10,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.red,
                    //   ),
                    // ),
                    // SizedBox(width: 10),
                    // Container(
                    //   width: 10,
                    //   height: 10,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.orange,
                    //   ),
                    // ),
                    // SizedBox(width: 10),
                    // Container(
                    //   width: 10,
                    //   height: 10,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.green,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color.fromRGBO(131, 172, 64, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              height: 60,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'demande',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins"),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'validee',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Poppins"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
