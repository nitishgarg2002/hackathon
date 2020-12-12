import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon/home_screen.dart';
import 'package:hackathon/services/auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  String email;
  String password;
  bool credentialTrue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                controller: _textEditingController,
                onChanged: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(FontAwesomeIcons.userAlt),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: TextFormField(
                controller: _textEditingController,
                onChanged: (val) {
                  password = val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
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
                      color: Colors.pink,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      splashColor: Colors.pinkAccent,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      onPressed: () async {
                        _key.currentState.save();
                        _key.currentState.validate();
                        dynamic user = await Authentication()
                            .signIn(email: email, password: password);

                        if (user == null)
                          setState(() {
                            credentialTrue = false;
                          });
                        if (credentialTrue == false)
                          Text(
                            "Wrong username or password",
                            style: TextStyle(color: Colors.red),
                          );
                        if (_key.currentState.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                      }),
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
      ),
    );
  }
}
