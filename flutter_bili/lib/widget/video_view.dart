import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart' hide MaterialControls;
import 'package:video_player/video_player.dart';
import 'package:flutter_bili/widget/hi_video_controls.dart';

//播放器组件
class VideoView extends StatefulWidget {

  final String url;
  final String? cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;

  const VideoView( this.url, {Key? key,
    this.cover,
    this.autoPlay = false,
    this.looping = false,
    this.aspectRatio = 16 / 9
  }) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {

   late VideoPlayerController _videoPlayerController; //video_player播放器Controller
   late ChewieController? _chewiewController; //cheview 播放器Controller

  @override
  void initState() {
    super.initState();
    // 初始化播放器设置
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewiewController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: widget.aspectRatio,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        customControls:  const MaterialControls()
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewiewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double palyerHeight = screenWidth / widget.aspectRatio;
    return Container(
      width: screenWidth,
      height: palyerHeight,
      color: Colors.grey,
      child: Chewie(controller: _chewiewController!),
    );
  }
}






















