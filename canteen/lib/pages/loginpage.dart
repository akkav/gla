import 'package:flutter/material.dart';
import '../pages/signup.dart';

class loginpage extends StatefulWidget {
  loginpage({Key key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  Widget Emailtextfield() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email or Username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget Passwordtextfield() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 100.0, bottom: 10.0),
              child: Image.asset('images/applogo.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 20.0, right: 10.0),
              child: Text(
                'Happy to serve you',
                style: TextStyle(
                    fontFamily: 'Chilanka',
                    fontSize: 35.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Container(
              child: Text(
                '                         Forgotten password?',
                style: TextStyle(
                    fontFamily: 'Chilanka',
                    fontSize: 17.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Emailtextfield(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Passwordtextfield(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Center(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Thasadith'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Do not have an account?',
                    style: TextStyle(
                        color: Color(0xFFBDC2CB),
                        fontSize: 20.0,
                        fontFamily: 'Thasadith'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signup(),
                        ),
                      );
                    },
                  ),
                  Text(
                    'SignUp.',
                    style: TextStyle(
                        fontFamily: 'Thasadith',
                        color: Colors.green,
                        fontSize: 22),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
