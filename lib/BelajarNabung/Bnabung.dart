import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';


class Bnabung extends StatefulWidget {
  const Bnabung({Key key}) : super(key: key);

  @override
  _BnabungState createState() => _BnabungState();
}

class _BnabungState extends State<Bnabung> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.asset("assets/videos.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
          flickManager: flickManager
      ),
    );
  }
}



