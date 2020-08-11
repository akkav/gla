import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loginpage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 200.0,
                  height: 200.0,
                  margin: EdgeInsets.only(top: 250.0, bottom: 40.0),
                  child: Image.asset("images/gla.png")),
              Text(
                "Welcome to canteen",
                style: TextStyle(
                    fontFamily: 'Chilanka',
                    fontSize: 35.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
