import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:master_ung_tutorial/listview/tutorial_listview.dart';
import 'package:master_ung_tutorial/models/tutorial_model.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  // Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> streamSubscriptions;
  List<DocumentSnapshot> lists;
  List<TutorialModel> tutorialModels = [];

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFierStore();
  }

  Future<void> readFierStore() async {
    CollectionReference collectionReference = fireStore.collection('Tutorial');
    streamSubscriptions =
        await collectionReference.snapshots().listen((dataSnapshop) {
      lists = dataSnapshop.documents;

      setState(() {
        for (var list in lists) {
        String nameVideo = list.data['NameVideo'];
        String detailVideo = list.data['DetailVideo'];
        String pathImage = list.data['PathImage'];
        String pathVideo = list.data['PathVideo'];

        TutorialModel tutorialModel =
            TutorialModel(detailVideo, nameVideo, pathImage, pathVideo);

        tutorialModels.add(tutorialModel);
      }
      });


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Video'),
      ),
      body: TutorialListView(tutorialModels),
    );
  }
}
