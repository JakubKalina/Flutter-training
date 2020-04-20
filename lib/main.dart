import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_notes/screens/AddNew.dart';
import 'package:user_notes/screens/GetAll.dart';
import 'package:user_notes/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Notes Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/GetAll': (context) => GetAll(),
        '/AddNew': (context) => AddNew()
      },
    );
  }
}
