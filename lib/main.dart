import 'package:flutter/material.dart';
import 'BaseAuth.dart';
import 'RootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// main method starts by calling the root page
  /// for authentication check
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

