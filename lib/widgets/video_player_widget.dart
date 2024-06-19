import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoPlayer extends StatefulWidget {
  const BackgroundVideoPlayer({super.key});

  @override
  _BackgroundVideoPlayerState  createState() => _BackgroundVideoPlayerState();
}

class _BackgroundVideoPlayerState extends State<BackgroundVideoPlayer> {
  late VideoPlayerController _controller;
  int _currentVideoIndex = 0;
  final List<String> _videoPaths = [
    'images/videos/login_video1.mp4',
    'images/videos/login_video2.mp4',
    'images/videos/login_video3.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _initializeAndPlay(_currentVideoIndex);
  }

  void _initializeAndPlay(int index) {
    _controller = VideoPlayerController.asset(_videoPaths[index])
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(false);
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _changeVideo();
          }
        });
      });
  }

  void _changeVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex + 1) % _videoPaths.length;
      _controller.dispose();
      _initializeAndPlay(_currentVideoIndex);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }
}
