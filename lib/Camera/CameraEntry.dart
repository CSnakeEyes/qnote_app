///
/// App Name: QNote
/// Authors: Stefany Carrillo & Cristian Ayub
/// Instructor: Dr. Yonsiik Cheon
/// Course: CS 4320/5318
///

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:notes_app/CloudDBWorker.dart';
import 'package:notes_app/utils.dart';

class CameraEntry extends StatelessWidget {
  final String imagePath;
  CloudDBWorker cloudDB = CloudDBWorker();

  CameraEntry({this.imagePath});

  @override
  Widget build(BuildContext context) {

    cloudDB.getImagesFromCloud();

    /// Creates 'Go back' button   
    MaterialButton goBackButton() {
      return MaterialButton(
        child: setButtonText("Go Back"),
        color: Colors.red[600],
        onPressed: (){
          Navigator.pop(context);
        } 
      );
    }

    /// Generates a SnackBar for whenever an image has been saved in cloud
    SnackBar _successSnackBar() {
      return SnackBar(
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2), content: Text('Image Saved Successfully'),
      );
    }

    /// Creates a 'Save' button
    MaterialButton saveButton(BuildContext context) {
      return MaterialButton(
        child: setButtonText("Save"),
        color: Colors.green,
        onPressed: (){
          List<String> images = List<String>.from(cloudDB.imagePaths);
          images.add(imagePath);
          cloudDB.imagePaths = images;
          cloudDB.saveInCloud('test');
          ImageGallerySaver.saveFile(imagePath);
          // Scaffold.of(context).showSnackBar(_successSnackBar());
          Navigator.pop(context);
        } 
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: setAppTitle('Preview Note'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.file(File(imagePath)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              saveButton(context),
              goBackButton()
            ],
          )
        ],
      )
    );
  }
}