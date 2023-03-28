import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController idController;
  late TextEditingController serverController;

  bool isSatu = false;
  bool isDua = false;
  bool inResultPage = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return inResultPage
        ? buildResultPage(context)
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "GameZone",
                style: TextStyle(color: Color.fromARGB(255, 20, 3, 78)),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Color.fromARGB(249, 223, 191, 9),
            ),
            drawer: Drawer(
              backgroundColor: Color.fromARGB(249, 223, 191, 9),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 3, 216, 253)),
                    child: Text("GameZone"),
                  ),
                  ListTile(
                    title: Text("Free Fire"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("PUBG Mobile"),
                    onTap: () {},
                  )
                ],
              ),
            ),
            body: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                buildHeader(context),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "ID Akun",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    hintText: "Masukkan ID Akun",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Server Akun",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextField(
                    controller: serverController,
                    decoration: InputDecoration(
                        hintText: "Masukkan Server Akun",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        value: isSatu,
                        onChanged: (value) {
                          setState(() {
                            isSatu = !isSatu;
                          });
                        },
                      ),
                      title: Text("3 Diamond"),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: isDua,
                        onChanged: (value) {
                          setState(() {
                            isDua = !isDua;
                          });
                        },
                      ),
                      title: Text("11 Diamond"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Light Mode"),
                    Switch(
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          isDark = value;
                        });
                        print(isDark);
                      },
                    )
                  ],
                )
              ],
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    serverController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    serverController.dispose();
  }

  Widget buildHeader(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text("Mobile Legend"),
        Expanded(
          child: SizedBox(),
        ),
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              idController.clear();
              serverController.clear();
              isSatu = false;
              isDua = false;
            });
          },
          icon: Icon(Icons.cancel_outlined),
          label: Text("Reset"),
        ),
        SizedBox(
          width: 2,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(
              width: 8,
              color: Colors.lightBlueAccent,
            ),
          ),
          onPressed: () {},
          child: Text("Cancel"),
        ),
        SizedBox(
          width: 2,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
          onPressed: () {
            setState(() {
              inResultPage = true;
            });
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }

  Widget buildResultPage(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Profil"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text("ID Akun : ${idController.text}"),
          SizedBox(
            width: width2,
          ),
          Text("Server Akun : ${serverController.text}"),
          SizedBox(
            width: width2,
          ),
          Text("Jumlah Diamond Yang dibeli : ${isSatu}"),
          SizedBox(
            width: width2,
          ),
          Text("Jumlah Diamond Yang dibeli : ${isDua}"),
          SizedBox(
            width: width2,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                inResultPage = false;
              });
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
