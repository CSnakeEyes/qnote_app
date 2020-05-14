import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DatabaseService.dart';
import 'PeopleList.dart';


/// main tab for People/Friends tab, calls PeopleList to create
/// the list view of all the friends inside the db
class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Friend>>.value(
      value: DatabaseService().friends,
      child: Scaffold(
        body: PeopleList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white
          ),
          onPressed:() => _showAddPanel(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      )
    );
  }
}

void _showAddPanel(BuildContext c) {
  showModalBottomSheet(context: c, builder: (c) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: AddFriend()
    );
  });
}

/// AddFriend class takes care of creating the Form inside of a
/// ModalBottomSheet to add friends using the floating add button
class AddFriend extends StatefulWidget {
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {

  final _formKey = GlobalKey<FormState>();
  String _currName;
  String _currUsername;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Add a friend!',
            style: TextStyle(fontSize: 18)
          ),
          SizedBox(height: 20),
          _nameTextFormField(),
          SizedBox(height: 20),
          _usernameTextFormField(),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.pink[200],
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              DatabaseService().updateFriendData(_currName, _currUsername);
              Navigator.of(context).pop();
            }
          )
        ],
      ),
    );
  }

  TextFormField _nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Friend Name',
        icon: Icon(
          Icons.verified_user,
          color: Colors.lightGreen
        ),
      ),
      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
      onChanged: (val) => setState(() => _currName = val),
    );
  }

  TextFormField _usernameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Friend Email',
        icon: Icon(
            Icons.mail,
            color: Colors.lightGreen
        ),
      ),
      validator: (val) => val.isEmpty ? 'Please enter a valid user' : null,
      onChanged: (val) => setState(() => _currUsername = val),
    );
  }

}
