import 'package:flutter/material.dart';
import 'package:master_ung_tutorial/models/tutorial_model.dart';
import 'package:master_ung_tutorial/screens/my_play_video.dart';
import 'package:master_ung_tutorial/screens/video_list.dart';

class TutorialListView extends StatelessWidget {
  List<TutorialModel> tutorialModels;
  TutorialListView(this.tutorialModels);

  Widget showName(int index) {
    return Text(tutorialModels[index].nameVideo);
  }

  Widget showDetail(int index) {
    return Text(tutorialModels[index].detailVideo);
  }

  Widget showImageTutorial(int index) {
    return Container(
      height: 100.0,
      width: 150.0,
      child: Image.network(
        tutorialModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget groupText(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tutorialModels.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
          child: Container(
            child: Row(
              children: <Widget>[
                showImageTutorial(index),
                groupText(index),
              ],
            ),
          ),
          onTap: () {
            print('You Click ==> $index');

            var videoRoute = MaterialPageRoute(
                builder: (BuildContext context) => MyPlayVideo(urlVideoString: tutorialModels[index].pathVideo,));
            Navigator.of(context).push(videoRoute);
          },
        );
      },
    );
  }
}
