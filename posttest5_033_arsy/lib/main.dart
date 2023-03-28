import 'package:flutter/material.dart';
import 'package:posttest5_033_arsy/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 3, 216, 253)),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebarg = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Muhammad Arsy Dewantara"),
        backgroundColor: Color.fromARGB(249, 223, 191, 9),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 400,
            width: lebarg,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png"))),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(249, 223, 191, 9)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (value) {
                return MainPage();
              }));
            },
            child: Text(
              "Ayo Top Up",
              style: TextStyle(color: Color.fromARGB(255, 20, 3, 78)),
            ),
          )
        ],
      )),
    );
  }
}
