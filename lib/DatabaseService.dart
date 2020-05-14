import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/People/PeopleList.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference friendsCollection = Firestore.instance.collection('friends');

  Future makeCollections(String name, String username) async {
    return await friendsCollection.document(uid).collection('friend_list').document().setData({
      'name': name,
      'username': username,
    });
  }

  Future updateFriendData(String name, String username) async {
    return await friendsCollection.document(uid).collection('friends_list').document().setData({
      'name': name,
      'username': username,
    });
  }

  List<Friend> _friendListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Friend(
        name: doc.data['name'] ?? '',
        username: doc.data['username'] ?? ''
      );
    }).toList();
  }

  Stream<List<Friend>> get friends {
    return friendsCollection.document(uid).collection('friend_list').snapshots()
      .map(_friendListFromSnapshot);
  }


}