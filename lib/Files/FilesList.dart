import 'dart:io';

import 'package:flutter/material.dart';

import '../CloudDBWorker.dart';
import '../utils.dart';

class FilesList extends StatelessWidget {
  final String folderName;

  FilesList({this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: setAppTitle('Notes'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
          child: StreamBuilder(
            stream: CloudDBWorker.databaseReference.collection('folders').document(folderName).snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return LinearProgressIndicator();
              }
              var images = snapshot.data['images'];
              print(images);
              return GridView.count(
                padding: EdgeInsets.all(10.0),
                primary: false,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: images.map<Widget>((image) => _buildCardItem(image)).toList(),
              );
            },
          ),
        ),]
      ),
    );
  }

  Widget _buildCardItem(String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 8.0,
        child: Card(
          clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              child: Text('Image Place holder'),
            ),
        )
      ),
    );
  }
}