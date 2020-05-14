import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeopleList extends StatefulWidget {

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {

  @override
  Widget build(BuildContext context) {

    final friends = Provider.of<List<Friend>>(context);

    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return FriendTile(friend: friends[index]);
      },
    );
  }
}

class FriendTile extends StatelessWidget {

  final Friend friend;
  FriendTile({ this.friend });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(friend.name),
          subtitle: Text(friend.username),
        )
      ),
    );
  }
}

class Friend {
  final String name;
  final String username;

  Friend ({ this.name, this.username });
}