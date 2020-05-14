///
/// App Name: QNote
/// Authors: Stefany Carrillo & Cristian Ayub
/// Instructor: Dr. Yonsiik Cheon
/// Course: CS 4320/5318
///

import 'package:flutter/material.dart';
import 'package:notes_app/ProfilePage.dart';
import 'package:notes_app/utils.dart';
import 'BaseAuth.dart';
import 'Camera/Camera.dart';
import 'Files/Files.dart';
import 'People/People.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
    : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<dynamic> _widgetOptions = [
    Files(),
    Camera(),
    People(),
  ];

  /// Allows selection of BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Creates logout button
  Widget _logOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: (){
        _signOut();
      },
    );
  }

  /// Ends user session in the app
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch(e) {
      print(e);
    }
  }

  /// Creates profile button
  Widget _profileButton() {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ProfilePage())
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: setAppTitle('QNote'),
        leading: _profileButton(),
        actions: <Widget>[
          _logOutButton(),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Files'),           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('People'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
