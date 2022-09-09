import 'package:flutter/material.dart';
import 'package:flutter_bili/widget/video_view.dart';

class VideoDetailPage extends StatefulWidget {
  
  const VideoDetailPage({Key? key}) : super(key: key);
  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _videoView()
        ],
      )
    );
  }
  
  _videoView() {
    return const VideoView("https://vd4.bdstatic.com/mda-nhq3usnvwdj6gd3y/sc/cae_h264/1661404518189008420/mda-nhq3usnvwdj6gd3y.mp4?v_from_s=hkapp-haokan-hnb&auth_key=1661527987-0-0-382a6474fd399d3af5daec8cd8787539&bcevod_channel=searchbox_feed&cd=0&pd=1&pt=3&logid=0187232427&vid=17538670557467237585&abtest=103742_1-104165_1&klogid=0187232427");
  }
  
}
















