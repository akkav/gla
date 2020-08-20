import 'package:flutter/material.dart';
import '../pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:canteen/src/pages/homepage.dart';

class loginpage extends StatefulWidget {
  loginpage({Key key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _toggleVisibility = true;
  String _email;
  String _username;
  String _password;

  Widget Emailtextfield() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email or Username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String email) {
        _email = email;
      },
      validator: (String email) {
        String errorMessage;
        if (!email.contains("@")) {
          errorMessage = "Your email is incorrect";
        }
        if (email.isEmpty) {
          errorMessage = "Your email field is required";
        }

        return errorMessage;
      },
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
      onSaved: (String password) {
        _password = password;
      },
      validator: (String password) {
        String errorMessage;

        if (password.isEmpty) {
          errorMessage = "Your password is required";
        }
        return errorMessage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: Column(
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
              _OnLoginButton(),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => signup()));
                      },
                      child: Text(
                        'SignUp.',
                        style: TextStyle(
                            fontFamily: 'Thasadith',
                            color: Colors.green,
                            fontSize: 22),
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

  Widget _OnLoginButton() {
    return GestureDetector(
      onTap: () {
        _OnSubmitLogin();
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
        child: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Thasadith'),
          ),
        ),
      ),
    );
  }

  void _OnSubmitLogin() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        firebaseAuth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homepagescreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
