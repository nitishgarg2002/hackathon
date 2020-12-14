import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRegister extends StatefulWidget {
  @override
  _CustomRegisterState createState() => _CustomRegisterState();
}

class _CustomRegisterState extends State<CustomRegister> {
   final _auth = FirebaseAuth.instance;
  UserCredential userCredential;
  final _key = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  String email;
  String password;
  String name;
  bool credentialTrue = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Image(
        image: AssetImage(
          'assets/images/login.png',
        ),
        alignment: Alignment.centerRight,
        height: 240.0,
      ),
      Container(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                SizedBox(
                  width: 120.0,
                ),
                Icon(
                  Icons.person_add,
                  color: Colors.pink[300],
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    'Register',
                    overflow: TextOverflow.visible,
                    softWrap: false,
                    style: GoogleFonts.varelaRound(fontSize: 25.0),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(children: [
                SizedBox(
                  height: 90.0,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: TextFormField(
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: _textEditingController,
                    onChanged: (val) {
                      name = val;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.account_box,
                        size: 20.0,
                        color: Colors.pink[300],
                      ),
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                      prefixIcon: Icon(
                        FontAwesomeIcons.userAlt,
                        size: 20.0,
                        color: Colors.pink[300],
                      ),
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
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 20.0,
                        color: Colors.pink[300],
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 10.0,
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
                              'Register',
                              style: GoogleFonts.varelaRound(fontSize: 17),
                            ),
                          ),
                          onPressed: () async{
                            try {
                            userCredential =  await _auth.createUserWithEmailAndPassword(email: email, password: password,);
     

       FirebaseFirestore.instance
      .collection('users').doc(userCredential.user.uid).set({
          'name': name,
         'email': email,
         'password': password,
      
       });
                            } on  PlatformException catch (err) {
       var message = 'An error occured, please check your credentials!';

       if(err.message!= null) {
         message = err.message;
       }

       Scaffold.of(context).showSnackBar(
         SnackBar(
          content: Text(message), 
          backgroundColor: Theme.of(context).errorColor,
         ),
         );
         
     } on FirebaseAuthException catch (err) {
       print(err);
       Scaffold.of(context).showSnackBar(SnackBar(
         content: Text(err.message,textAlign: TextAlign.center,),
         backgroundColor: Theme.of(context).errorColor,
       ));
       
                          
     }}),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "back",
                        child: IconButton(
                            padding: EdgeInsets.all(5),
                            color: Colors.pink[300],
                            splashColor: Colors.pinkAccent,
                            iconSize: 40,
                            icon: Icon(FontAwesomeIcons.arrowAltCircleLeft),
                            onPressed: () {}),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Already have an Account?",
                        style: GoogleFonts.varelaRound(
                            fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      )),
    ]);
  }
}
