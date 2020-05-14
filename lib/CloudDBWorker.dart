///
/// App Name: QNote
/// Authors: Stefany Carrillo & Cristian Ayub
/// Instructor: Dr. Yonsiik Cheon
/// Course: CS 4320/5318
///

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDBWorker {

  static final databaseReference = Firestore.instance;
  List<dynamic> imagePaths = List<dynamic>();

  CloudDBWorker();

  /// Retrieves images stored in cloud
  void getImagesFromCloud() {
    databaseReference.collection('folders').document('test').get().then((v) => imagePaths = v.data["images"]);
  }

  /// Saves images in the indicated folder on the cloud
  void saveInCloud(String folder) async {
    try {
      await databaseReference
          .collection('folders')
          .document(folder)
          .setData({
        'images': imagePaths,
      });
    } catch (e) {
      print(e);
    }
    print('Successfully Uploaded to Cloud');
  }
}