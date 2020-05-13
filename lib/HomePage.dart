import 'package:flutter/material.dart';
import 'package:notes_app/ProfilePage.dart';
import 'package:notes_app/utils.dart';
import 'BaseAuth.dart';
import 'Camera/Camera.dart';
import 'Files/Files.dart';
import 'Files/FilesList.dart';
import 'People/People.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _logOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: (){},
    );
  }

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
