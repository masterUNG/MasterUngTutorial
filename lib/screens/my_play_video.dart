import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:auto_orientation/auto_orientation.dart';

class MyPlayVideo extends StatefulWidget {
  final String urlVideoString;
  MyPlayVideo({Key key, this.urlVideoString}) : super(key: key);

  @override
  _MyPlayVideoState createState() => _MyPlayVideoState();
}

class _MyPlayVideoState extends State<MyPlayVideo> {
  // Explicit
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  // Method
  @override
  void initState() {
    super.initState();

    // Set Orintation
    // AutoOrientation.landscapeLeftMode();

    // Setup Video
    videoPlayerController =
        VideoPlayerController.network(widget.urlVideoString);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20.0),
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
