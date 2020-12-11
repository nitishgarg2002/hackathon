import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _textEditingController;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 - 100,
          ),
          Center(
              child: Text(
            'Demo',
            style: TextStyle(color: Colors.white, fontSize: 55),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextField(
              controller: _textEditingController,
              onChanged: (val) {
                email = val;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.userAlt),
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextField(
              controller: _textEditingController,
              onChanged: (val) {
                password = val;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.lock),
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
              style: TextStyle(fontSize: 17, color: Colors.white),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: 350,
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedButton(
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10),
                  splashColor: Colors.pinkAccent,
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not having an Account?",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(width: 10),
                Hero(
                  tag: "back_next",
                  child: IconButton(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      splashColor: Colors.pinkAccent,
                      iconSize: 40,
                      icon: Icon(FontAwesomeIcons.arrowAltCircleRight),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
