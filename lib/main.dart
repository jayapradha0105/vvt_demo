import 'package:vvt_demo/View/dashboard.dart';
import 'package:vvt_demo/View/splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VVT Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
      ),
      debugShowCheckedModeBanner: false,
      home:Splash(),
    );
  }
}
