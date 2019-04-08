import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/drajat_page.dart';
import 'package:login/firebase.dart';
import 'package:login/firebase_app.dart';
import 'package:login/home_page.dart';
import 'package:login/nateja.dart';

import 'login_page.dart';

 Future<void> main() async {
   FirebaseAppService firebaseAppService = new FirebaseAppService();
   final FirebaseApp firebaseApp = await firebaseAppService.getFirebaseApp(Platform.isIOS);
   FirebaseService firebaseService = new FirebaseService();
   firebaseService.initialFirebaseApp(firebaseApp);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    DarajatPage.tag: (context) => DarajatPage(),
    nateja.tag: (context) => nateja(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دليل الطالب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
