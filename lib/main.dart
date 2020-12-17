import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/home_screen.dart';
import 'package:hackathon/models/auth_model.dart';
import 'package:hackathon/widgets/home_page.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>HomeModel(),
          child: MaterialApp(
        
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        
        home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx,userSnapshot) {
                if(userSnapshot.hasData){
                  return HomeScreen();
                }
                return HomePage();
              },
            ),
      ),
    );
  }
}





