import 'package:flutter/material.dart';
import 'BaseAuth.dart';
import 'RootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QNote',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RootPage(auth: Authentication()),
    );
  }
}

