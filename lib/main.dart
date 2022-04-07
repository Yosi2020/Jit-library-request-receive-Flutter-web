import "package:flutter/material.dart";
import 'package:lib_system/Homepage/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({Key key}):super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Library book web",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done){
            return HomePage();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}