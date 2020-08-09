import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.only(top: 90.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/gla.png'),
                      width: 70.0,
                      height: 60.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.only(top: 265.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'GLA                 ',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.5,
                                fontFamily: 'Chilanka'),
                          ),
                          Text(
                            'CANTEEN',
                            style: TextStyle(
                                fontSize: 30.5,
                                color: Colors.white,
                                fontFamily: 'Chilanka',
                                letterSpacing: 3.5),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
